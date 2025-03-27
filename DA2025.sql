CREATE DATABASE DA2025;      -- CREATE A NEW DATABASE
------------------------------------------------------
CREATE DATABASE LAYBA;       -- CREATE A NEW DATABASE
------------------------------------------------------
CREATE TABLE STUDENTS (ADM_NO INT PRIMARY KEY, S_NAME VARCHAR(50), GENDER CHAR(1), COURSE VARCHAR(20), CONTACT BIGINT, FEE FLOAT);
							 -- CREATE A NEW TABLE (PRIMARY KEY IS A "CONSTRAINTS")
------------------------------------------------------
INSERT INTO STUDENTS (ADM_NO, S_NAME, GENDER, COURSE, CONTACT, FEE)     -- INSERT VALUES INTO TABLE
              VALUES (1001, 'FAIZAN', 'M', 'DA', 8976543780, 20500),
			         (1002, 'LAYBA', 'F', 'DA', 6745623985, 23900),
					 (1003, 'MOHSIN', 'M', 'DS', 7650983456, 19800.32),
					 (1017, 'SABIHA', 'F', 'BA', ' ',19800.32);
------------------------------------------------------                  -- INSERT VALUES INTO TABLE
INSERT INTO STUDENTS (ADM_NO, S_NAME, GENDER, COURSE, CONTACT, FEE)
              VALUES (1004, 'RUQAYYA', 'F', 'DS',8950983456, 28000),
					 (1005, 'SAIF' , 'M', 'BA', 9950983456, 21000),
				     (1006, 'FAIYAZ','M', 'BCA', 8750985656, 30000),
					 (1007, 'RAHILA','F', 'MCA', 7650083456, 38000),
					 (1008, 'ZAKIR', 'M', 'MCA', 7650981236, 38000),
					 (1009, 'ZAHID', 'M', 'BCA', 8850983456, 30000),
					 (1010, 'SONU' , 'M', 'BA', 9850982356, 21000),
					 (1011, 'NEHA' , 'F', 'DA', 6650983856, 25000),
					 (1012, 'ZISHAN', 'M', 'MCA', 9805098345, 38000),
					 (1013, 'NARGISH', 'F','DA', 7650983347, 25000),
					 (1014, 'MOHIT' , 'M', 'BA', 8795983444, 21000),
					 (1015, 'SOFIA' , 'F', 'DA', 9809834345, 25000),
					 (1016, 'Mujtaba', 'M', 'DS', NULL, 34000);
------------------------------------------------------
SELECT ADM_NO, S_NAME, COURSE FROM STUDENTS;            -- SHOW DESIRED COLUMNS
------------------------------------------------------
SELECT ADM_NO, FEE FROM STUDENTS;						-- SHOW DESIRED COLUMNS
------------------------------------------------------
USE ROZI;                                               -- SHOW CURRENT DATABASE SESSION
------------------------------------------------------
USE DA2025;                                             -- SHOW CURRENT DATABASE SESSION
------------------------------------------------------
ALTER DATABASE LAYBA                                    -- RENAME A DATABASE
MODIFY NAME = ROZI;
------------------------------------------------------
DROP DATABASE ROZI;                                     -- PERMANENTLY DELETE THE DATABASE
------------------------------------------------------
EXEC SP_RENAME 'STUDENTS', 'ALLSTUDENTS';               -- RENAME A TABLE
------------------------------------------------------
EXEC SP_RENAME 'ALLSTUDENTS.S_NAME', 'STUD_NAME';       -- RENAME A COLUMN OF A TABLE
------------------------------------------------------
TRUNCATE TABLE ALLSTUDENTS;                  -- REMOVE ALL RECORDS/ROWS BUT STRUCTURE(COLUMNS) REMAINS
------------------------------------------------------
DROP TABLE ALLSTUDENTS;                      -- PERMANENTLY DELETE THE TABLE
------------------------------------------------------
UPDATE STUDENTS
SET CONTACT = '9999999888'
WHERE ADM_NO = '1016';                      -- UPDATE SINGLE VALUE BY PRIMARY KEY REFERENCE
------------------------------------------------------
SELECT * FROM SYS.DATABASES;                -- SHOW ALL THE DATABASES IN THE SYSTEM
------------------------------------------------------
SELECT * FROM SYS.TABLES;					-- SHOW ALL THE TABLES IN A SELECTED DATABASE
------------------------------------------------------

/*
CATEGORIES OF COMMANDS:
=======================
DDL (DATA DEFINITION LANGUAGE) - SCHEMA, CREATE (data types, constraints), ALTER (rename/add/drop), DROP, TRUNCATE
DML (DATA MANIPULATION LANGUAGE) - INSERT, UPDATE, DELETE, STORED PROCEDURE
DQL (DATA QUERY LANGUAGE) - SELECT, CLAUSES (where, group by, having, order by, top, offset, fetch), JOINS(inner, left, right, full, cross, self), UNION, UNION ALL, INTERSECT
DCL (DATA CONTROL LANGUAGE)
TCL (TRANSACTION CONTROL LANGUAGE)
SFL (SCALAR FUNCTIONS LIBRARY)
WFL (WINDOWS FUNCTIONS LIBRARY) - AGGREGATE FUNCTIONS, RANKING FUNCTIONS (ROW_NUMBER, RANK, DENSE_RANK, NTILE)
*/

------------------------------------------------------
SELECT * FROM STUDENTS
WHERE GENDER = 'M';          -- ALL RECORDS WITH SINGLE CONDITION
------------------------------------------------------
SELECT * FROM STUDENTS
WHERE COURSE = 'DA';         -- ALL RECORDS WITH SINGLE CONDITION
------------------------------------------------------
SELECT * FROM STUDENTS
WHERE COURSE IN('DA', 'DS', 'BA');     -- ALL RECORDS WITH MULTIPLE CONDITIONS (in same column)
------------------------------------------------------
SELECT ADM_NO, GENDER, COURSE, FEE FROM STUDENTS
WHERE GENDER = 'F' OR (COURSE = 'DA' AND FEE > 30000);    -- ALL RECORDS WITH MULTIPLE CONDITIONS (in different columns)
------------------------------------------------------
SELECT ADM_NO, GENDER, COURSE FROM STUDENTS
WHERE GENDER = 'F' AND COURSE IN('DA', 'DS');    -- ALL RECORDS WITH MULTIPLE CONDITIONS (in different columns)
------------------------------------------------------
SELECT ADM_NO, GENDER, COURSE FROM STUDENTS
WHERE GENDER IN ('M', 'F') AND COURSE IN('DA', 'DS');    -- ALL RECORDS WITH MULTIPLE CONDITIONS (in different columns)
------------------------------------------------------
SELECT ADM_NO, GENDER, COURSE FROM STUDENTS
WHERE GENDER IN ('M', 'F') AND COURSE = 'DA';    -- ALL RECORDS WITH MULTIPLE CONDITIONS (in different columns)
------------------------------------------------------
SELECT ADM_NO, GENDER , COURSE FROM STUDENTS
WHERE COURSE = 'DA' AND GENDER IN ('M','F');
------------------------------------------------------
SELECT * FROM STUDENTS
WHERE FEE > 25000;
------------------------------------------------------
SELECT * FROM STUDENTS
WHERE COURSE != 'DA';       -- NOT EQUAL TO <>, !=
------------------------------------------------------
SELECT * FROM STUDENTS
WHERE NOT COURSE = 'DA';
------------------------------------------------------
SELECT * FROM STUDENTS
WHERE NOT COURSE = 'DA' AND NOT GENDER = 'F';
------------------------------------------------------
--================= ORDER BY ==================

SELECT * FROM STUDENTS
ORDER BY FEE ASC;               -- FEE IN ASCENDING ORDER
------------------------------------------------------
SELECT * FROM STUDENTS          -- FEE IN ASCENDING ORDER ('ASC' IS DEFAULT ORDER)
ORDER BY FEE;
------------------------------------------------------
SELECT * FROM STUDENTS
WHERE COURSE = 'DA'
ORDER BY FEE DESC;              -- FEE IN DESCENDING ORDER FOR COURSE 'DA'
------------------------------------------------------
SELECT TOP 3 * FROM STUDENTS
ORDER BY FEE DESC;
------------------------------------------------------
SELECT MAX(FEE) AS MAX_FEE
FROM STUDENTS;
-------------------------------------------------------
SELECT * FROM STUDENTS
ORDER BY FEE DESC
OFFSET 5 ROWS
FETCH NEXT 100 ROWS ONLY;
-------------------------------------------------------
SELECT TOP 3 * FROM STUDENTS
ORDER BY FEE DESC;
-------------------------------------------------------
SELECT * FROM STUDENTS
ORDER BY S_NAME
OFFSET 4 ROWS
FETCH NEXT 2 ROWS ONLY;
-------------------------------------------------------
-- ==================== UPDATE ================

UPDATE STUDENTS
SET CONTACT = '9999988888'
WHERE ADM_NO = '1005';                   -- UPDATE SINGLE VALUE BY SINGLE PRIMARY KEY REFERENCE
-------------------------------------------------------
UPDATE STUDENTS
SET S_NAME = 'SUMBUL', GENDER = 'F', FEE = 20599 
WHERE ADM_NO = '1005';                   -- UPDATE MULTIPLE VALUE BY SINGLE PRIMARY KEY REFERENCE
--------------------------------------------------------
UPDATE STUDENTS
SET S_NAME = 'LAYBA SIDDIQUI'
WHERE S_NAME = 'LAYBA';         -- UPDATE SINGLE VALUE BY SAME COLUMN REFERENCE
--------------------------------------------------------
UPDATE STUDENTS                 -- UPDATE MULTIPLE VALUES BY SINGLE NON KEY REFERENCE
SET FEE = 19999
WHERE COURSE = 'DA';
--------------------------------------------------------
UPDATE STUDENTS                       -- UPDATE MULTIPLE VALUES BY MULTIPLE P. KEY REFERENCE
SET FEE = CASE
	WHEN ADM_NO = '1001' THEN 20999
	WHEN ADM_NO = '1005' THEN 21599
	WHEN ADM_NO = '1007' THEN 20555
	WHEN ADM_NO = '1012' THEN 20222
	WHEN ADM_NO = '1015' THEN 25444
ELSE FEE							 -- REST ALL FEE VALUES REMAIN UNCHANGED
END;
---------------------------------------------------------
UPDATE STUDENTS                       -- UPDATE MULTIPLE VALUES BY MULTIPLE P. KEY REFERENCE
SET FEE = CASE
	WHEN ADM_NO = '1001' THEN 20888
	WHEN ADM_NO = '1005' THEN 21500
	WHEN ADM_NO = '1007' THEN 20500
	WHEN ADM_NO = '1012' THEN 20288
	WHEN ADM_NO = '1015' THEN 25466
ELSE 24444                             -- REST ALL FEE VALUES TAKE BY DEFAULT 24444;
END;
------------------------------------------------------
DELETE FROM STUDENTS
WHERE ADM_NO = 1017;
------------------------------------------------------
-- =============== AGGREGATE FUNCTIONS (Alias Names) ===================
/*
COUNT, COUNT DISTINC
SUM
MIN
MAX
AVERAGE
*/
---------------------------------------------------------
SELECT COUNT(*) AS [ALL RECORDS] FROM STUDENTS;
---------------------------------------------------------
SELECT COUNT(GENDER) AS GENDER_COUNT FROM STUDENTS;
---------------------------------------------------------
SELECT COUNT(GENDER) AS GENDER_COUNT_MALE FROM STUDENTS
WHERE GENDER = 'M';
---------------------------------------------------------
SELECT DISTINCT(GENDER) AS UNIQUE_GENDER FROM STUDENTS;
---------------------------------------------------------
SELECT DISTINCT(COURSE) AS UNIQUE_COURSE FROM STUDENTS;
---------------------------------------------------------
SELECT COUNT(DISTINCT(COURSE)) AS UNIQUE_COURSE_COUNT FROM STUDENTS;
---------------------------------------------------------
SELECT SUM(FEE) AS TOT_FEE FROM STUDENTS;
---------------------------------------------------------
SELECT AVG(FEE) AS AVERAGE_FEE FROM STUDENTS;
---------------------------------------------------------
SELECT ROUND(AVG(FEE), 1) AS AVERAGE_FEE FROM STUDENTS;   -- ROUND LIMITS THE DIGITS AFTER DECIMAL
---------------------------------------------------------
SELECT MIN(FEE) AS MIN_FEE FROM STUDENTS;
---------------------------------------------------------
SELECT MAX(FEE) AS MAX_FEE FROM STUDENTS;
---------------------------------------------------------
SELECT COURSE, SUM(FEE) AS TOT_FEE
FROM STUDENTS
GROUP BY COURSE;
---------------------------------------------------------
SELECT COURSE, AVG(FEE) AS AVERAGE_FEE
FROM STUDENTS
GROUP BY COURSE;
---------------------------------------------------------
SELECT COURSE, AVG(FEE) AS AVERAGE_FEE
FROM STUDENTS
GROUP BY COURSE;
---------------------------------------------------------
SELECT GENDER, COURSE, SUM(FEE) AS TOT_FEE
FROM STUDENTS
GROUP BY COURSE, GENDER;
---------------------------------------------------------
SELECT COURSE, GENDER, SUM(FEE) AS TOT_FEE
FROM STUDENTS
GROUP BY COURSE, GENDER
ORDER BY COURSE;
---------------------------------------------------------
SELECT GENDER, SUM(FEE) AS TOTAL_FEE FROM STUDENTS
GROUP BY GENDER;
---------------------------------------------------------
SELECT COURSE, COUNT(COURSE) AS STUDENT_COUNT FROM STUDENTS
GROUP BY COURSE
HAVING COUNT(COURSE) > 2
ORDER BY STUDENT_COUNT DESC;
----------------------------------------------------------
SELECT COURSE, SUM(FEE) AS TOT_FEE FROM STUDENTS
GROUP BY COURSE
HAVING SUM(FEE) > 70000;
-----------------------------------------------------
SELECT COURSE, SUM(FEE) AS TOTAL_FEE
FROM STUDENTS
WHERE COURSE IN('BA', 'DA', 'DS')
GROUP BY COURSE
HAVING SUM(FEE) > 50000
ORDER BY SUM(FEE) DESC
OFFSET 1 ROWS
FETCH NEXT 2 ROWS ONLY;
------------------------------------------------------
/*
================ JOINS ================
Joins the table
-------------------
 INNER JOIN (join)                 -- exact matching records
 LEFT JOIN (left outer join)       -- all records from left table and matched record from right table
 RIGHT JOIN (right outer join)     -- all records from right table and matched record from left table
 FULL JOIN (full outer join)       -- all records from both tables
 CROSS JOIN                        -- all rows from left table display with all rows from right table
 SELF JOIN                         -- joins with itself
 -------------------
 Joins the queries
 -------------------
 UNION            -- aloow unique values only
 UNION ALL        -- allow duplicates as well
 INTERSECT        -- allow common values only
 */

---------------------------------------
-- Step 1: Create the table-1 (Left Table)
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Gender VARCHAR(10),
    Class INT,
    Age INT
);

-- Step 2: Insert values into the table-1
INSERT INTO Student (StudentID, StudentName, Gender, Class, Age) VALUES
(101, 'John', 'Male', 10, 15),
(102, 'Sarah', 'Female', 10, 14),
(103, 'David', 'Male', 11, 16),
(104, 'Emma', 'Female', 11, 15),
(105, 'Mike', 'Male', 10, 15),
(106, 'Lily', 'Female', 12, 17),
(107, 'Noah', 'Male', 12, 16),
(108, 'Ava', 'Female', 11, 14),
(109, 'James', 'Male', 10, 15),
(110, 'Mia', 'Female', 12, 16);




-- Step 1: Create the table-2 (Right Table)
CREATE TABLE Result (
    ResultID INT PRIMARY KEY,
    StudentID INT,
    ExamID INT,
    Marks INT,
    Grade CHAR(1)
);

-- Step 2: Insert values into the table-2
INSERT INTO Result (ResultID, StudentID, ExamID, Marks, Grade) VALUES
(301, 101, 201, 85, 'A'),
(302, 102, 202, 78, 'B'),
(303, 103, 203, 90, 'A'),
(304, 104, 204, 90, 'A'),
(305, 105, 205, 70, 'C'),
(311, 111, 211, 79, 'B'),
(312, 112, 212, 84, 'A'),
(313, 113, 213, 81, 'A'),
(314, 114, 214, 92, 'A'),
(315, 115, 215, 76, 'C');


INSERT INTO Result (ResultID, StudentID, ExamID, Marks, Grade) VALUES
(319, 101, 201, 85, 'A'),
(320, 104, 204, 90, 'A'),
(321, 103, 203, 90, 'A');


SELECT * FROM STUDENT;

SELECT * FROM RESULT;

SELECT STUDENTID, STUDENTNAME FROM STUDENT;

SELECT STUDENTID, MARKS FROM RESULT;
-----------------------------------------------
--=============== INNER JOIN ===============

SELECT S.STUDENTID, S.STUDENTNAME, R.STUDENTID, R.MARKS
FROM STUDENT AS S
INNER JOIN RESULT AS R
ON S.STUDENTID = R.STUDENTID
WHERE R.MARKS > 80
ORDER BY R.MARKS DESC;
-----------------------------------------------
SELECT S.STUDENTID, S.STUDENTNAME, R.STUDENTID, R.MARKS
FROM STUDENT S
INNER JOIN RESULT R
ON S.STUDENTID = R.STUDENTID
-----------------------------------------------
SELECT S.STUDENTID, S.STUDENTNAME, R.STUDENTID, R.MARKS
FROM STUDENT S
JOIN RESULT R
ON S.STUDENTID = R.STUDENTID
-----------------------------------------------
SELECT STUDENT.STUDENTID, STUDENT.STUDENTNAME, RESULT.STUDENTID, RESULT.MARKS
FROM STUDENT
JOIN RESULT
ON STUDENT.STUDENTID = RESULT.STUDENTID
-----------------------------------------------
--=============== LEFT JOIN ===============
SELECT S.STUDENTID, S.STUDENTNAME, R.STUDENTID, R.MARKS
FROM STUDENT S
LEFT JOIN RESULT R
ON S.STUDENTID = R.STUDENTID
-----------------------------------------------
SELECT S.STUDENTID, S.STUDENTNAME, R.STUDENTID, R.MARKS
FROM STUDENT S
LEFT OUTER JOIN RESULT R
ON S.STUDENTID = R.STUDENTID
-----------------------------------------------
--=============== RIGHT JOIN ===============

SELECT S.STUDENTID, S.STUDENTNAME, R.STUDENTID, R.MARKS
FROM STUDENT S
RIGHT JOIN RESULT R
ON S.STUDENTID = R.STUDENTID
----------------------------------------------
SELECT S.STUDENTID, S.STUDENTNAME, R.STUDENTID, R.MARKS
FROM STUDENT S
RIGHT OUTER JOIN RESULT R
ON S.STUDENTID = R.STUDENTID
-----------------------------------------------
--=============== FULL JOIN ===============

SELECT S.STUDENTID, S.STUDENTNAME, R.STUDENTID, R.MARKS
FROM STUDENT S
FULL JOIN RESULT R
ON S.STUDENTID = R.STUDENTID
-----------------------------------------------------
SELECT S.STUDENTNAME, R.GRADE, R.MARKS
FROM STUDENT S
CROSS JOIN RESULT R
-----------------------------------------------------
-- SELF JOIN (A self join is when a table is joined with itself). 
-- It is useful for hierarchical or recursive data structures.

SELECT A.STUDENTNAME AS STUDENT1, B.STUDENTNAME AS STUDENT2, A.CLASS
FROM STUDENT A
JOIN STUDENT B
ON A.CLASS = B.CLASS 
AND A.STUDENTNAME < B.STUDENTNAME
ORDER BY STUDENT1;
--------------------------------------------------
-- ============== UNION, UNION ALL, INTERSECT (Joins two QUERIES) ===============

-- NUMBER OF COLUMNS MUST BE SAME
-- DATA TYPES MUST BE SAME
-- DATA INFORMATION SHOULD BE SAME

SELECT STUDENTID FROM STUDENT
UNION
SELECT STUDENTID FROM RESULT
------------------------------------------
SELECT STUDENTID FROM STUDENT
UNION ALL
SELECT STUDENTID FROM RESULT
------------------------------------------
SELECT STUDENTID FROM STUDENT
INTERSECT
SELECT STUDENTID FROM RESULT
------------------------------------------

-- ================ RANKING FUCNTIONS ===============

SELECT STUDENTID, MARKS, ROW_NUMBER() OVER (ORDER BY MARKS DESC) AS UNIQUE_RANK
FROM RESULT;					-- SIMPLY GIVES NORMAL SEQUENCE WITHOUT TAKING CARE OF TIES
--------------------------------------------------------------------------------
SELECT STUDENTID, MARKS, RANK() OVER (ORDER BY MARKS DESC) AS [RANK WITH SEQUENCE BREAK]
FROM RESULT;					-- GIVES THE PROPER RANK BUT BREAKS THE SEQUENCE
--------------------------------------------------------------------------------
SELECT STUDENTID, MARKS, DENSE_RANK() OVER (ORDER BY MARKS DESC) AS [RANK WITH PROPER SEQUENCE]
FROM RESULT;					-- GIVES THE PROPER RANK AND DOESN'T BREAK THE SEQUENCE
--------------------------------------------------------------------------------
SELECT STUDENTID, MARKS, NTILE(3) OVER (ORDER BY MARKS DESC) AS [GROUPED RANK]
FROM RESULT;					-- GIVES THE RANK IN GROUPS
--------------------------------------------------------------------------------
-- ============== CTE (COMMON TABLE EXPRESSION) - WINDOWS FUNCTION ================
-- TO SEE THE DESIRED RANKING (nth Rank) POSITION ONLY

WITH CTE_PROPER_RANK AS
(
SELECT STUDENTID, MARKS, DENSE_RANK() OVER (ORDER BY MARKS DESC) AS [RANK POSITION]
FROM RESULT
)
SELECT * FROM CTE_PROPER_RANK
WHERE [RANK POSITION] = 4;
------------------------------------------------------

-- ======== HOW TO REMOVE DUPLICATE ENTRIES ========

DELETE FROM RESULT
WHERE STUDENTID = 103;     -- REMOVE RECORD WHERE STUDENT-ID = 103, ORIGINAL ALSO REMOVED
----------------------------------------------------------
WITH REMOVE_DUP AS
(
SELECT STUDENTID, ROW_NUMBER() OVER (PARTITION BY STUDENTID ORDER BY STUDENTID) AS [DUP POSITION]
FROM RESULT
)
DELETE FROM REMOVE_DUP
WHERE [DUP POSITION] > 1;


-------------------------------------------------------------------
SELECT * FROM RESULT;      -- CHECK ALL COLUMNS/RECORDS OF A TABLE
-------------------------------------------------------------------

-- ============== WILDCARD : %  _  [ ] ============= LIKE operator
-- % SEARCHES MULTIPLE CHARACTERS
-- _ SEARCHES ONLY SINGLE CHARACTER
-- [ ] SEARCHES FROM RANGE OF CHARACTERS

SELECT * FROM STUDENTS
WHERE COURSE = 'DA';


SELECT * FROM STUDENTS
WHERE S_NAME = 'ZAHID';


SELECT * FROM STUDENTS
WHERE S_NAME LIKE 'Z%';


SELECT * FROM STUDENTS
WHERE S_NAME LIKE 'ZA%';


SELECT * FROM STUDENTS
WHERE S_NAME LIKE '%N';


SELECT * FROM STUDENTS
WHERE S_NAME LIKE '%N';


SELECT * FROM STUDENTS
WHERE S_NAME LIKE '%SH';


SELECT * FROM STUDENTS
WHERE S_NAME LIKE '%N%';     -- SEARCH THE STRING WHICH CONTAINS 'N'


SELECT * FROM STUDENTS
WHERE S_NAME LIKE '%AH%';     -- SEARCH THE STRING WHICH CONTAINS 'AH'


SELECT * FROM STUDENTS
WHERE S_NAME LIKE '_A%';


SELECT * FROM STUDENTS
WHERE S_NAME LIKE '%A_';


SELECT * FROM STUDENTS
WHERE S_NAME LIKE '[A-L]%';


SELECT * FROM STUDENTS
WHERE S_NAME LIKE '%[A-D]';



SELECT * FROM STUDENTS;
-----------------------------------------
-- ============= STORED PROCEDURE ============

CREATE PROCEDURE COURSE_DETAIL AS
BEGIN
	SELECT COURSE, SUM(FEE) AS TOTAL_FEE
	FROM STUDENTS
	WHERE COURSE IN('BA', 'DA', 'DS')
	GROUP BY COURSE
	HAVING SUM(FEE) > 50000
	ORDER BY SUM(FEE) DESC
	OFFSET 1 ROWS
	FETCH NEXT 2 ROWS ONLY;
END;


EXEC COURSE_DETAIL;



EXEC PERFORMANCE;
--------------------------------------------------------
SELECT * FROM NEW_STUDENT_INFO;


USE AYAAN
SELECT * INTO NEW_STUDENT
FROM DA2025.DBO.NEW_STUDENT_INFO;


SELECT * FROM NEW_STUDENT;


SELECT * FROM NEW_STUDENT_INFO;
--============== IMPORT LARGE DATASETS INTO SQL ==============

USE DA2025
SELECT * FROM SALES;


SELECT ORDER_ID, CITY, STATE FROM SALES;


SELECT ORDER_ID, CITY, STATE, COUNTRY FROM SALES
WHERE COUNTRY = 'FRANCE';


SELECT ORDER_ID, CITY, STATE, COUNTRY FROM SALES
WHERE COUNTRY = 'FRANCE' AND CITY = 'REIMS';


SELECT COUNTRY, SUM(TOTAL_AMOUNT) AS [TOTAL AMOUNT]
FROM SALES
GROUP BY COUNTRY
ORDER BY SUM(TOTAL_AMOUNT) DESC;


SELECT COUNTRY, SUM(TOTAL_AMOUNT) AS [TOTAL AMOUNT]
FROM SALES
GROUP BY COUNTRY
ORDER BY SUM(TOTAL_AMOUNT) DESC
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY;


SELECT TOP 2 SHIP_MODE, SUM(UNIT_PROFIT) AS MORE_REV_SHIP_MODE
FROM SALES
GROUP BY Ship_Mode
ORDER BY SUM(UNIT_PROFIT) DESC


SELECT SHIP_MODE, SUM(UNIT_PROFIT) AS SECOND_POS_REV
FROM SALES
GROUP BY Ship_Mode
ORDER BY SUM(UNIT_PROFIT) DESC
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY;
------------------------------------------------------------------------
--================PROJECT: Advanced Sales Insights – Unlocking Data Trends====================

-- 🔹 Q1: Find all orders shipped via 'Economy' mode with a total amount greater than ₹25,000.

SELECT * FROM Sales
WHERE Ship_Mode = 'Economy' AND Total_Amount > 25000;


 
-- 🔹 Q2: Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.

SELECT * FROM Sales
WHERE Category = 'Technology' AND Country = 'Ireland' AND Order_Date > '2020-01-01';



-- 🔹 Q3: List the top 10 most profitable sales transactions in descending order.

SELECT TOP 10 * FROM Sales
ORDER BY Unit_Profit DESC;



-- 🔹 Q4: Find all customers whose name starts with 'J' and ends with 'n'.

SELECT * FROM sales
WHERE Customer_Name LIKE 'J%N';



-- 🔹 Q5: Retrieve all product names that contain 'Acco' anywhere in the name.

SELECT * FROM SALES
WHERE Product_Name LIKE '%Acco%';



-- 🔹 Q6: Get the top 5 cities with the highest total sales amount.

SELECT TOP 5 City, SUM(Total_Amount) AS Total_Sales
FROM Sales
GROUP BY City
ORDER BY Total_Sales DESC;


-- 🔹 Q7: Display the second set of 10 records (pagination).

SELECT * FROM Sales
ORDER BY Order_ID
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;


-- 🔹 Q8: Find the total revenue, average unit cost, and total number of orders.

SELECT SUM(TOTAL_AMOUNT) AS [TOTAL REVENUE],
		AVG(UNIT_COST) AS [average unit cost],
		COUNT(ORDER_ID) AS [total number of orders]
FROM SALES;


-- 🔹 Q9: Get total sales per product category.

SELECT Category, SUM(Total_Amount) AS Total_Sales
FROM Sales
GROUP BY Category;


-- 🔹 Q10: Find the number of orders placed by each customer.

SELECT Customer_Name, COUNT(Order_ID) AS Order_Count
FROM Sales
GROUP BY Customer_Name
ORDER BY Order_Count DESC;


-- 🔹 Q11: Get customers who have placed orders worth more than ₹50,000.

SELECT Customer_Name, SUM(Total_Amount) AS Total_Spent
FROM Sales
GROUP BY Customer_Name
HAVING SUM(Total_Amount) > 50000
ORDER BY Total_Spent DESC;


-- 🔹 Q12: Rank products based on total sales using RANK().

SELECT Product_Name, SUM(Total_Amount) AS Total_Sales,
       RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Sales_Rank
FROM Sales
GROUP BY Product_Name;



-- 🔹 Q13: Find the top 5 customers by sales revenue using DENSE_RANK().

SELECT TOP 5 Customer_Name, SUM(Total_Amount) AS Total_Spent,
       DENSE_RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Top_Rank
FROM Sales
GROUP BY Customer_Name
ORDER BY Top_Rank;


-- 🔹 Q14: Use a CTE to find the top 3 most sold product categories.

WITH CategorySales AS 
(
    SELECT Category, SUM(Sold_Quantity) AS Total_Units,
           RANK() OVER (ORDER BY SUM(Sold_Quantity) DESC) AS Rank
    FROM Sales
    GROUP BY Category
)
SELECT * FROM CategorySales WHERE Rank <= 3;


-- 🔹 Q15: Use a CTE to find the top-selling product in each category.

WITH TopProducts AS 
(
    SELECT Category, Product_Name, SUM(Total_Amount) AS Total_Sales,
           RANK() OVER (PARTITION BY Category ORDER BY SUM(Total_Amount) DESC) AS Rank
    FROM Sales
    GROUP BY Category, Product_Name
)
SELECT * FROM TopProducts WHERE Rank = 1;


--==========================
     SELECT * FROM SALES;
--==========================
