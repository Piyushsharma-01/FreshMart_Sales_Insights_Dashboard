create table sales(
order_id varchar primary key,
product_id varchar,
customer_id varchar,
order_date date,
sales_amount double precision,
discount double precision,
quantity int,
profit double precision
)

create table products (
product_id varchar primary key,
category varchar,
sub_category varchar,
product_name varchar,
price double precision
)

create table customers(
customer_id varchar primary key,
name varchar,
email varchar,
region varchar,
join_date date
)

select * from sales 

select * from products

select * from customers

SELECT TO_CHAR(order_date, 'YYYY-MM') AS Month,
SUM(sales_amount) AS Total_Sales
FROM sales
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY Month;


-- 2. Top 5 Products by Revenue
SELECT p.product_name, SUM(s.sales_amount) AS Total_Revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- 3. New vs Repeat Customers
SELECT customer_id, COUNT(order_id) AS Total_Orders
FROM sales
GROUP BY customer_id
HAVING COUNT(order_id) > 1;  -- Repeat customers


