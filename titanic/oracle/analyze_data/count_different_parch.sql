prompt
prompt Count different ParCh
prompt =====================

select 
  parch,
  count(*),
  sum(count(*)) over ()
from
  kaggle_titanic_train_and_test
group by
  parch order by parch;

--      PARCH   COUNT(*) SUM(COUNT(*))OVER()
-- ---------- ---------- -------------------
--          0       1002                1309
--          1        170                1309
--          2        113                1309
--          3          8                1309
--          4          6                1309
--          5          6                1309
--          6          2                1309
--          9          2                1309

prompt
prompt .     -> Most passengers travelled without children or parents
prompt .     -> The sum over the counts is 1309, that was expected.
prompt
