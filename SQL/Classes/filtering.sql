SELECT * FROM orders
WHERE order_status IN ('COMPLETE', 'CLOSED')
ORDER BY order_date;

SELECT order_date,
COUNT(*) AS order_count
FROM orders
WHERE order_status IN ('COMPLETE', 'CLOSED')
GROUP BY 1
ORDER BY 2 DESC;