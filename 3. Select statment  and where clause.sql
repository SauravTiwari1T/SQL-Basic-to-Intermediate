-- The SELECT statement is used to retrieve table columns
-- The * symbol means selecting all columns, but you can specify the names of columns to select only specific ones.
-- The WHERE clause is used to apply a condition to filter the rows returned by the query. It can be used with column values, constants, or expressions, but aggregate functions are typically used with HAVING to filter based on aggregated data.
-- Basic example of where clause    
-- Example table name = employees
select * from employees
where EmployeeId = 2

-- advanced SQL queries using the WHERE clause, showcasing various types of filtering, conditions, and more complex use cases. These queries will involve subqueries, joins, aggregate functions, pattern matching, and other advanced features of SQL.\
-- 1. Using WHERE with Subquery (Filtering based on an aggregate function result)
SELECT employee_id, name, department, salary
FROM Employees
WHERE salary > (SELECT AVG(Salary) FROM Employees WHERE department = "Sales") 

-- 2 Combining Multiple Conditions with AND and OR
SELECT employee_id, name, department, salary
FROM Employees
WHERE ( department  = "Sales" AND salary  > 70000) 
         OR
      (department = 'Engineering' AND salary > 80000);

-- 3 Using WHERE with BETWEEN for Range Filtering
SELECT order_id, customer_id, order_date, total_amount
FROM Orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 4 Filtering with IN to Match Multiple Values
SELECT employee_id, name, department
FROM Employees
WHERE department IN ('Sales', 'Marketing', 'Engineering');

-- 5  Using WHERE with Pattern Matching (LIKE)
-- This query finds all employees whose name starts with "A" and ends with "e".
SELECT employee_id, name
FROM Employees
WHERE name LIKE "A%e"

-- 5 a. Using WHERE with LIKE (Pattern Matching)
--  Find all products that contain the word "wire"
--This query retrieves products that have the word "wire" anywhere in their product_name or description.
SELECT product_id, product_name, description
FROM Products
WHERE products LIKE "%wire%" OR description LIKE "%wire%"

-- Explanation:

-- %wire% means "wire" appears anywhere in the product_name or description.
-- The % wildcard before and after "wire" allows for any characters to appear before or after the word "wire".


-- 5 b. Find customers with email addresses ending in '.com'
-- This query retrieves customers whose email addresses end with ".com".
SELECT customer_id, customer_name, email
FROM Customers
WHERE email LIKE '%.com';

-- 5 c. Find all employees whose names are 5 characters long and start with 'J'
SELECT employee_id, name
FROM Employees
WHERE name LIKE 'J____';  -- 5 underscores represent exactly 5 characters

-- 5 d. Find orders where the total amount is between $500 and $1,000 and the customer's name starts with "J"
SELECT o.order_id, o.total_amount, c.customer_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.total_amount BETWEEN 500 AND 1000
  AND c.customer_name LIKE 'J%';

