prompt
prompt show Passengers with parch in (6, 9), hoping to get some insight
prompt ================================================================

select * from kaggle_titanic_train_and_test where parch in (6,9);

-- PASSENGERID     PCLASS NAME                                                                               S        AGE      SIBSP      PARCH TICKET                   FARE CABIN           E DATAS
-- ----------- ---------- ---------------------------------------------------------------------------------- - ---------- ---------- ---------- ------------------ ---------- --------------- - -----
--         679          3 Goodwin, Mrs. Frederick (Augusta Tyler)                                            f         43          1          6 CA 2144                  46.9                 S train
--        1031          3 Goodwin, Mr. Charles Frederick                                                     m         40          1          6 CA 2144                  46.9                 S test
--        1234          3 Sage, Mr. John George                                                              m                     1          9 CA. 2343                69.55                 S test
--        1257          3 Sage, Mrs. John (Annie Bullen)                                                     f                     1          9 CA. 2343                69.55                 S test
