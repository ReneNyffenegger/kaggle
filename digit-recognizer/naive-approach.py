import sqlite3
import os.path
import sys

db_file = 'naive-approach.db'

print_characters_to_console = False

pixels_ = 28

def convert_csv_line_to_array(csv_line):
    array = []
    for y in range(0, 28):
        array.append(0)
        for x in range(0, 28):
 
            pixel_value_255 = csv_line[x + 28*y]
 
            if int(pixel_value_255) > 20:
 
               array[y] += 2 ** x
 
               if print_characters_to_console:
                  sys.stdout.write('X')
 
            else:
               if print_characters_to_console:
                  sys.stdout.write(' ')
 
        if print_characters_to_console:
               print ("")
    return array

 
def fill_database():

    if os.path.isfile(db_file):
       os.remove(db_file)


    db = sqlite3.connect(db_file)
    cur = db.cursor()

    create_table_stmt = 'create table trained (i int, ' + (','.join(map(lambda x: 'pixels_' + str(x) + ' int', range(0, 28)))) + ')'
    cur.execute(create_table_stmt)

    csv = open('downloads/train.csv')
    csv.readline() # skip header

    for line_no, line in enumerate(csv):
    
        if line_no % 100 == 0:
           print "Line " + str(line_no)
    
        values = line.split(',')
    
        n = values[0]

        insert_values = convert_csv_line_to_array(values[1:])
    
        cur.execute('insert into trained values (' + ( ','.join(['?']*29)) + ')', [n] + insert_values)
    db.commit()

def predict():
    db = sqlite3.connect(db_file)
    cur = db.cursor()

    out_csv = open('naive-approach-prediction.csv', 'w')
    out_csv.write('ImageId,Label\n')

    csv = open('downloads/test.csv')

    csv.readline() # skip header

    for line_no, line in enumerate(csv):

        best_ratio_so_far= float(0)
        n_of_best_ratio  = None

        count_bits_1     = 0
        count_bits_match = 0

        values_csv = line.split(',')
    
        pixel_int_array = convert_csv_line_to_array(values_csv)

        for r in cur.execute('select * from trained'):
    
            if False: # print_characters_to_console:
    
               print r[0]
               
               for y in range(0, 28):
                   for x in range(0, 28):
    
                       if r[y+1] & 2**x > 0:
                          sys.stdout.write ('X')
                       else:
                          sys.stdout.write (' ')
    
                   print ('')

            for y in range(0, 28):
                for x in range(0, 28):

                    if r[y+1] & 2**x > 0 or pixel_int_array[y] & 2**x > 0:
                       
                       count_bits_1 += 1

                    if r[y+1] & 2**x > 0 and pixel_int_array[y] & 2**x > 0:
                       
                       count_bits_match += 1

            ratio = float(count_bits_match)/count_bits_1

            if ratio > best_ratio_so_far:
               best_ratio_so_far = ratio
               n_of_best_ratio   = r[0]

        print 'Guessed: {}'.format(n_of_best_ratio)

        out_csv.write(str(line_no) + ',' + str(n_of_best_ratio) + '\n')

    out_csv.close()


#fill_database()
predict()
