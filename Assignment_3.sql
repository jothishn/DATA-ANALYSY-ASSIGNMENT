
-- 3. b. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]
select * from payments;
CREATE FUNCTION pur_stat( cid int )
 RETURNS VARCHAR(20) AS 
BEGIN
DECLARE stat VARCHAR(20);
 DECLARE credit numeric; 
SET credit = (select sum(Amount) from Payments where customernumber = cid); 
IF credit > 50000 THEN SET stat = 'platinum';
 IF (credit >= 25000 AND credit <= 50000) 
THEN SET stat = 'gold';
 ELSEIF credit < 25000 THEN SET stat = 'silver';
 END IF;
 RETURN (stat);
 END
-- b. Write a query that displays customerNumber, customername and purchase_status from customers table.
select c.customernumber,c.customername from customers c inner join payments p on c.customernumber=p.customernumber;
select * from customers;
-- 5 Select the first name of the employee who gets the third highest salary. [table: employee]

select * from employee order by salary desc;

SELECT * FROM employee ORDER BY salary DESC LIMIT 1 OFFSET 2;

-- 6. Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1. [table: employee]
select * from employee;
SELECT 
	empid,
    fname, 
	lname,
    deptno,
	salary, 
	RANK() OVER (ORDER BY salary desc) salary_rank
FROM 
	employee;