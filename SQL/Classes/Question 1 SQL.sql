SELECT DISTINCT order_status FROM orders
ORDER BY 1

SELECT * FROM orders 
WHERE order_status = 'COMPLETE'

SELECT * FROM orders 
WHERE order_status = 'CLOSED'

SELECT * FROM orders 
WHERE order_status = 'CLOSED' OR order_status = 'COMPLETE'