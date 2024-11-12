-- COUNT(): Returns the number of rows in a group.
-- Example Query: Count the total number of rows in a table or group.
-- COUNT(*) 
-- Returns the number of rows, including rows with NULL values.

-- SUM(): Returns the total sum of a numeric column.
-- Example Query: Calculate the total sum of the 'salary' column.
-- SUM(salary) 
-- Returns the sum of all values in the 'salary' column.

-- AVG(): Returns the average of a numeric column.
-- Example Query: Calculate the average salary.
-- AVG(salary) 
-- Returns the average of all values in the 'salary' column.

-- MAX(): Returns the maximum value of a column.
-- Example Query: Find the highest salary.
-- MAX(salary) 
-- Returns the maximum value in the 'salary' column.

-- MIN(): Returns the minimum value of a column.
-- Example Query: Find the lowest salary.
-- MIN(salary) 
-- Returns the minimum value in the 'salary' column.

-- GROUP_CONCAT(): Concatenates values from a group into a single string (MySQL).
-- Example Query: Concatenate all first names into a single string.
-- GROUP_CONCAT(first_name) 
-- Concatenates values from the 'first_name' column into one string.

-- STRING_AGG(): Concatenates values with a delimiter (PostgreSQL).
-- Example Query: Concatenate all first names, separated by a comma.
-- STRING_AGG(first_name, ', ') 
-- Concatenates values from 'first_name' column, separated by a comma (PostgreSQL-specific).

-- VARIANCE(): Returns the variance of values in a numeric column.
-- Example Query: Calculate the variance of the 'salary' column.
-- VARIANCE(salary) 
-- Returns the statistical variance of all values in the 'salary' column.

-- STDDEV(): Returns the standard deviation of values in a numeric column.
-- Example Query: Calculate the standard deviation of the 'salary' column.
-- STDDEV(salary) 
-- Returns the standard deviation of all values in the 'salary' column.

-- FIRST(): Returns the first value in a column.
-- Example Query: Get the first salary value in the column.
-- FIRST(salary) 
-- Returns the first value in the 'salary' column based on the current order.

-- LAST(): Returns the last value in a column.
-- Example Query: Get the last salary value in the column.
-- LAST(salary) 
-- Returns the last value in the 'salary' column based on the current order.

-- MEDIAN(): Returns the median value in a numeric column.
-- Example Query: Calculate the median of the 'salary' column.
-- PERCENTILE_CONT(0.5) 
-- Returns the median value of the 'salary' column. PERCENTILE_CONT(0.5) is used in SQL for calculating the median (equivalent to the 50th percentile).


CREATE TABLE department (
    department_id INT PRIMARY KEY IDENTITY(1,1),
    department_name VARCHAR(100) NOT NULL,
    budget DECIMAL(15, 2),
    location VARCHAR(100),
    manager_id INT,
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE employees_AGE (
    employee_id INT PRIMARY KEY PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE,
    salary DECIMAL(10, 2),
    performance_rating VARCHAR(20),
    status VARCHAR(20),
    phone_number VARCHAR(15),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert sample data into departments table
INSERT INTO departments (department_name, budget, location, manager_id)
VALUES
('Sales', 1000000.00, 'Headquarters', 101),
('IT', 2000000.00, 'Headquarters', 102),
('HR', 500000.00, 'Branch A', 104);

-- Insert sample data into employees table
INSERT INTO employees (first_name, last_name, department_id, hire_date, salary, performance_rating, status, phone_number)
VALUES
('John', 'Doe', 1, '2018-04-01', 45000.00, 'Excellent', 'Active', '555-1234'),
('Jane', 'Smith', 2, '2016-07-15', 60000.00, 'Good', 'Active', '555-5678'),
('Sam', 'Brown', 1, '2019-01-20', 47000.00, 'Average', 'Inactive', '555-8765'),
('Sara', 'White', 3, '2020-03-10', 51000.00, 'Excellent', 'Active', '555-4321'),
('Mike', 'Green', 2, '2017-06-25', 58000.00, 'Good', 'Active', '555-7890'),
('Emily', 'Black', 1, '2021-05-30', 43000.00, 'Good', 'Active', '555-1011'),
('David', 'Gray', 2, '2015-11-02', 65000.00, 'Excellent', 'Inactive', '555-2022');


--1. SQL Query to find the total salary of employees_AGE in each department
-- This query calculates the total salary for each department in the 'employees' table.
SELECT SUM(salary) [TOTAL] FROM employees_AGE
GROUP BY department_ID

--2. SQL Query to find the average salary of employees in each department
-- This query calculates the average salary for each department in the 'employees' table.

--3 SQL Query to find the number of employees in each department
-- This query counts the number of employees for each department in the 'employees' table.

/*4 Find the maximum salary in each department.
Question: Write a SQL query to find the maximum salary in each department.*/
SELECT MAX(salary) FROM employees_AGE
GROUP BY department_id

--5. Write a SQL query to find the employee with the highest salary in each department.
SELECT * FROM employees_AGE
WHERE (department_id , salary) IN (SELECT department_id , MAX(salary) FROM employees_AGE
                                    GROUP BY department_id)
--6.  Write a SQL query to find the second highest salary in each department.

SELECT department_id, MAX(salary) AS second_highest_salary
FROM [employees_AGE] AS e1
WHERE salary < (
    SELECT MAX(salary)
    FROM [employees_AGE] e2
    WHERE e2.department_id = e1.department_id
)
GROUP BY department_id;

--7. Write a SQL query to find the employee with the lowest salary in each department. 
SELECT MIN(salary) FROM employees_AGE
GROUP BY department_id

--8. Write a SQL query to find the departments where the average salary is greater than $50,000.
SELECT department_id FROM employees_AGE
WHERE salary > 50000

--9. Write a SQL query to find the department with the highest total salary.
SELECT TOP 1 department_id , SUM(salary) AS TOTAL FROM employees_AGE
GROUP BY department_id
ORDER BY TOTAL DESC
