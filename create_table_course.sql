create table Course(
CourseNo char(6),
CrsDesc varchar(250),
CrsUnits smallint,
constraint PKCourse primary key (CourseNo),
constraint UniqueCrsDesc unique (CrsDesc)
)