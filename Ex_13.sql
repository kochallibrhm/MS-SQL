/* CONSTRAINTS
-------------------
1 - PRIMARY KEY
2 - FOREING KEY
3 - UNIQUE
4 - DEFAULT
5 - CHECK

*/

create table dbo.Student
(
StudentID int primary key identity,
FullName nvarchar(100) not null,
SocialNumber char(11) constraint CHK_SN check (LEN(SocialNumber) = 11) not null,
Email varchar(256) unique,
RegisterDate datetime constraint DF_RDate DEFAULT (GETDATE()),
Class varchar(10) constraint CHK_Class check (Class like '[1-9]-[A-K]')
)