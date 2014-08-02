prompt
prompt Relative frequency per sex and class
prompt ====================================

with train_ as (
  select 
         count(*)                         cnt,
         ratio_to_report(count(*)) over() rel_freq,
         sex,
         pclass
  from
         kaggle_titanic_train
  group 
     by  sex,
         pclass
), test_ as (
  select 
         count(*)                         cnt,
         ratio_to_report(count(*)) over() rel_freq,
         sex,
         pclass
  from
         kaggle_titanic_test
  group 
     by  sex,
         pclass
)
select
  sex,
  pclass,
  --
  train_.cnt                         cnt_train,
  train_.rel_freq                    rel_freq_train,
  --
  test_.cnt                          cnt_test,
  test_.rel_freq                     rel_freq_test,
  --
  test_.rel_freq / train_.rel_freq   diff_factor
from
  train_  join  test_ using (sex, pclass)
order by
  rel_freq_test;

-- S     PCLASS  CNT_TRAIN REL_FREQ_TRAIN   CNT_TEST REL_FREQ_TEST DIFF_FACTOR
-- - ---------- ---------- -------------- ---------- ------------- -----------
-- f          2         76     .085297419         30    .071770335  .841412742
-- f          1         94     .105499439         50    .119617225  1.13381859
-- m          1        122     .136924804         57    .136363636  .995901639
-- m          2        108     .121212121         63    .150717703  1.24342105
-- f          3        144     .161616162         72    .172248804  1.06578947
-- m          3        347     .389450056        146    .349282297  .896860306

prompt
prompt .     -> Conclusion: focus on the 3rd class with over 50 percent of the passangers
prompt
