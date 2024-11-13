CREATE TABLE SalesTransactions (
    product_id INT PRIMARY KEY,              -- Unique identifier for each product
    sales_date DATE NOT NULL,                 -- The date the sale was made
    quantity INT NOT NULL,                    -- Quantity of the product sold
    total_amount DECIMAL(10, 2) NOT NULL,     -- Total sales amount for the product sold
    customer_id INT NOT NULL,                 -- ID of the customer making the purchase
    store_id INT NOT NULL,                    -- ID of the store where the sale occurred
    sales_person_id INT NOT NULL,             -- ID of the salesperson handling the sale
    payment_method VARCHAR(50)        -- Payment method (e.g., Cash, Credit Card)
);

INSERT INTO SalesTransactions (product_id, sales_date, quantity, total_amount, customer_id, store_id, sales_person_id, payment_method)
VALUES
(101, '2024-11-01', 2, 49.98, 501, 1001, 3001, 'Credit Card'),
(102, '2024-11-02', 1, 24.99, 502, 1002, 3002, 'Cash'),
(103, '2024-11-03', 3, 74.97, 503, 1003, 3003, 'Debit Card'),
(104, '2024-11-04', 5, 120.00, 504, 1004, 3004, 'Credit Card'),
(105, '2024-11-05', 1, 15.50, 505, 1005, 3005, 'PayPal'),
(106, '2024-11-06', 4, 99.96, 506, 1006, 3006, 'Cash'),
(107, '2024-11-07', 2, 39.98, 507, 1007, 3007, 'Credit Card'),
(108, '2024-11-08', 3, 89.97, 508, 1008, 3008, 'Debit Card'),
(109, '2024-11-09', 6, 180.00, 509, 1009, 3009, 'Credit Card'),
(110, '2024-11-10', 1, 12.99, 510, 1010, 3010, 'Cash'),
(111, '2024-11-11', 2, 59.98, 511, 1011, 3011, 'Credit Card'),
(112, '2024-11-12', 5, 145.00, 512, 1012, 3012, 'PayPal'),
(113, '2024-11-13', 1, 29.99, 513, 1013, 3013, 'Credit Card'),
(114, '2024-11-14', 3, 79.97, 514, 1014, 3014, 'Cash'),
(115, '2024-11-15', 2, 45.00, 515, 1015, 3015, 'Credit Card'),
(116, '2024-11-16', 4, 99.96, 516, 1016, 3016, 'Debit Card'),
(117, '2024-11-17', 1, 14.49, 517, 1017, 3017, null ),
(118, '2024-11-18', 6, 174.00, 518, 1018, 3018, 'Credit Card'),
(119, '2024-11-19', 3, 89.97, 519, 1019, 3019, 'Cash'),
(120, '2024-11-20', 2, 39.98, 520, 1020, 3020 , null);






-- Find total sales , Avg Sales , TotalQuantity , Avg Quantity for each distinct product  sum of sales is less then 70000
SELECT   SUM (total_amount) AS  Total_sales , AVG(total_amount) [Avg Sales] , SUM(quantity) [TotalQuantity] , AVG(quantity) [Avg Quantity]
FROM SalesTransactions
GROUP BY  product_id
HAVING SUM (total_amount)  < 70 ;
