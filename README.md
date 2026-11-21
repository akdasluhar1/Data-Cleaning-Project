# Data-Cleaning-Project
SQL Data Cleaning Project using MySQL — identifying and handling duplicates, missing values, invalid emails, inconsistent dates, and incorrect data entries.

# SQL Data Cleaning Project

## Project Overview
This project focuses on cleaning a raw customer orders dataset using MySQL. A separate cleaned table was created to identify and handle common data-quality issues.

## Data Cleaning Tasks
- Identified and removed duplicate records.
- Detected missing and invalid email addresses and updated incorrect entries.
- Removed extra spaces from customer names and city names.
- Standardized inconsistent city names.
- Standardized different date formats using `STR_TO_DATE()`.
- Identified and handled missing order dates.
- Corrected negative order amounts using `ABS()`.
- Handled NULL values in the amount column.
- Changed the `order_date` column datatype from VARCHAR to DATE.

## Tools & SQL Concepts
- MySQL
- CREATE DATABASE and CREATE TABLE
- SELECT, UPDATE, DELETE
- GROUP BY and HAVING
- WHERE conditions and REGEXP
- STR_TO_DATE(), TRIM(), ABS()
- ALTER TABLE and MODIFY COLUMN
