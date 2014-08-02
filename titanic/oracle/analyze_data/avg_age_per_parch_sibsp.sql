prompt
prompt   AVG Age per parch and sibsp
prompt   ===========================

select * from (
  select
    age,
    parch,
    sibsp
  from
    kaggle_titanic_train_and_test
  where
    age is not null and age = trunc(age)
)
pivot (
  avg(age) avg_age
  for (sibsp) in (0 as s_0, 1 as s_1, 2 as s_2, 3 as s_3, 4 as s_4, 5 as s_5, 6 as s_6)
)
order by
  parch;


--      PARCH S_0_AVG_AGE S_1_AVG_AGE S_2_AVG_AGE S_3_AVG_AGE S_4_AVG_AGE S_5_AVG_AGE S_6_AVG_AGE
-- ---------- ----------- ----------- ----------- ----------- ----------- ----------- -----------
--          0  31.3989362      33.875        31.7  31.3333333
--          1  30.7755102  27.9259259  12.7142857         9.6         7.1
--          2        23.8  23.2272727  16.6666667      14.875  10.1666667  10.1666667
--          3          30        45.4          24
--          4          29       52.25
--          5          40          39
--          6                    41.5
