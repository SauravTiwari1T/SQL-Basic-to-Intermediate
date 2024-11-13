-- Create the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,                     -- Unique identifier for each employee
    first_name VARCHAR(50),                          -- First name of the employee
    last_name VARCHAR(50),                           -- Last name of the employee
    department VARCHAR(50),                          -- Department of the employee
    hire_date DATE,                                  -- Date the employee was hired
    salary DECIMAL(10, 2),                           -- Salary of the employee
    performance_rating VARCHAR(20),                  -- Employee performance rating (e.g., 'Excellent', 'Good')
    status VARCHAR(20),                              -- Employee status (e.g., 'Active', 'Inactive')
    phone_number VARCHAR(15),                        -- Phone number of the employee
    department_id INT,                               -- Department ID, which may link to a `departments` table
    manager_id INT,                                  -- Manager's employee ID (self-reference for managers)
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP  -- Timestamp to track last update
);

-- Create the inactivity_log table
CREATE TABLE inactivity_log (
    inactivity_id INT PRIMARY KEY IDENTITY(1,1),         -- Auto-incremented primary key
    employee_id INT,                                      -- Employee ID (foreign key)
    inactivity_reason VARCHAR(255),                       -- Reason for inactivity
    inactivity_date DATE,                                 -- Date of inactivity
    status VARCHAR(20),                                   -- Inactivity status (e.g., 'Active', 'Inactive')
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,        -- Automatically set the current timestamp
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)  -- Foreign key reference to employees table
);

-- Create the departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY IDENTITY(1,1),         -- Unique ID for each department
    department_name VARCHAR(100) NOT NULL,                -- Name of the department (e.g., 'Sales', 'IT')
    budget DECIMAL(15, 2),                                -- Budget for the department
    location VARCHAR(100),                                -- Location of the department (optional)
    manager_id INT,                                       -- Employee ID of the department's manager
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP         -- Timestamp for when the department was created
);




-- Insert sample employees into the employees table
INSERT INTO employees (employee_id, first_name, last_name, department, hire_date, salary, performance_rating, status, phone_number, department_id, manager_id)
VALUES
(101, 'John', 'Doe', 'Sales', '2018-04-01', 45000.00, 'Excellent', 'Active', '555-1234', 1, NULL),
(102, 'Jane', 'Smith', 'IT', '2016-07-15', 60000.00, 'Good', 'Active', '555-5678', 2, 101),
(103, 'Sam', 'Brown', 'Sales', '2019-01-20', 47000.00, 'Average', 'Inactive', '555-8765', 1, 101),
(104, 'Sara', 'White', 'HR', '2020-03-10', 51000.00, 'Excellent', 'Active', '555-4321', 3, NULL),
(105, 'Mike', 'Green', 'IT', '2017-06-25', 58000.00, 'Good', 'Active', '555-7890', 2, 101),
(106, 'Emily', 'Black', 'Sales', '2021-05-30', 43000.00, 'Good', 'Active', '555-1011', 1, NULL),
(107, 'David', 'Gray', 'IT', '2015-11-02', 65000.00, 'Excellent', 'Inactive', '555-2022', 2, 101);

-- Insert sample inactivity records into the inactivity_log table
INSERT INTO inactivity_log (employee_id, inactivity_reason, inactivity_date, status)
VALUES
(103, 'Leave', '2023-08-01', 'Inactive'),
(107, 'Termination', '2023-09-15', 'Terminated');

-- Insert sample data into the departments table
INSERT INTO departments (department_name, budget, location, manager_id)
VALUES
('Sales', 1000000.00, 'Headquarters', 101),  -- John Doe manages Sales department
('IT', 2000000.00, 'Headquarters', 102),     -- Jane Smith manages IT department
('HR', 500000.00, 'Branch A', 104);          -- Sara White manages HR department





-- 1. Basic Update for Single Column
-- To update the salary of an employee with employee_id 101 to 50,000 in the employees table:
-- The SQL UPDATE statement allows you to modify existing records in a table.
UPDATE employees
SET salary = 50000
WHERE employee_id = 101

-- 2. Update Multiple Columns at Once
-- To update both the salary to 50000 and department_id 301 for an employee with employee_id 102 in the employees table:
-- The SQL UPDATE statement allows you to modify multiple columns in a single query.
UPDATE employee
SET salary = 50000 , department_id = 301 
WHERE employee_id = 102 

--3. To update the phone_number column to NULL for an employee with employee_id 105:
-- The SQL UPDATE statement allows you to set a column value to NULL, indicating the absence of data.
UPDATE employee 
SET phone_number = NULL 
WHERE employee_id = 105;

--4. To update the salary for all employees by setting it to the average salary of all employees:
-- The SQL UPDATE statement can be used along with a subquery to calculate the average salary,
-- and then update each employee's salary to that average value.
UPDATE employees 
SET salary = (SELECT AVG(salary) FROM employees)

--5. To increase the salary of employees by 10% if their department's budget is greater than  1,000,000:
-- The SQL query needs to join the employees table with the departments table based on the department_id.
-- Then, the UPDATE statement will increase the salary by 10% for those employees whose department's budget is greater than 1,000,000.

UPDATE employees AS e
JOIN department AS d
ON  e.department_id = d.department_id 
SET salary = salary + salary * 0.10
WHERE d.budget > 1000000

--6. To update the status of employees to 'Active' only if they do not have a record in the inactivity_log table:
-- The SQL query needs to check for employees who are not present in the inactivity_log table.
-- You can use a `LEFT JOIN` or a `NOT EXISTS` condition to ensure that only employees without an inactivity record are updated.

  -- METHOD ONE USING NOT EXIST 
UPDATE employees AS E   
SET E.status = 'Active'
WHERE NOT EXISTS (
  SELECT 1 FROM inactivity_log AS IL 
  WHERE IL.employee_id = E.employee_id
  )

 -- METHOD TWO USING LEFT JOIN 
UPDATE employees AS E 
LEFT JOIN inactivity_log AS IL 
ON IL.employee_id = E.employee_id
SET E.status = 'Active'
 WHERE IL.employee_id IS NULL;

--7. To update the salary of employees based on their performance_rating using a CASE statement:
-- The CASE statement allows you to apply different salary increases based on the performance_rating.
-- - "Excellent" -> 15% increase
-- - "Good" -> 10% increase
-- - "Average" -> 5% increase
UPDATE employees
SET salary = CASE 
             WHEN performance_rating = "Excellent" THEN salary+salary*0.15
             WHEN performance_rating = "Good" THEN salary+salary*0.10
             WHEN performance_rating = "Good" THEN salary+salary*0.5
            ELSE salary
           END;

-- 8 Update the salary of employees in the "Sales" department
-- who have been with the company for more than 5 years, 
-- increasing their salary by 20%.

UPDATE employees 
SET salary = salary + salary*0.20
WHERE department = "Sales"
AND DATEDIFF( YEAR , hire_date  , GETDATE()) > 5;

--9 Update the manager_id of employees who currently have no manager (manager_id is NULL)
-- Set the manager_id to the employee_id of the employee with employee_id 101
UPDATE employees
SET manager_id = 101 
WHERE manager_id IS NULL
