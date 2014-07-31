options(skip=1)
load data
  infile '..\..\data\train.csv'
  truncate
into table kaggle_titanic_train
fields terminated by ',' optionally enclosed by '"' trailing nullcols
( 
   PassengerId,
   Survived,
   Pclass,
   Name,
   Sex  "decode(:sex, 'female', 'f', 'male', 'm', '?')",
   Age  "to_number(:age , '999999999999D9999', 'nls_numeric_characters=''.,''')",
   SibSp,
   Parch,
   Ticket,
   Fare "to_number(:fare, '999999999999D9999', 'nls_numeric_characters=''.,''')",
   Cabin,
   Embarked
)
