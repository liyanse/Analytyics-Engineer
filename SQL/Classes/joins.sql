## Inner JOIn Its only going to show everything that s common or overlapping between the tables.

SELECT dis_channels.dis_name,
refinery_clients.units_sold
FROM dis_channels
INNER JOIN refinery_clients ON dis_channels.sale_id = refinery_clients.sale_id;

SELECT * FROM dis_channels
JOIN refinery_clients
ON dis_channels.sale_id = refinery_clients.sale_id



## Full Outer Join It joins everything between the to tables

SELECT * FROM dis_channels
FULL Outer Join refinery_clients
ON dis_channels.sale_id = refinery_clients.sale_id

## Left Outer Join 

SELECT * 
FROM dis_channels
Left Outer Join refinery_clients
	ON dis_channels.sale_id = refinery_clients.sale_id

## Right Outer Join 

SELECT * 
Right Outer Join refinery_clients
	ON dis_channels.sale_id = refinery_clients.sale_id


SELECT dis_channels.sale_id, dis_name, refinery_clients.units_sold
FROM dis_channels
Inner Join refinery_clients
	ON dis_channels.sale_id = refinery_clients.sale_id
WHERE dis_name <> 'Real Energy'
ORDER BY refinery_clients.units_sold DESC;