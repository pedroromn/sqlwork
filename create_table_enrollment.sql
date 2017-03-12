create table Enrollment (
OfferNo integer,
StdSSN char(11),
EnrGrade decimal(3,2),
constraint PKEnrollment primary key (OfferNo,StdSSN)
)