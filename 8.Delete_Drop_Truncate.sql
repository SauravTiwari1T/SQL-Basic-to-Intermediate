-- Feature Comparison: DELETE, DROP, and TRUNCATE in SQL

-- DELETE:
-- Purpose: Remove specific rows based on a condition.
-- Affects Structure: No, only data is removed; the table structure remains.
-- Can be Rolled Back? Yes, if within a transaction (e.g., BEGIN TRANSACTION).
-- Logs Each Row Deletion? Yes, individual row deletions are logged.
-- Fires Triggers? Yes, triggers will be fired if they exist.
-- Faster for Large Tables? No, DELETE is slower for large tables due to row-by-row operation.
-- Resets Auto-Increment/Identity? No, it does not reset the auto-increment or identity value.
-- Use Case: Use DELETE when you need to remove specific rows that meet a condition.

-- DROP:
-- Purpose: Remove the entire table (data and structure).
-- Affects Structure: Yes, it removes the table structure entirely, including all data and constraints.
-- Can be Rolled Back? No, once executed, the table and its data are permanently removed.
-- Logs Each Row Deletion? No, it does not log individual rows, only the table removal.
-- Fires Triggers? No, DROP does not fire triggers.
-- Faster for Large Tables? Yes, DROP is fast because it removes the entire table structure without processing rows individually.
-- Resets Auto-Increment/Identity? N/A, since the table is removed.
-- Use Case: Use DROP when you want to completely remove a table from the database, including its structure and data.

-- TRUNCATE:
-- Purpose: Remove all rows from a table while keeping the table structure intact.
-- Affects Structure: No, the structure of the table remains; only the data is removed.
-- Can be Rolled Back? In most DBMS, No. However, in some systems like SQL Server or PostgreSQL, it can be rolled back within a transaction.
-- Logs Each Row Deletion? No, TRUNCATE does not log individual row deletions, only deallocates the pages.
-- Fires Triggers? No, TRUNCATE does not fire triggers.
-- Faster for Large Tables? Yes, TRUNCATE is faster because it involves minimal logging and does not process rows individually.
-- Resets Auto-Increment/Identity? Yes, in most RDBMS, TRUNCATE resets the auto-increment or identity value.
-- Use Case: Use TRUNCATE when you want to clear all the data from a table but keep the table structure for future use.



select * into #temp1  from [dbo].[departments]
select * from #temp1
delete #temp1
where department_name = 'Sales'

truncate table #temp1

drop table #temp1
