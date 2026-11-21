CREATE TABLE orders_raw (
    order_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100),
    order_date VARCHAR(50),
    amount DECIMAL(10,2)
);


Create table orders_cleaned as
Select * from orders_raw;


SELECT * FROM orders_raw;