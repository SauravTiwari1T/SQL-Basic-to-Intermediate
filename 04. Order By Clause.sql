-- The ORDER BY clause is used to sort the result set based on one or more columns in ascending (ASC) or descending (DESC) order. You can also use aggregate functions (like AVG(), SUM(), etc.) in the ORDER BY clause to sort based on the aggregated values. While the WHERE clause filters the rows before aggregation, the HAVING clause is used to filter results after aggregation. Both WHERE and HAVING can be used in conjunction with ORDER BY
-- Example :
SELECT salesperson_id, SUM(amount) AS total_sales
FROM Sales
WHERE sale_date >= '2023-01-01'  -- Filter sales made in 2023
GROUP BY salesperson_id
HAVING SUM(amount) > 10000  -- Filter salespeople with total sales > 10,000
ORDER BY total_sales DESC;  -- Sort by total sales in descending order


-- You are given a table employees with the following columns: employee_id, department, salary, and hire_date.
--Write a query to order the employees first by department in ascending order and then by salary in descending order within each department.

SELECT employee_id , department , salary , hire_date FROM employees 
ORDER BY department ASC , salary  DESC;


-- Q. You have a table orders with the columns order_id, customer_id, and order_date.
-- You want to retrieve all orders, ordered by order_date, but you want to ensure that orders with a NULL order_date come at the end of the result set.
  SELECT * FROM orders 
ORDER BY order_date ASC NULLS LAST;


-- Q Given a table events with event_id, event_name, and event_datetime columns, you want to list events ordered by their event date and time in descending order, so the most recent events appear first.
SELECT event_id, event_name, event_datetime
FROM events
ORDER BY event_datetime DESC;

-- Q You have a table sales with sale_id, sale_date, amount, and category columns.
-- Write a query that returns the sales ordered by category in ascending order, then by amount in descending order. However, for the amount, if the sale belongs to the 'Electronics' category, the amount should be treated as ascending order instead of descending.

SELECT sale_id ,sale_date , amount ,category  FROM sales 
ORDER BY category ,
     CASE 
         WHEN category = "Electronics" THEN amount
          ELSE -amount
      END  DESC ;

-- Q You are working with a table sales_data that has region, salesperson_id, sales_amount, and sale_date columns.
-- Write a query to get the total sales per region and sort the regions by total sales in descending order, then by the number of salespersons in ascending order (using salesperson_id).
SELECT  SUM(sales_amount) AS total_sales , COUNT(DISTINCT (salesperson_id)) AS SALES_FORCE  FROM sales_data
GROUP BY region
ORDER BY total_sales DESC , SALES_FORCE ASC;

--Q Given the students table with columns student_id, name, gpa, and graduation_year, write a query to list the students ordered by a calculated 
-- expression that ranks them. The rank should be based on their GPA, but for students with the same GPA, the one with the earlier graduation year should be ranked higher.
SELECT student_id , name , gpa , graduation_year FROM students





----- 6. Scenario: Ordering by an Expression
Question:
Given the students table with columns student_id, name, gpa, and graduation_year, write a query to list the students ordered by a calculated expression that ranks them. The rank should be based on their GPA, but for students with the same GPA, the one with the earlier graduation year should be ranked higher.

Answer:

sql
Copy code
SELECT student_id, name, gpa, graduation_year,
       RANK() OVER (ORDER BY gpa DESC, graduation_year ASC) AS rank
FROM students;
Explanation:

The RANK() window function ranks the students based on their GPA in descending order (gpa DESC), and in the case of ties, by graduation_year in ascending order (graduation_year ASC).
This approach gives students with the same GPA the same rank, but it breaks ties with graduation_year.
7. Scenario: Sorting by a Computed Column
Question:
You are working with the table product_sales with product_id, units_sold, and price_per_unit.
Write a query to order the products by the total revenue (units_sold * price_per_unit) in descending order.

Answer:

sql
Copy code
SELECT product_id, units_sold, price_per_unit, 
       (units_sold * price_per_unit) AS total_revenue
FROM product_sales
ORDER BY total_revenue DESC;
Explanation:

The expression (units_sold * price_per_unit) is computed in the SELECT statement and alias as total_revenue.
The ORDER BY clause sorts by total_revenue in descending order.
8. Scenario: Sorting on Subqueries
Question:
Given a table employees with columns employee_id, salary, department_id, and hire_date, you want to list the top 5 highest-paid employees for each department.

Answer:

sql
Copy code
SELECT employee_id, salary, department_id
FROM (
    SELECT employee_id, salary, department_id,
           RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank
    FROM employees
) AS ranked_employees
WHERE rank <= 5
ORDER BY department_id, rank;
Explanation:

The subquery ranks employees within each department based on salary using RANK() with the PARTITION BY department_id.
The outer query filters for employees with rank 5 or less in each department and orders the result by department_id and rank.
9. Scenario: Sorting with Date Formatting
Question:
Given the events table with columns event_name and event_date, you want to list events ordered by the year and month of the event date in ascending order, but formatted as YYYY-MM.

Answer:

sql
Copy code
SELECT event_name, TO_CHAR(event_date, 'YYYY-MM') AS event_month
FROM events
ORDER BY TO_CHAR(event_date, 'YYYY-MM') ASC;
Explanation:

TO_CHAR(event_date, 'YYYY-MM') converts the event_date to a string formatted as YYYY-MM.
The ORDER BY clause sorts by this formatted string in ascending order.
10. Scenario: Sorting with Random Order
Question:
You have a table articles with columns article_id, title, and publish_date.
Write a query to return a random selection of 10 articles ordered randomly.

Answer:

sql
Copy code
SELECT article_id, title, publish_date
FROM articles
ORDER BY RANDOM()
LIMIT 10;
Explanation:

ORDER BY RANDOM() sorts the result set randomly.
LIMIT 10 restricts the result set to 10 rows.
