select 
  age                                           "Age",
  case when pclass = 3 then fare else null end  "Fare 3rd class",
  case when pclass = 2 then fare else null end  "Fare 2nd class",
  case when pclass = 1 then fare else null end  "Fare 1st class"
from 
  kaggle_titanic_train_and_test
where
  ticket in (select ticket from
              kaggle_titanic_train_and_test
             group by ticket
             having count(*) = 1) and
  age is not null                 and
  trunc(age) = age
order by age
