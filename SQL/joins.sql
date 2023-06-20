## Inner JOIN

SELECT dis_channels.dis_name,
refinery_clients.units_sold
FROM dis_channels
INNER JOIN refinery_clients ON dis_channels.sale_id = refinery_clients.sale_id;