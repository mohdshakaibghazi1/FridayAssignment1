Create Database UserLoginDB
use UserLoginDB
Create Table Usedif
(
    UserName nvarchar(50) unique,
    UserPassword nvarchar(50)
)

insert into Usedif values('Shakaib','Shakaib@123');

select * from Usedif