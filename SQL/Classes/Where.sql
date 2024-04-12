SELECT * FROM orders;

SELECT * FROM orders
WHERE order_status = 'COMPLETE';

SELECT * FROM orders
WHERE order_status = 'CLOSED';

SELECT * FROM orders
WHERE order_status = 'COMPLETE' OR order_status = 'CLOSED';


SELECT * FROM orders
WHERE order_status IN ('COMPLETE','CLOSED');


