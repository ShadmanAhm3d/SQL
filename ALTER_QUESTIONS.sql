CREATE TABLE employees (
  emp_id SERIAL PRIMARY KEY, 
  emp_name VARCHAR(100),
  salary DECIMAL(10, 2),
  department VARCHAR(50)
);
SELECT * FROM employees;

--Write a query to add a new column date_of_joining of type DATE to the employees table.

ALTER TABLE employees
ADD COLUMN date_of_joining DATE;

--How would you add a VARCHAR column named address with a
--maximum length of 200 characters, and a default value of 'Unknown'?

ALTER TABLE employees
ADD COLUMN address VARCHAR(200) DEFAULT 'Unknown';


--Write a query to change the data type of the salary column to INTEGER

ALTER TABLE employees
ALTER COLUMN salary TYPE INTEGER;

--How would you modify the salary column to set a default value of 30000?

ALTER TABLE employees
ALTER COLUMN salary SET DEFAULT '30000';

-- Write a query to change the emp_name column so that it cannot have NULL values.

ALTER TABLE employees
ALTER COLUMN emp_name SET NOT NULL;

INSERT INTO employees(emp_id,emp_name,salary,department)
			VALUES(2,'AHMED',33333,'HR'),
			      (3,'AHMED',33333,'HR');



-- How would you drop the department column from the employees table?

ALTER TABLE employees
DROP COLUMN department;

ALTER TABLE employees
ADD COLUMN department VARCHAR(100) DEFAULT 'HR';


-- Write a query to drop the date_of_joining column if it exists.

ALTER TABLE employees
DROP COLUMN IF EXISTS date_of_joining 

-- How would you rename the column emp_name to employee_name?

ALTER TABLE employees
RENAME COLUMN emp_name TO employee_name;

--Write a query to rename the table employees to staff.

ALTER TABLE employees
RENAME TO staff;

ALTER TABLE staff
RENAME TO employees;

--Write a query to add a unique constraint on the emp_name column.

ALTER TABLE employees
ADD CONSTRAINT unique_emp_name UNIQUE(employee_name);


--How would you add a check constraint to ensure that salary is greater than zero?

ALTER TABLE employees
ADD CONSTRAINT CashCheck CHECK(salary > 0);

--Write a query to drop the unique_emp_name constraint.

ALTER TABLE employees
DROP CONSTRAINT unique_emp_name ;


--How would you remove the check_salary_positive constraint?

ALTER TABLE employees
DROP CONSTRAINT CashCheck;


--Write a query to add a foreign key constraint on the department
--column that references a departments table with a dept_id column as the primary key.

ALTER TABLE employees
ADD CONSTRAINT fk_cons FOREIGN KEY(departments)
REFERENCES departments(dept_id);

-- Write a query to remove any default value set on the salary column.

ALTER TABLE employees
ALTER COLUMN salary DROP DEFAULT


--------------------------END--------------------------------------------------------------------














