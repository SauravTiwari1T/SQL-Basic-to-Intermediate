-- 1. NULL:
-- Definition: NULL represents the absence of any value. It's not the same as zero, an empty string, or a missing value—it's simply unknown. 
-- In databases, NULL indicates that no data was entered, or that the value is missing or undefined.
-- Example: In a table, a column like "MiddleName" might contain NULL for a person who doesn't have a middle name.
-- How to handle NULL values:
-- You can insert NULL directly into a field: 
-- INSERT INTO table (column_name) VALUES (NULL);
-- If you need to fill NULL values, use the UPDATE statement:
-- UPDATE table SET column_name = 'Default' WHERE column_name IS NULL;

-- 2. Blank (Empty String ''):
-- Definition: A blank (or empty string) is a value that is technically something, but it has no content. It's a string with zero length, 
-- and it's different from NULL because it explicitly represents an empty value rather than an undefined one.
-- Example: A "PhoneNumber" field might have a blank value for users who haven't entered their phone number.
-- How to handle blank values:
-- You can insert a blank string directly: 
-- INSERT INTO table (column_name) VALUES ('');
-- To fill blank values, use UPDATE with a condition for the empty string: 
-- UPDATE table SET column_name = 'N/A' WHERE column_name = '';

-- 3. Zero:
-- Definition: Zero (0) is a numeric value, and it has an actual value—it's just a specific number. Zero is not the same as NULL or a blank string.
-- Example: A "Quantity" field might have a value of 0 if no items are in stock, meaning "there are no items", 
-- rather than "we don't know how many items are in stock."
-- How to handle zero values:
-- You can insert zero directly: 
-- INSERT INTO table (column_name) VALUES (0);
-- To handle zero values, you can update them using a condition: 
-- UPDATE table SET column_name = 100 WHERE column_name = 0;



CREATE TABLE test_table (
    id INT,
    name VARCHAR(50),
    age INT
);

-- NULL example
INSERT INTO test_table (id, name, age) VALUES (1, NULL, NULL);

-- Blank example
INSERT INTO test_table (id, name, age) VALUES (2, '', 25);

-- Zero example
INSERT INTO test_table (id, name, age) VALUES (3, 'John', 0);




-- Challenges of dealing with NULL values in SQL:

-- 1. NULL Comparisons:
-- NULL cannot be directly compared with other values using '=' or '!='. 
-- Instead, you must use 'IS NULL' or 'IS NOT NULL' for comparisons.
-- Example: To find rows where a column is NULL:
-- SELECT * FROM table WHERE column_name IS NULL;

-- Example: To find rows where a column is NOT NULL:
-- SELECT * FROM table WHERE column_name IS NOT NULL;

-- 2. Aggregate Functions:
-- Most aggregate functions (like SUM(), AVG()) ignore NULL values,
-- which may lead to unexpected results if you're not accounting for them.
-- Example: To calculate the sum, but treating NULL as 0, you can use COALESCE:
-- SELECT SUM(COALESCE(column_name, 0)) FROM table;

-- How to handle NULL in queries:

-- 1. Use IS NULL or IS NOT NULL for comparisons:
-- To check for NULL values:
-- SELECT * FROM table WHERE column_name IS NULL;

-- To check for non-NULL values:
-- SELECT * FROM table WHERE column_name IS NOT NULL;

-- 2. Handling NULL in aggregate functions:
-- You can use COALESCE to replace NULL values with a default value:
-- SELECT SUM(COALESCE(amount, 0)) FROM sales;
-- This treats NULL as 0 in the SUM calculation.

-- 3. Use IFNULL (or similar functions like COALESCE) to handle NULL:
-- In MySQL, you can use IFNULL to replace NULL with a default value:
-- SELECT IFNULL(column_name, 'DefaultValue') FROM table;

-- In PostgreSQL, you can use COALESCE, which works similarly to IFNULL:
-- SELECT COALESCE(column_name, 'DefaultValue') FROM table;
