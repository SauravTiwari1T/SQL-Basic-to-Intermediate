-- The ORDER BY clause is used to sort the result set based on one or more columns in ascending (ASC) or descending (DESC) order. You can also use aggregate functions (like AVG(), SUM(), etc.) in the ORDER BY clause to sort based on the aggregated values. While the WHERE clause filters the rows before aggregation, the HAVING clause is used to filter results after aggregation. Both WHERE and HAVING can be used in conjunction with ORDER BY
-- Example :
SELECT salesperson_id, SUM(amount) AS total_sales
FROM Sales
WHERE sale_date >= '2023-01-01'  -- Filter sales made in 2023
GROUP BY salesperson_id
HAVING SUM(amount) > 10000  -- Filter salespeople with total sales > 10,000
ORDER BY total_sales DESC;  -- Sort by total sales in descending order


  
