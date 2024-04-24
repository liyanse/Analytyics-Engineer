--1. The total number of customers who made orders
SELECT COUNT(order_customer_id) AS total_orders_from_customers
FROM orders;
--2. The average order value for each customer (JOINS&GROUP BY)
SELECT order_customer_id, AVG(order_item_quantity * order_item_product_price) AS avg_customer_order_value
FROM orders
JOIN order_items ON orders.order_id = order_item_order_id
GROUP BY order_customer_id;
--3. List the customers who have placed orders in more than one month
SELECT order_customer_id
FROM ( 
	SELECT order_customer_id, COUNT(DISTINCT DATE_PART('month', order_date))AS
	months_count
	FROM orders
	GROUP BY order_customer_id
) AS subquery
WHERE months_count >1;

--List the dates in the column as months 
SELECT DISTINCT DATE_PART('month', order_date)
	AS months_count
FROM orders;
--List the dates in the column as month names
SELECT DISTINCT TO_CHAR (order_date, 'month')
	AS months_count
FROM orders;
--List the current date
SELECT CURRENT_DATE;
--List the current date in 'YYYY-MM-DD'
SELECT TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD');

--4. The total number of orders placed in each month
SELECT DISTINCT DATE_PART('month', order_date)
AS months, COUNT(*) AS total_orders
FROM orders
GROUP BY months;

--5. The average order value for orders placed on weekdays vs weekends
--6. List the products that have never been ordered
--7. Find the customers who have spent more than the average order value
--8	. The total number of customers who made orders