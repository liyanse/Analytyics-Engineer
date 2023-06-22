
SELECT refiner_name, units_sold, status_sent, sale_id,
CASE
WHEN units_sold >= 9000 THEN 'Cheap'
ELSE 'Pricey'
END
FROM refinery_clients
WHERE status_sent IS NOT NULL
ORDER BY sale_id;


SELECT dis_name, status_received, location,
CASE
	WHEN status_received = 'false' THEN 'Order Incomplete'
	WHEN status_received = 'true' THEN 'Complete Order'
	ELSE 'Unknown'
END
FROM dis_channels
JOIN refinery_clients
ON dis_channels.sale_id = refinery_clients.sale_id