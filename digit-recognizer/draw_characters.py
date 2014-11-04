import Image

char_width           = 28
char_height          = 28

gap_between_chars    =  2

char_width_with_gap  = char_width  + gap_between_chars
char_height_with_gap = char_height + gap_between_chars

chars_per_line    = 33
char_lines        = 33


img = Image.new('RGB', (chars_per_line * char_width_with_gap +1 , char_lines * char_height_with_gap +1), 'red')
pixels = img.load()

cur_input_line = 0

csv = open('downloads/train.csv')
csv.readline() # skip header

cur_char_x = 0
cur_char_y = 0

for line in csv:
    cur_input_line += 1
    if cur_input_line > char_lines * chars_per_line: break

    cur_x = 0
    cur_y = 0

    values = line.split(',')

    for value in values[1:]:
        pixels[cur_char_x * char_width_with_gap + cur_x + 1 ,  cur_char_y * char_height_with_gap + cur_y + 1] = (int(value), int(value), int(value))

        cur_x += 1
        if cur_x >= char_width:
           cur_x = 0
           cur_y += 1



    cur_char_x += 1

    if cur_char_x >= chars_per_line:
       cur_char_x = 0
       cur_char_y += 1

img.show()
