select * from (
     select
       age,
       sum  ( sum  (survived) ) over (partition by sex, pclass order by age range between age * 0.3 preceding and age * 0.3 following  ) /     -- Number of survivers in 30 % range of age per sex and class
       sum  ( count(*       ) ) over (partition by sex, pclass order by age range between age * 0.3 preceding and age * 0.3 following  )       -- How many passengers in 30 % range of age per sex and class
       as       survival_probability,  
       sex,
       pclass
     from
       kaggle_titanic_train
     where
       age = trunc(age)       -- For now, we're only interested where age is known (and not estimated or missing).
     group by
       age,
       sex,
       pclass
  )
  pivot (
    max(survival_probability) for (sex, pclass) in 
     ( ('m' , 3)  as "M 3", ('f' , 3)  as "F 3",
       ('m' , 2)  as "M 2", ('f' , 2)  as "F 2",
       ('m' , 1)  as "M 1", ('f' , 1)  as "F 1"
    )
  )
order by
  age
;
