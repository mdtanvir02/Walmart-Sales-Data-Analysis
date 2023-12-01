-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;

-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

-- --------------------------------------------------------------------------------------------
-- ------------------------------ Feature Engineering -----------------------------------------

-- time_of_day --

SELECT time,
       ( CASE
           WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "morning"
           WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "afternoon"
           ELSE "evening"
         END ) AS time_of_date
FROM   sales; 

----  create new column ---
ALTER TABLE sales
  ADD COLUMN time_of_date VARCHAR(20); 

--- update Column information ---
UPDATE sales
SET    time_of_date = ( CASE
                          WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN
                          "morning"
                          WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN
                          "afternoon"
                          ELSE "evening"
                        END ); 

-- day_name --
SELECT date,
       Dayname(date)
FROM   sales;                       
  
ALTER TABLE sales
  ADD COLUMN day_name VARCHAR(20); 

UPDATE sales
SET    day_name = (Dayname(date)); 

-- month_name --
 
SELECT date,
       Monthname(date)
FROM   sales; 

ALTER TABLE sales
  ADD COLUMN month_name VARCHAR(20); 
  
UPDATE sales
SET month_name = (monthname(date));
















