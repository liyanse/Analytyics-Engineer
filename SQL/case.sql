
SELECT refiner_name, units_sold, status_sent, sale_id,
CASE
WHEN units_sold >= 9000 THEN 'Cheap'
ELSE 'Pricey'
END
FROM refinery_clients
WHERE status_sent IS NOT NULL
ORDER BY sale_id;