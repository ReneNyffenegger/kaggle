drop   table kaggle_titanic_train purge;
create table kaggle_titanic_train (
  PassengerId  number(4),
  Survived     number(1),
  Pclass       number(1),
  Name         varchar2(82),
  Sex          char(1),
  Age          number(3,1),
  SibSp        number(1),
  Parch        number(1),
  Ticket       varchar2(18),
  Fare         number,
  Cabin        varchar2(15),
  Embarked     varchar2(1)
);

exit
