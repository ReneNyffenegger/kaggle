prompt
prompt Count records
prompt =============

select
  count (case when dataset = 'train' then 1 end) "Train-Records",
  count (case when dataset = 'test'  then 1 end) "Test-Records"
from
  kaggle_titanic_train_and_test;

-- Train-Records Test-Records
-- ------------- ------------
--           891          418
