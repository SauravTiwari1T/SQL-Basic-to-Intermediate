-- 1. Scenario: Filtering Employees Not in Specific Departments
-- Question:
-- Write a query to retrieve all employees who are not in the departments 'HR' and 'IT'. Also, ensure that the results are ordered by their HireDate in descending order.
SELECT * FROM employees
WHERE NOT department IN ('HR' ,'IT' ) 
ORDER BY HireDate DESC

--2. Scenario: Employees Not Hired Between Two Dates
-- Question:
-- Write a query to list all employees who were not hired between '2019-01-01' and '2021-12-31', ordered by their Salary in ascending order.
SELECT * FROM employees
WHERE NOT HireDate BETWEEN '2019-01-01'  AND '2021-12-31'
ORDER BY Salary 

-- 3. Scenario: Employees with Salary Not Within a Range
-- Question:
-- Write a query to find all employees whose Salary is not between 55,000 and 70,000, and list them in order of their FirstName alphabetically.
SELECT * FROM employees
WHERE NOT Salary BETWEEN  5500 AND  70000
ORDER BY FirstName 

-- 4. Scenario: Employees in Specific Departments Excluding One
-- Question:
-- Write a query to find employees who belong to either 'HR', 'Finance', or 'Marketing' departments, but not the 'IT' department. Display their EmployeeId, FirstName, and Department only.


-- 5. Scenario: Employees Not Matching a Set of Specific Names
-- Question:
-- Write a query to find all employees who do not have the first name 'John' or 'Jane'. Display their EmployeeId, FirstName, LastName, and Salary columns.

-- 6. Scenario: Employees Not Falling Within a Salary Range with Conditions
-- Question:
-- Write a query to retrieve all employees whose Salary is either less than 60,000 or greater than 70,000, but not within the 60,000 to 70,000 range. Display their EmployeeId, FirstName, LastName, and Salary.
SELECT EmployeeId, FirstName , LastName , Salary FROM employees
WHERE NOT Salary BETWEEN  60000 AND  70000


-- 7. Scenario: Filtering Employees Based on Multiple Date Ranges
-- Question:
-- Write a query to retrieve all employees who were not hired within the following periods:

-- From '2020-01-01' to '2020-12-31'
-- From '2022-01-01' to '2022-12-31'
-- The results should be ordered by their HireDate in ascending order.

-- 8. Scenario: Combining NOT and IN with Multiple Criteria
-- Question:
-- Write a query to retrieve all employees who are not in the 'IT' or 'HR' departments and whose Salary is not in the range 60,000 to 80,000. Sort the result by Department in descending order.

-- 9. Scenario: Employees Who Do Not Match a List of Salaries
-- Question:
-- Write a query to find all employees whose Salary is not one of the following: 50,000, 60,000, or 70,000. Display their EmployeeId, FirstName, LastName, and Salary.

-- 10. Scenario: 10. Scenario: Employees Excluding Multiple Date Ranges
--Question:
--Write a query to find employees who were not hired within these two specific ranges:

-- From '2018-01-01' to '2018-12-31'
-- From '2021-01-01' to '2021-12-31'
-- The query should return the EmployeeId, FirstName, HireDate, and Department columns, ordered by FirstName alphabetically. Excluding Multiple Date Ranges

SELECT EmployeeId ,FirstName ,HireDate,Department FROM employees
WHERE NOT HireDate BETWEEN  '2018-01-01' AND  '2018-12-31'
AND NOT HireDate BETWEEN '2021-01-01' AND  '2021-12-31'
 ORDER BY FirstName 

