-- The SELECT statement is used to retrieve table columns
-- The * symbol means selecting all columns, but you can specify the names of columns to select only specific ones.
-- The WHERE clause is used to apply a condition to filter the rows returned by the query. It can be used with column values, constants, or expressions, but aggregate functions are typically used with HAVING to filter based on aggregated data.
   select * from employees
where EmployeeId = 2
