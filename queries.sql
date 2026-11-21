USE cleaning_project1;

-- Query 1 - Detect Duplicate Records in a Table

SELECT customer_name, email, city, order_date, amount
FROM orders_cleaned
GROUP BY customer_name, email, city, order_date, amount
HAVING COUNT(*) > 1; 

-- Query 2:Deleting duplicate record

DELETE FROM orders_cleaned WHERE order_id NOT IN(
SELECT order_id FROM (
SELECT MIN(order_id) as order_id
FROM orders_cleaned
GROUP BY customer_name, email, city, order_date, amount
) as temp);

-- Query 3: Find NULL emails

SELECT * FROM orders_cleaned where email IS NULL;

-- Query 4: Replace missing emails
UPDATE orders_cleaned
SET email = "uknown@gmail.com"
WHERE email IS NULL;

SELECT * FROM orders_cleaned;


-- Query 5: Detect Inavalid Emails
SELECT * FROM orders_cleaned
WHERE email NOT LIKE '%@%.%';

-- Query 6 Fix Invalid Emails
UPDATE orders_cleaned
SET email = "rohit@gmail.com"
WHERE order_id = 10;

SELECT * FROM orders_cleaned
WHERE order_id = 10;

-- Query 7 Fix Extra Spaces in customer name
UPDATE orders_cleaned
SET customer_name = TRIM(customer_name);

-- Query 8: Fixing spelling mistakes in the city

UPDATE orders_cleaned
SET city = 'Mumbai'
WHERE city = 'Mumbai ';

-- Query 9: Removing extra spaces in the city

UPDATE orders_cleaned
SET city = TRIM(city);

-- Query 10: Standardizing YYYY-DD-MM date format
UPDATE orders_cleaned
SET order_date = STR_TO_DATE(order_date, '%Y-%m-%d') 
WHERE order_date REGEXP '^[0-9]{4}-';

-- Query 11: Standardizing MM-DD-YYYY date format
UPDATE orders_cleaned
SET order_date = STR_TO_DATE(order_date, '%c/%e/%Y')
WHERE order_date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$';

-- Query 12: Standardizing DD-MM-YYYY date format
UPDATE orders_cleaned
SET order_date = STR_TO_DATE(order_date, '%e/%c/%Y')
WHERE order_date REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$';

-- Query 13: Find missing values
SELECT * from orders_cleaned
WHERE order_date IS NULL;

-- Query 14: Filling missing order dates

UPDATE orders_cleaned
SET order_date = '2024-01-01'
WHERE order_date IS NULL;

-- Query 15: Cleaning negative amounts
UPDATE orders_cleaned
SET amount = ABS(amount)
WHERE amount < 0;

-- Query 16: Handling NULL amounts
UPDATE orders_cleaned
SET amount = 0
WHERE amount IS NULL;

SELECT * FROM orders_cleaned;

SELECT * FROM orders_raw;

ALTER TABLE orders_cleaned
MODIFY COLUMN order_date DATE;

DESCRIBE orders_cleaned;

SELECT DISTINCT(order_date) FROM orders_cleaned;