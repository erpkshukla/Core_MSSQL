--select * from sys.dm_exec_connections

select * from sys.dm_exec_requests
cross apply
 sys.dm_exec_sql_text(sql_handle)

 --select * from sys.dm_exec_connections    select * from sys.dm_exec_requests  cross apply   sys.dm_exec_sql_text(sql_handle)

 select * from Sales.SalesOrderDetail OD  left join sales.SalesOrderHeader OH  on 1=1





 --================================================================================================
 --use  STUDENT_DETAILS
 --CREATE DATABASE STUDENT_DETAILS
--CREATE TABLE Student_Result(
--RollNo       Int primary key identity,
--Student_Name varchar(200),
--Marks_Science int,
--Marks_English int,
--Marks_Math    int
--)
--insert into Student_Result(Student_Name, Marks_Science,Marks_English,Marks_Math)values('RAM',65,60,80), 
--('Mohan',85,70,50),('Rajesh',45,90,40)

-- select * from Student_Result

--use STUDENT_DETAILS


DECLARE

@RollNo        INt,    
@Student_Name varchar(200),
@Marks_Science int,
@Marks_English int,
@Marks_Math    int
DECLARE
@Marks_Total int,
@MArks_PERCENTAGE int

DECLARE Student_cursor cursor for select   RollNo,Student_Name, Marks_Science,Marks_English,Marks_Math from Student_Result;
open Student_cursor;

fetch  next from Student_cursor into @RollNo,@Student_Name,@Marks_Science,@Marks_English,@Marks_Math
while @@FETCH_STATUS=0
begin
print concat('NAME : ',@Student_Name);
print concat('RollNo : ',@RollNo);
print concat('SCIENCE : ',@Marks_Science);
print concat('English : ',@Marks_English);
print concat('Mathe : ',@Marks_Math);
set @Marks_Total = @Marks_Science+@Marks_English+@Marks_Math;
print concat('Total : ',@Marks_Total);
SET @MArks_PERCENTAGE = @Marks_Total/3;
SET @MArks_PERCENTAGE = @Marks_Total/3;
print concat('Parcentage : ',@MArks_PERCENTAGE,'%');
if @MArks_PERCENTAGE > 70
 begin
   Print 'Grade:A';
   End
   else if @MArks_PERCENTAGE > 50 and @MArks_PERCENTAGE < 70
    begin
   Print 'Grade:B';
   End
   else
      begin
   Print 'Grade:c';
   End
      Print '********************';

fetch  next  from Student_cursor into @RollNo,@Student_Name,@Marks_Science,@Marks_English,@Marks_Math
end
close Student_cursor;
deallocate Student_cursor;

--======================================================================

--  use AdventureWorks2022
---------------------------------
--  STRING_SPLIT (Transact-SQL)

 -- STRING_SPLIT ( string , separator [ , enable_ordinal ] )    //  Syntax

SELECT value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ');

SELECT * FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ', 1);


--1)Split comma-separated value string
DECLARE @tags NVARCHAR(400) = 'clothing,road, ,touring,bike'

SELECT value
FROM STRING_SPLIT(@tags, ',')
WHERE RTRIM(value) <> '';


--2)Aggregation by values
DECLARE @tags NVARCHAR(400) = 'clothing,road,,touring,bike'
SELECT value as tag, COUNT(*) AS [number_of_articles]
FROM Production.Product
    CROSS APPLY STRING_SPLIT(@tags, ',')
GROUP BY value
HAVING COUNT(*) > 2
ORDER BY COUNT(*) DESC;

--Search by tag value
--1
DECLARE @tags NVARCHAR(400) = 'clothing,road,,touring,bike'

SELECT ProductId, Name, @tags
FROM Production.Product
WHERE 'clothing' IN (SELECT value FROM STRING_SPLIT(@tags, ','));

SELECT ProductId, Name, @tags
FROM Production.Product
WHERE EXISTS (SELECT *
    FROM STRING_SPLIT(@tags, ',')
    WHERE value IN ('clothing', 'road'));



--Find rows by list of values
DECLARE @tag1 NVARCHAR(400) = 'clothing,road,,touring,bike'

SELECT ProductId, Name, @Tag1
FROM Production.Product
JOIN STRING_SPLIT('1,2,3',',')
    ON value = ProductId;

SELECT ProductId, Name, @Tag1
FROM Product
WHERE ',1,2,3,' LIKE '%,' + CAST(ProductId AS VARCHAR(20)) + ',%';

--Find rows by ordinal values
SELECT *
FROM STRING_SPLIT('Austin,Texas,Seattle,Washington,Denver,Colorado', ',', 1)
WHERE ordinal % 2 = 0;

--Order rows by ordinal values
SELECT * FROM STRING_SPLIT('E-D-C-B-A', '-', 1) ORDER BY ordinal desc ;





