select 'train' data_set, count(*) from kaggle_titanic_train where age is not null and age != trunc(age) union all
select 'test'  data_set, count(*) from kaggle_titanic_test  where age is not null and age != trunc(age);

select
    dataset,
    count(*)
  from
    kaggle_titanic_train_and_test
  where
    age is not null and age != trunc(age)
  group by
    dataset
  order by
    dataset desc;

-- DATAS   COUNT(*)
-- ----- ----------
-- train         25
-- test          20

prompt
prompt .     -> Another 2-4 % of age is perhaps speculative
prompt
