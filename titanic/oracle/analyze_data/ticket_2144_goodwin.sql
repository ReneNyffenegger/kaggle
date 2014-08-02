prompt
prompt Do we find the children of Mrs and Mr Goodwin?
prompt ==============================================

set lines 233

select * from kaggle_titanic_train_and_test 
  where 
    name like '%Goodwin%' or 
    name like '%Tyler%' 
  order by age;


-- PASSENGERID     PCLASS NAME                                                                               S        AGE      SIBSP      PARCH TICKET                   FARE CABIN           E DATAS
-- ----------- ---------- ---------------------------------------------------------------------------------- - ---------- ---------- ---------- ------------------ ---------- --------------- - -----
--         387          3 Goodwin, Master. Sidney Leonard                                                    m          1          5          2 CA 2144                  46.9                 S train
--         481          3 Goodwin, Master. Harold Victor                                                     m          9          5          2 CA 2144                  46.9                 S train
--        1032          3 Goodwin, Miss. Jessie Allis                                                        f         10          5          2 CA 2144                  46.9                 S test
--          60          3 Goodwin, Master. William Frederick                                                 m         11          5          2 CA 2144                  46.9                 S train
--         684          3 Goodwin, Mr. Charles Edward                                                        m         14          5          2 CA 2144                  46.9                 S train
--          72          3 Goodwin, Miss. Lillian Amy                                                         f         16          5          2 CA 2144                  46.9                 S train
--        1031          3 Goodwin, Mr. Charles Frederick                                                     m         40          1          6 CA 2144                  46.9                 S test
--         679          3 Goodwin, Mrs. Frederick (Augusta Tyler)                                            f         43          1          6 CA 2144                  46.9                 S train

prompt
prompt .     -> This is the entire family Goodwin that travelled together
prompt .        The parents (Passenger IDs 1031 and 679) have SIBSP = 1 which
prompt .        is the count of the other spouse.
prompt .        Their PARCH is 6 because they have 6 children.
prompt .        The children have each a PARCH=2 because both parents
prompt .        are travelling with them.
prompt .        The children's SIBSP is 5 because each child travels with
prompt .        5 siblings.
prompt .
prompt .     -> Insight: A Ticket is not issued per per person, but per group
prompt .        traveling together.
