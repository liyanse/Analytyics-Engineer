SELECT COUNT(dis_name)
FROM dis_channels;

SELECT AVG (units_sold)
FROM refinery_clients;

SELECT SUM (units_sold)
FROM refinery_clients
WHERE status_sent = 'true';

SELECT MIN (units_sold)
FROM refinery_clients;

SELECT MAX (units_sold)
FROM refinery_clients
