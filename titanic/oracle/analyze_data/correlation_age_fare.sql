prompt
prompt is there a correlation between age and fare?
prompt ============================================

-- to_csv: https://github.com/ReneNyffenegger/oracle_scriptlets/blob/master/sqlpath/to_csv.sql
@to_csv correlation_age_fare.inc correlation_age_fare.csv

-- runVBAFilesInOfficeb.vbs: https://github.com/ReneNyffenegger/runVBAFilesInOffice
$ &RUNVBA\runVBAFilesInOffice.vbs  -excel correlation_age_fare &RUNVBA\excel\helpers -c main "%CD%\correlation_age_fare.csv"

prompt
prompt .     -> 3rd class pays between 7 and 10
prompt .        2nd class between 10 and 16
prompt .        3rd class 25 and more
prompt
prompt .        Assumption: Passenger id 913 shows the fare for children 3rd class
