SELECT COUNT(*) FROM orders;

SELECT MAX(order_item_subtotal)
FROM order_items;

SELECT MIN(order_item_subtotal)
FROM order_items;

SELECT SUM(order_item_subtotal) AS total_orders_cost
FROM order_items;
