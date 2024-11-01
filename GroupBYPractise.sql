CREATE TABLE employees(	
	emp_Id SERIAL PRIMARY KEY,
	fname VARCHAR(100) NOT NULL,
	lname VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	department VARCHAR(100),
	salary DECIMAL(10,2) DEFAULT 30000.00,
	hire_date DATE NOT NULL DEFAULT CURRENT_DATE
		
);

SELECT * FROM employees

DELETE FROM EMPLOYEES ;

INSERT INTO employees (fname, lname, email, department, salary, hire_date)
VALUES 
('John', 'Doe', 'john.doe@email.com', 'HR', 45000.00, '2023-01-10'),
('Jane', 'Smith', 'jane.smith@email.com', 'Finance', 50000.00, '2022-05-15'),
('Bob', 'Johnson', 'bob.johnson@email.com', 'IT', 60000.00, '2021-12-01'),
('Alice', 'Davis', 'alice.davis@email.com', 'HR', 30000.00, '2023-02-25'),
('Carol', 'Brown', 'carol.brown@email.com', 'IT', 70000.00, '2021-10-30'),
('Dave', 'Wilson', 'dave.wilson@email.com', 'Finance', 55000.00, '2022-08-07');



SELECT COUNT(emp_id),department AS employee_Count_per_department from employees
GROUP BY department;


SELECT AVG(salary)


SELECT avg(salary),department from employees
group by department;

SELECT SUM(salary),department from employees
group by department;

SELECT department ,MAX(salary) AS MaximumSalaryOfDept from employees
group by department;

SELECT department, MIN(salary) AS MinimumSalaryofDept from employees
group by department;


-- Group employees by hire year and count how many employees were hired each year.
SELECT EXTRACT(YEAR FROM hire_date) AS hireYear, COUNT(emp_id) AS employee_count
FROM employees
group by hireYear;

-- Find the average salary of employees who were hired in each year.
SELECT EXTRACT(YEAR FROM hire_date) as HireYear, AVG(salary) as AvgSalary
FROM employees
GROUP BY HireYear;

-- Group by department and find the number of employees who earn more than 50,000.

-- SELECT department, COUNT(SELECT salary FROM employees WHERE salary > 50000) AS HighEarners
-- FROM employees
-- GROUP BY department;

SELECT department,COUNT(emp_id) AS highEarners
FROM employees
WHERE salary > 50000
GROUP BY department


-- Group by department and get the average salary, but only for departments with more than 1 employee.

SELECT department, AVG(salary) as AVGSALARY
FROM employees
GROUP BY department
HAVING COUNT(emp_id) > 1 ;

-- Find the number of employees in each department who were hired in 2022.

SELECT department , COUNT(emp_id) as HIRED
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 2022
GROUP by department


-- List each department and show the total number of employees, as well as the total salary cost for each department.

SELECT department, COUNT(emp_id) , SUM(salary)
FROM employees
GROUP BY department


-- Find the department with the highest average salary.

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 1;

-- Show the total salary paid to employees hired in each year.

SELECT EXTRACT(YEAR FROM hire_date) AS HireYear,SUM(salary)
FROM employees
GROUP BY HireYear


-- List the departments where more than two employees have a salary greater than 50,000.
SELECT department, COUNT(emp_id) AS People 
FROM employees
WHERE salary > 50000
GROUP by department
HAVING COUNT(emp_id) > 2 ;


-- Find the average salary for each department, but only include departments that have more than 3 employees.

SELECT department, AVG(salary) 
FROM employees
GROUP BY department
HAVING COUNT(emp_id) > 3


-- List each department and the percentage of total employees that belong to that department.
SELECT department , (COUNT (emp_id) * 100.0/(SELECT COUNT(*) FROM employees)) AS PERCENTAGEOF
FROM employees
GROUP BY department







--Write a query to count the number of employees in each department.

SELECT department,COUNT(emp_Id) as Total_Employees 
FROM employees
GROUP BY department;

-- Write a query to find the total salary expenses for each department.

SELECT department,SUM(salary) as Total
FROM employees
GROUP BY department;

-- Write a query to find the highest salary in each department.

SELECT department, MAX(salary) as MaximalSalary
FROM employees
GROUP BY department;

--Write a query to count the number of employees hired in each year.
--Use hire_date to extract the year.


SELECT COUNT(emp_id), EXTRACT(YEAR from hire_date) as hireYear
FROM employees
GROUP BY hireYear;

--









