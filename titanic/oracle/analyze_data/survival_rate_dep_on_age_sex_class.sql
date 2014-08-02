prompt
prompt Survival rate depending on sex, age and class (in a 30% window)
prompt ===============================================================


-- to_csv: https://github.com/ReneNyffenegger/oracle_scriptlets/blob/master/sqlpath/to_csv.sql
@to_csv survival_rate_dep_on_age_sex_class.inc survival_rate_dep_on_age_sex_class.csv

-- runVBAFilesInOfficeb.vbs: https://github.com/ReneNyffenegger/runVBAFilesInOffice
$ &RUNVBA\runVBAFilesInOffice.vbs  -excel survival_rate_dep_on_age_sex_class &RUNVBA\excel\helpers -c Go "%CD%\survival_rate_dep_on_age_sex_class.csv"

prompt .     ->
prompt .     -> Survival rate for females of 1st and 2nd class is generally high.
prompt .        For females of first class well above 95 %
prompt .     -> Survival rate for males of 2nd and 3rd is generally low
prompt .        Males above 20 years perish with a 80 % likelihood.
prompt .        2nd class males have lower survival rate then 3rd class males.
prompt .     -> Females of 2nd class and males of 3rd class are more likely to die
prompt .        the older they are.
prompt

