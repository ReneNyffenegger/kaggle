create view kaggle_titanic_train_and_test as 
select
  passengerid  ,
  pclass       ,
  name         ,
  sex          ,
  age          ,
  sibsp        ,
  parch        ,
  ticket       ,
  fare         ,
  cabin        ,
  embarked     ,
 'train'        dataset
from
  kaggle_titanic_train
union all
select
  passengerid  ,
  pclass       ,
  name         ,
  sex          ,
  age          ,
  sibsp        ,
  parch        ,
  ticket       ,
  fare         ,
  cabin        ,
  embarked     ,
 'test'         dataset
from
  kaggle_titanic_test;
