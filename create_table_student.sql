create table Student(
StdSSN char(11),
StdFirstName varchar(50),
StdLastName varchar(50),
StdCity varchar(50),
StdState char(2),
StdZip char(10),
StdMajor char(6),
StdClass char(2),
StdGPA decimal(3,2),
constraint PKStudent primary key (StdSSN)
);