SELECT dis_name, status_received
FROM dis_channels
UNION
SELECT refiner_name, status_sent
FROM refinery_clients

SELECT *
FROM dis_channels
UNION all
SELECT *
FROM refinery_clients
