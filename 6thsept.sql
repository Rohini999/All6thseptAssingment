--JOINS---
create table myemp
(
empid int,
firstname varchar(10),
lastname varchar(10),
salary decimal,
)
insert into myemp values(1,'rohini','jadhav',198000)
insert into myemp values(2,'Amol','more',20000)
insert into myemp values(3,'rani','kadam',19200)

select * from myemp;

--JOINS---
create table deparments
(
deptid int,
firstname varchar(10),
lastname varchar(10),
salary decimal,
)
insert into deparments values(1,'rohi','jadhav',19000)
insert into deparments values(2,'gopal','more',13000)
insert into deparments values(3,'abhi','jadhav',16000)


select * from deparments;

SELECT *
FROM myemp e INNER JOIN deparments d
ON e. EMPID = d.deptID

SELECT *
FROM myemp e LEFT OUTER JOIN deparments d
ON e.EMPID = d.deptID

SELECT *
FROM myemp e RIGHT OUTER JOIN deparments d
ON e.EMPID = d.deptID



SELECT e1.*, e2.FIRSTNAME "XYZ", e2.LASTNAME "PQR"
FROM myemp e1 JOIN myemp e2
ON e1.lastname = e2.FIRSTNAME

SELECT count(*) 
FROM myemp CROSS JOIN deparments;


--userdefined functions--

Select Min(EMPID)from myemp where FIRSTNAME='ABC';
Select Min(EMPID)from myemp; 
Select Avg(SALARY) from myemp;
Select count(*) from myemp;
Select count(SALARY) from myemp where FIRSTNAME = 'PQR';
Select Sum(SALARY) from myemp;
Select Sum(SALARY) from myemp where FIRSTNAME = 'XYZ';

SELECT SQUARE(25)
SELECT SQRT(100)
SELECT PI()
SELECT ROUND(123.45,1)
SELECT CEILING(100)
SELECT FLOOR(45.56)


SELECT DATENAME(YEAR, GETDATE()) AS 'Year';        
SELECT DATENAME(MONTH, GETDATE())AS 'Month Name';          
SELECT DATENAME(DAY, GETDATE())AS 'Day';         
SELECT DATENAME(WEEK, GETDATE())AS 'Week';           
SELECT DATENAME(HOUR, GETDATE())AS 'Hour';        
SELECT DATENAME(MINUTE, GETDATE())AS 'Minute';      
SELECT DATENAME(SECOND, GETDATE())AS 'Second';      

--CARTESION PRODUCT--
select * from myemp;
select * from deparments;



   --triggers//

   CREATE TABLE Employee3  
(  
  Id INT PRIMARY KEY,  
  Name VARCHAR(45),  
  Salary INT,  
  Gender VARCHAR(12),  
  DepartmentId INT  
)  

INSERT INTO Employee3 VALUES (1,'Amol', 82000, 'Male', 3); 
INSERT INTO Employee3 VALUES(2,'rohini', 52000, 'Female', 2);  
INSERT INTO Employee3 VALUES(3,'ram', 25000, 'male', 1);  
INSERT INTO Employee3 VALUES(4,'sajiya', 47000, 'Male', 2);  
INSERT INTO Employee3 VALUES(5,'neha', 46000, 'Female', 3);  
SELECT * FROM Employee3;

CREATE TABLE Employee_Audit_Test1  
(    
Id int IDENTITY,   
Audit_Action text   
) 

CREATE TRIGGER trInsertEmploy
ON Employee3  
FOR INSERT  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from inserted  
  INSERT INTO Employee_Audit_Test1     
  VALUES ('New employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is added at ' + CAST(Getdate() AS VARCHAR(22)))  
END  
INSERT INTO Employee3 VALUES (6,'swara', 62000, 'Male', 3)  



CREATE TRIGGER trDeleteEmploy
ON Employee3  
FOR DELETE  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from deleted  
  INSERT INTO Employee_Audit_Test1  
  VALUES ('An existing employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is deleted at ' + CAST(Getdate() AS VARCHAR(22)))  
END  

DELETE FROM Employee3 WHERE Id = 2;  

 select * from myemp;
select * from deparments;

--create trigger--
create trigger trigde1
on myemp
for delete
as 
print 'DELETION OF DEPARTMENT IS NOT ALLOWED'
ROLLBACK TRANSACTION
return

DELETE FROM myemp where STATUS='Active'

SELECT * FROM myemp;

create table emp3
(
eno int,
ename varchar(10),
eadd varchar(10),
esal int,
doj Datetime
)

SELECT * FROM emp3;
insert into emp3 values(1,'rohini','pune',10000,'07-09-2021');
insert into emp3 values(2,'amol','nashik',30000,'08-09-2021');
insert into emp3 values(3,'ram','aurangpura',40000,'09-09-2021');
insert into emp3 values(4,'sandhya','aurangabad',50000,'03-09-2021');
insert into emp3 values(5,'rohan','akola',60000,'04-09-2021');


create trigger trig2
on myemp
for insert
as
declare @modifieddate datetime
select @modifieddate = doj from inserted
if (@modifieddate!=GETDATE())
begin
print 'the modified date should be current date.hence cannot be inserted'
ROLLBACK TRANSACTION
RETURN 
END

insert into myemp values(4,'rohini','aurangabad',50000,'03-09-2021');
insert into myemp values(3,'amol','aurangpura',40000,'03-09-2021');

SELECT * FROM myemp;

create trigger trig4
on myemp
for update
as
if update(esal)
begin
declare @salary int
select @salary = esal
from emp3
if(@salary>3000)
begin
print 'the salary cannot be more than 3000'
ROLLBACK TRANSACTION
RETURN 
END
END


--indexes--
select * from myemp;
CREATE INDEX idx_lastname
ON myemp (LASTNAME);

CREATE INDEX idx_Name
ON myemp (LASTNAME,FIRSTNAME);


SP_HELPINDEX myemp

//batch//

SELECT * FROM sys.databases;
GO
SELECT * FROM sys.all_views
GO