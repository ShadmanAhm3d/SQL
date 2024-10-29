jCjREATE TABLE employees (
  emp_id SERIAL PRIMARY KEY,
  emp_name VARCHAR(100),
  salary DECIMAL(10, 2),
  department VARCHAR(50)
);


SELECT * FROM employees;

--Add a table coloumn

ALTER TABLE employees
ADD COLUMN date_of_joining DATE;

-- Drop a table coloumn

ALTER TABLE employees
DROP COLUMN department;


-- Modify an Existing Column

ALTER TABLE employees
ALTER COLUMN salary TYPE INTEGER;


-- Rename a Column

ALTER TABLE employees
RENAME COLUMN emp_name TO employee_name;


-- Set a Default Value

ALTER TABLE employees
ALTER COLUMN salary SET DEFAULT 50000; 

-- Drop Default Value

ALTER TABLE employees
ALTER COLUMN salary DROP DEFAULT;

-- Add a Constraint ** 

ALTER TABLE employees
ADD CONSTRAINT unique_Contstraint UNIQUE(employee_name);

-- DROP a Constraint

ALTER TABLE employees
DROP CONSTRAINT unique_Contstraint ;


-- Rename table 

ALTER TABLE employees
RENAME TO staff;

-- Change the Primary KEY to Department Column

ALTER TABLE staff
DROP CONSTRAINT staff_pkey;

ALTER TABLE staff
ADD PRIMARY KEY(emp_id);


SELECT * FROM staff;


