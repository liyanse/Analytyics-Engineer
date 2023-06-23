SELECT dis_name, COUNT(dis_name)
FROM dis_channels
JOIN refinery_clients
ON  dis_channels.sale_id = refinery_clients.sale_id
GROUP BY dis_name
HAVING AVG(units_sold) > 4500
ORDER BY AVG(units_sold);