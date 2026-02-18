-- 
--use  AdventureWorks2022

• SELECT-- retrieves data from a database
• INSERT -- inserts new data into a database
  UPDATE -- updates existing data in a database
• DELETE -- deletes data from a database
·
  CREATE DATABASE -- creates a new database
• CREATE TABLE -- creates a new table in a database
• ALTER TABLE -- modifies an existing table structure
• DROP TABLE -- deletes a table from a database

• TRUNCATE TABLE -- removes all records from a table
• CREATE INDEX -- creates an index on a table
• DROP INDEX -- deletes an index from a table
• JOIN -- combines rows from two or more tables based on a related column
• INNER JOIN -- returns rows when there is a match in both tables
• LEFT JOIN -- returns all rows from the left table, and the matched rows from the right table
• RIGHT JOIN -- returns all rows from the right table, and the matched rows from the left table
• FULL JOIN -- returns rows when there is a match in one of the tables
• UNION -- combines the results of two or more SELECT statements
• UNION ALL -- combines the results of two or more SELECT statements, including duplicates
• GROUP BY -- groups rows that have the same values into summary rows @code._learning
• HAVING -- filters records based on a specified condition
• ORDER BY -- sorts the result set in ascending or descending order
• COUNT -- returns the number of rows that satisfy the condition
• SUM -- calculates the sum of a set of values
• AVG -- calculates the average of a set of values
• MIN -- returns the smallest value in a set of values
• MAX -- returns the largest value in a set of values
• DISTINCT -- selects unique values from a column
• WHERE -- filters records based on specified conditions

AND -- combines multiple conditions in a WHERE clause
OR--specifies multiple alternative conditions in a WHERE clause
NOT -- negates a condition in a WHERE clause
BETWEEN -- selects values within a specified range 
IN--specifies multiple values for a column
LIKE --selects rows that match a specified pattern 
IS NULL -- checks for NULL values in a column 
IS NOT NULL -- checks for non-NULL values in a column
EXISTS -- tests for the existence of any record in a subquery
• CASE -- performs conditional logic in SQL statements
• WHEN --specifies conditions in a CASE statement
• THEN -- specifies the result if a condition is true in a CASE statement
• ELSE -- specifies the result if no condition is true in a CASE statement
• END-- ends the CASE statement
• PRIMARY KEY -- uniquely identifies each record in a table
• FOREIGN KEY--establishes a relationship between tables
• CONSTRAINT -- enforces rules for data in a table • DEFAULT -specifies a default value for a column • NOT NULL - ensures that a column cannot contain NULL values
• UNIQUE -- ensures that all values in a column are unique
• CHECK -- enforces a condition on the values in a column
• CASCADE --automatically performs a specified action on related records
• SET NULL -- sets the value of foreign key columns to NULL when a referenced record is deleted
• SET DEFAULT-- sets the value of foreign key columns to their default value when a referenced record is deleted
• NO ACTION -- specifies that no action should be taken on related records when a referenced record is deleted
• RESTRICT -- restricts the deletion of a referenced record if there are related records
• CASE WHEN --conditional expression in SELECT statements
 WITH  --defines a common table expression (CTE)
 INTO -- specifies a target table for the result set of a SELECT statement
• TOP--limits the number of rows returned by a query
• LIMIT--limits the number of rows returned by a query (used in some SQL dialects)
• OFFSET --specifies the number of rows to skip before starting to return rows
• FETCH -- retrieves rows from a result set one at a time
• ROW_NUMBER() -- assigns a unique sequential integer to each row in a result set
• RANK() -- assigns a unique rank to each row in a result set, with gaps in the ranking sequence possible
• DENSE_RANK() -- assigns a unique rank to each row in a result set, with no gaps in the ranking sequence
• NTILE() -- divides the result set into a specified number of equally sized groups
• LEAD()-- retrieves the value from the next row in a result set
• LAG() -- retrieves the value from the previous row in a result set
• PARTITION BY -- divides the result set into partitions to which the window function is applied separately
• ORDER BY -- specifies the order of rows within each partition for window functions
• ROWS -- specifies the window frame for window functions
• RANGE -- specifies the window frame based on values rather than rows for window functions
• CURRENT_TIMESTAMP -- returns the current date and time
• CURRENT_DATE -- returns the current date
• CURRENT_TIME -- returns the current time
• DATEADD --adds a specified time interval to a date 
• DATEDIFF -- calculates the difference between two dates
• DATEPART -- extracts a specific part of a date 
• GETDATE -- returns the current date and time (similar to CURRENT_TIMESTAMP)
• GROUPING SETS -- possible combinations of grouping sets for aggregation
• ROLLUP -- generates subtotal values for a hierarchy of values
• INTERSECT -- returns the intersection of two result sets
• EXCEPT -- returns the difference between two result sets
• MERGE -- performs insert, update, or delete operations on a target table based on the results of a join with a source table
• CROSS APPLY -- performs a correlated subquery against each row of the outer table
• OUTER APPLY -- similar to CROSS APPLY, but also returns rows from the outer table that have no matching rows in the inner table
• PIVOT -- rotates a table-valued expression by turning the unique values from one column into multiple columns in the output
• UNPIVOT -- rotates a table-valued expression by turning multiple columns into unique rows in the output
• COALESCE -- returns the first non-NULL expression in a list
• NULLIF --returns NULL if the two specified expressions are equal, otherwise returns the first expression
• IIF -- returns one of two values based on a Boolean expression @code._learning
• CONCAT -- concatenates two or more strings 
• SUBSTRING -- extracts a substring from a string 
• CHARINDEX -- finds the position of a substring within a string
• REPLACE -- replaces all occurrences of a specified substring within a string with another substring
• LEN -- returns the length of a string UPPER-converts a string to uppercase
• LOWER -- converts a string to lowercase
• TRIM -- removes leading and trailing spaces from a string
• ROUND -- rounds a numeric value to a specified number of decimal places

=====================================================================================================



1. SELECT -- Retrieve data from a table
    SELECT  FROM [HumanResources].[Employee];

2. INSERT -- Add a new record
    INSERT INTO employees (name, age) VALUES ('John Doe', 30);
	
3. UPDATE –-- Modify existing data
      UPDATE employees SET age = 31 WHERE name = 'John Doe';
4. DELETE –-- Remove records
      DELETE FROM employees WHERE name = 'John Doe';
	  

5. CREATE DATABASE --– Create a new database
     CREATE DATABASE companyDB;
6. CREATE TABLE – Create a new table

     CREATE TABLE employees (
         id INT PRIMARY KEY,
         name VARCHAR(100),
         age INT
     );
7. ALTER TABLE -- Modify a table (add column)
     ALTER TABLE employees ADD department VARCHAR(100);
8. DROP TABLE --– Delete a table
     DROP TABLE employees;
9. TRUNCATE TABLE – Delete all data but keep structure
      TRUNCATE TABLE employees;

10. CREATE INDEX –-- Improve lookup speed
    CREATE INDEX idx_name ON employees(name);
11. DROP INDEX –-- Remove an index
     DROP INDEX idx_name ON employees;

12. JOIN --– Combine data from multiple tables
     SELECT e.name, d.department_name
	 FROM employees e
	 JOIN departments d ON e.department_id = d.id;
13. INNER JOIN --– Only matched rows
	 SELECT * FROM orders o
	 INNER JOIN customers c ON o.customer_id = c.id;
14. LEFT JOIN --– All from left + matches from right
	 SELECT * FROM employees e
	 LEFT JOIN salaries s ON e.id = s.employee_id;
15. RIGHT JOIN – All from right + matches from left
	 SELECT * FROM employees e
	 RIGHT JOIN salaries s ON e.id = s.employee_id;
16. FULL JOIN --– All rows from both tables
	 SELECT * FROM employees e
	 FULL OUTER JOIN salaries s ON e.id = s.employee_id;
17. UNION –-- Combine without duplicates
	 SELECT city FROM customers
	 UNION
	 SELECT city FROM suppliers;
18. UNION ALL –-- Combine with duplicates
	 SELECT city FROM customers
	 UNION ALL
	 SELECT city FROM suppliers;
19. GROUP BY --– Group data by a column
	 SELECT department, COUNT(*) FROM employees
	 GROUP BY department;
20. HAVING –-- Filter group results
	 SELECT department, COUNT(*) AS emp_count
	 FROM employees
	 GROUP BY department
	 HAVING COUNT(*) > 5;
21. ORDER BY --– Sort results
  SELECT * FROM employees ORDER BY age DESC;
  
--🔹 Part 7: Aggregate Functions

22. COUNT()
	SELECT COUNT(*) FROM employees;
23. SUM()
	SELECT SUM(salary) FROM employees;
24. AVG()
	SELECT AVG(salary) FROM employees;
25. MIN()
	SELECT MIN(salary) FROM employees;
26. MAX()
	SELECT MAX(salary) FROM employees;
	
--🔹 Part 8: Filtering and Conditions

27. DISTINCT --– Unique values
    SELECT DISTINCT department FROM employees;
28. WHERE –-- Filter results
     SELECT * FROM employees WHERE age > 30;
29. AND / OR / NOT --
	 SELECT * FROM employees WHERE age > 25 AND    department = 'HR';
	 SELECT * FROM employees WHERE department = 'HR' OR department = 'IT';
	 SELECT * FROM employees WHERE NOT age < 30;
30. BETWEEN 
  SELECT * FROM employees WHERE age BETWEEN 25 AND 35;
31. IN
  SELECT * FROM employees WHERE department IN ('HR', 'IT');
32. LIKE
  SELECT * FROM employees WHERE name LIKE 'A%';  -- Starts with A
33. IS NULL / IS NOT NULL
  SELECT * FROM employees WHERE manager_id IS NULL;
 SELECT * FROM employees WHERE manager_id IS NOT NULL;
34. EXISTS
	SELECT name FROM employees e
	WHERE EXISTS (
	SELECT 1 FROM departments d WHERE e.department_id = d.id
	);
--🔹 Part 9: Conditional Logic
35. CASE WHEN THEN ELSE END

		SELECT name,
		CASE 
			WHEN age < 30 THEN 'Junior'
			WHEN age >= 30 AND age < 50 THEN 'Mid-level'
			ELSE 'Senior'
		END AS experience_level
		FROM employees;

--🔹 Part 10: Keys & Constraints

36. PRIMARY KEY
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
37. FOREIGN KEY
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
38. CONSTRAINT
 ALTER TABLE employees
 ADD CONSTRAINT chk_age CHECK (age >= 18);
39. DEFAULT
CREATE TABLE employees (
    id INT,
    name VARCHAR(100),
    status VARCHAR(50) DEFAULT 'Active'
);
40. NOT NULL
CREATE TABLE employees (
    id INT,
    name VARCHAR(100) NOT NULL
);
41. UNIQUE
CREATE TABLE users (
    id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
42. CHECK
CREATE TABLE employees (
    id INT,
    age INT CHECK (age >= 18)
);
--🔹 Part 11: Referential Actions
43. CASCADE 
ALTER TABLE employees
ADD CONSTRAINT fk_dept
FOREIGN KEY (department_id) REFERENCES departments(id)
ON DELETE CASCADE;
--44. SET NULL 
ALTER TABLE employees
ADD CONSTRAINT fk_dept
FOREIGN KEY (department_id) REFERENCES departments(id)
ON DELETE SET NULL;
--45. SET DEFAULT 
ALTER TABLE employees
ADD CONSTRAINT fk_dept
FOREIGN KEY (department_id) REFERENCES departments(id)
ON DELETE SET DEFAULT;
--46. NO ACTION

ALTER TABLE employees
ADD CONSTRAINT fk_dept
FOREIGN KEY (department_id) REFERENCES departments(id)
ON DELETE NO ACTION;
--47. RESTRICT
ALTER TABLE employees
ADD CONSTRAINT fk_dept
FOREIGN KEY (department_id) REFERENCES departments(id)
ON DELETE RESTRICT;
🔹 Part 12: WITH, INTO, TOP, LIMIT, OFFSET, FETCH
48. CASE WHEN (See Part 9)
--49. WITH (CTE)

WITH dept_count AS (
    SELECT department_id, COUNT(*) AS emp_count
    FROM employees
    GROUP BY department_id
)
SELECT * FROM dept_count WHERE emp_count > 5;
--50. INTO

SELECT * INTO employees_backup FROM employees;
--51. TOP (SQL Server)

SELECT TOP 5 * FROM employees;
--52. LIMIT (MySQL/PostgreSQL)

SELECT * FROM employees LIMIT 5;
--53. OFFSET

SELECT * FROM employees LIMIT 5 OFFSET 10;
--54. FETCH (SQL:2008+)

SELECT * FROM employees OFFSET 10 ROWS FETCH NEXT 5 ROWS ONLY;
🔹 Part 13: Window Functions
--55. ROW_NUMBER()

SELECT name, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;
--56. RANK()

SELECT name, RANK() OVER (ORDER BY salary DESC) AS rank
FROM employees;
--57. DENSE_RANK()

SELECT name, DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM employees;
--58. NTILE(n)

SELECT name, NTILE(4) OVER (ORDER BY salary) AS quartile
FROM employees;
--59. LEAD()

SELECT name, salary, LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM employees;
--60. LAG()

SELECT name, salary, LAG(salary) OVER (ORDER BY salary) AS prev_salary
FROM employees;
--61. PARTITION BY

SELECT department, name, RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;
62. ROWS
SELECT name, salary,
       SUM(salary) OVER (ORDER BY id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_sum
FROM employees;
63. RANGE

SELECT name, salary,
       SUM(salary) OVER (ORDER BY salary RANGE BETWEEN 1000 PRECEDING AND 1000 FOLLOWING) AS salary_band
FROM employees;