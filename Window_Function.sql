-- Step 1: Create the Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,      -- Unique identifier for each sale
    Salesperson VARCHAR(50),     -- Name of the salesperson
    SaleAmount DECIMAL(10, 2),   -- Amount of the sale (up to 10 digits, 2 decimal places)
    SaleDate DATE                -- Date of the sale
);

-- Step 2: Insert sample data into the Sales table
INSERT INTO Sales (SaleID, Salesperson, SaleAmount, SaleDate)
VALUES
(1, 'Anil', 100, '2024-01-01'),
(2, 'Arush', 150, '2024-01-02'),
(3, 'Priya', 120, '2024-01-03'),
(4, 'Riya', 180, '2024-01-04'),
(5, 'Anil', 130, '2024-01-05'),
(6, 'Arush', 160, '2024-01-06'),
(7, 'Riya', 200, '2024-01-07'),
(8, 'Priya', 110, '2024-01-08');


SELECT * FROM Sales

/*
SQL Queries for Window Functions:
1. ROW_NUMBER(): This assigns a unique number to each row in the result set, starting at 1. If there are ties (same values), it will still assign unique numbers to each row based on the order you specify in the ORDER BY clause.
*/
SELECT 
    SaleID,
    Salesperson,
    SaleAmount,
    ROW_NUMBER() OVER(ORDER BY SaleAmount DESC) AS RowNum
FROM Sales;


/*

*/
/*
2. RANK(): This assigns a rank to each row, with ties getting the same rank, but the next rank is skipped. If two rows tie for rank 1, the next row will be rank 3, not 2.
*/
SELECT 
    SaleID,
    Salesperson,
    SaleAmount,
    RANK() OVER(ORDER BY SaleAmount DESC) AS Rank
FROM Sales;

/*
3. DENSE_RANK(): This also assigns a rank to each row, but there are no gaps in the rank numbers. If two rows have the same value, they get the same rank, and the next rank is just the next number (no skipping).
*/
SELECT 
    SaleID,
    Salesperson,
    SaleAmount,
    DENSE_RANK() OVER(ORDER BY SaleAmount DESC) AS DenseRank
FROM Sales;

/*
Famous and Most-Asked Questions on Window Functions:
1.What is the difference between RANK() and DENSE_RANK()?
RANK() will leave gaps in the ranking when there are ties (e.g., if two rows are tied for rank 1, the next row will get rank 3).
DENSE_RANK() will give the same rank to tied rows but will not leave any gaps in the subsequent rank.
*/

/*
2.What is the difference between ROW_NUMBER() and the other ranking functions like RANK() and DENSE_RANK()?
ROW_NUMBER() will always assign a unique number to each row, even if values are the same.
RANK() and DENSE_RANK() allow ties but behave differently with regard to how ranks are assigned after the ties.
*/


/*
Comprehensive Hierarchy of SQL Clauses and Functions
WITH (Common Table Expressions - CTEs)
SELECT (Columns and Expressions)
FROM (Data Source)
JOIN (Combining Tables)
WHERE (Row Filtering)
GROUP BY (Grouping Rows for Aggregation)
HAVING (Filtering Aggregated Results)
Window Functions with OVER
ORDER BY (Sorting Results)
DISTINCT (Removing Duplicates)
LIMIT / FETCH / TOP (Limiting Rows)
UNION / INTERSECT / EXCEPT (Combining Multiple Queries)
*/

/*
3. Can you use window functions with GROUP BY?
Yes, but you must understand how the two concepts work together. While GROUP BY groups rows together into summaries, window functions can operate over groups of rows without collapsing them into a single summary row.

*/

/*
4.How do you use PARTITION BY in window functions?
PARTITION BY is used to break the result set into smaller groups (partitions). The window function will then operate within each partition independently.
For example, you can partition by Salesperson to calculate running totals or ranks for each individual salesperson.

*/

/*
Q1.You have a sales table, and you need to find out how each salesperson ranks based on the total amount of sales they’ve made. What window function would you use, and how would you write the query?
*/
SELECT 
    Salesperson,
    SUM(SaleAmount) AS TotalSales,
    RANK() OVER(PARTITION BY Salesperson ORDER BY SUM(SaleAmount) DESC) AS Rank
FROM Sales
GROUP BY Salesperson;


/*
Q2.Find the Running Total of Sales for Each Salesperson
*/
SELECT Salesperson , SaleAmount , SaleDate , SUM(SaleAmount) OVER(PARTITION BY Salesperson  ORDER BY SaleDate) AS [RUNNING]
FROM Sales

/*
Q3. Compare a Salesperson’s Performance Against Others

*/
SELECT Salesperson   , SUM(SaleAmount) , RANK() OVER (ORDER BY SUM(SaleAmount))
FROM Sales
GROUP BY Salesperson 
