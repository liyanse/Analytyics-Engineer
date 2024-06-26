SELECT refiner_name, units_sold
FROM refinery_clients
WHERE units_sold >=10000

SELECT DISTINCT dis_name FROM dis_channels;

SELECT refiner_name, units_sold
FROM refinery_clients
WHERE units_sold <=10000

#with a focus on values provided
SELECT dis_name, sale_id
FROM dis_channels
WHERE sale_id IN (1001, 1003)

#order alphabetically
SELECT refiner_name, units_sold
FROM refinery_clients
ORDER BY refiner_name ASC

#from largest to smallest
SELECT refiner_name, units_sold
FROM refinery_clients
ORDER BY units_sold DESC

#group BY
SELECT dis_name, location
FROM dis_channels
GROUP BY location, dis_name
ORDER BY location;

