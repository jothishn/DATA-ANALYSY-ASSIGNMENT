use assignment;
show tables;
select * from employee;
-- 1. select all employees in department 10 whose salary is greater than 3000. [table: employee]
select * from employee 
where deptno=10 and salary>3000;
-- 2.The grading of students based on the marks they have obtained is done as follows: 
select * from students;
-- a. How many students have graduated with first class?
select count(id) as student_graduated_with_first_class
 from students
 where marks between 60 and 80;
 -- b. How many students have obtained distinction? 
 select count(id) as students_got_distinction
 from students
 where marks between 80 and 100;
 
 -- 3 Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]

select * from station;

select distinct 
city from station where id%2=0 order by city;

-- 4. Find the difference between the total number of city entries in the table and the number of distinct city entries in the table. 
-- In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, 
-- write a query to find the value of N-N1 from station.
-- [table: station]

select (count(CITY)- count(distinct CITY)) from STATION;

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
-- Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]

SELECT CITY FROM STATION WHERE left(CITY,1) IN  ('a', 'e', 'i', 'o', 'u');

-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
-- Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%') AND
 (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u') order by city; 
 
 -- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
 
 SELECT DISTINCT CITY FROM STATION WHERE upper(SUBSTR(CITY,1,1)) NOT IN ('A','E','I','O','U') AND lower(SUBSTR(CITY,1,1)) NOT IN
('a','e','i','o','u');  

-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
-- Your result cannot contain duplicates. [table: station]

SELECT DISTINCT CITY FROM STATION WHERE LOWER(SUBSTR(CITY,1,1)) 
NOT IN ('a','e','i','o','u') OR LOWER(SUBSTR(CITY, LENGTH(CITY),1)) NOT IN ('a','e','i','o','u');   

-- Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months.
--  Sort your result by descending order of salary. [table: emp]
select * from emp;

SELECT NAME FROM EMPLOYEE WHERE SALARY > 2000  AND MONTHS < 36 ORDER BY EMPLOYEE_ID desc; 

-- 6. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. 
-- Sort your result by descending order of salary. [table: emp]

SELECT first_name
FROM Emp 
WHERE Salary > 2000
  AND Hire_Date >= DATE_SUB(CURRENT_DATE, INTERVAL 36 MONTH)
ORDER BY hire_date desc;

-- 7. How much money does the company spend every month on salaries for each department? [table: employee]
select * from employee;

SELECT deptno, SUM(salary)
FROM employee
GROUP BY deptno;

--  How many cities in the CITY table have a Population larger than 100000. [table: city]

select * from city;

SELECT COUNT(population) as population_larger_than_100000
FROM CITY
WHERE population > 100000;

-- 9. What is the total population of California? [table: city]
select * from city;

select sum(population) as total_population_of_California
from city
where district = 'California';

-- 10. What is the average population of the districts in each country? [table: city]
select * from city;
select avg(population),district from city group by district;

-- Find the ordernumber, status, customernumber, customername and comments for all orders that are Disputed=  [table: orders, customers]

select * from orders;
select * from customers;

select a.ordernumber,a.status,a.comments,
b.customername,b.customernumber from orders a 
inner join customers b on a.customernumber=b.customernumber;
