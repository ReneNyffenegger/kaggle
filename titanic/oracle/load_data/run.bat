@set ORACLE_CONNECTION=meta/meta

@sqlplus -s %ORACLE_CONNECTION% @create_train_table
@sqlplus -s %ORACLE_CONNECTION% @create_test_table

@sqlldr control=train.ctl userid=%ORACLE_CONNECTION% silent=(header,feedback)
@sqlldr control=test.ctl  userid=%ORACLE_CONNECTION% silent=(header,feedback)


@echo train.log
@findstr loaded train.log

@echo test.log
@findstr loaded test.log

@del train.log
@del test.log

