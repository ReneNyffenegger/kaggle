prompt
prompt Find missing values
prompt ===================

select                         dataset ,
    count(*) - count(pclass  ) pclass  ,
    count(*) - count(name    ) name    ,
    count(*) - count(sex     ) sex     ,
    count(*) - count(age     ) age     ,
    count(*) - count(sibsp   ) sibsp   ,
    count(*) - count(parch   ) parch   ,
    count(*) - count(ticket  ) ticket  ,
    count(*) - count(fare    ) fare    ,
    count(*) - count(cabin   ) cabin   ,
    count(*) - count(embarked) embarked
  from
    kaggle_titanic_train_and_test
  group by
    dataset
  order by
    dataset desc;


prompt
prompt .     -> Cabin can probably not be used for a prediction.
prompt .     -> Around 20 % of age data is missing, fractional ages not counted.
prompt
