/*
1. List winner of each race, with race name and date
*/
SELECT dbo.drivers.forename AS 'first_name', dbo.drivers.surname AS 'last_name',
		dbo.races.name AS 'gp_name', dbo.races.date AS 'race_day', dbo.results.positionOrder AS 'finish'
FROM dbo. drivers
JOIN dbo.results ON dbo.drivers.driverId = dbo.results.driverId
JOIN dbo.races ON dbo.races.raceId = dbo.results.raceId
WHERE dbo.results.positionOrder = 1
ORDER BY gp_name ASC;

/*
2. List all time points leaders, with birthday and nationality
*/
SELECT dbo.drivers.forename AS 'first_name',
		dbo.drivers.surname AS 'last_name',	
	   dbo.drivers.dob AS 'birthday', 
	   dbo.drivers.nationality, 
	   SUM(dbo.results.points) AS 'points'
FROM dbo.drivers
JOIN dbo.results ON dbo.drivers.driverId = dbo.results.driverId
GROUP BY dbo.drivers.forename, dbo.drivers.surname, dbo.drivers.dob, dbo.drivers.nationality
ORDER BY points DESC;

/*
3. Drivers with the most wins
*/
SELECT dbo.drivers.forename AS 'first_name',
		dbo.drivers.surname AS 'last_name',	
	   dbo.drivers.code, 
	   COUNT(*) AS 'total_wins'
FROM dbo.drivers
JOIN dbo.results ON dbo.drivers.driverId = dbo.results.driverId
WHERE dbo.results.positionOrder  = 1
GROUP BY dbo.drivers.forename, dbo.drivers.surname, dbo.drivers.code
ORDER BY total_wins DESC;

/*
4. Countries that have had the most drivers in F1 and has the most points
*/
SELECT nationality, COUNT (*) AS 'driver_per_country'
FROM dbo.drivers
GROUP BY nationality
ORDER BY driver_per_country DESC;

SELECT dbo.drivers.nationality, 
	   SUM(dbo.results.points) AS 'total_points'
FROM dbo.drivers
JOIN dbo.results 
ON dbo.drivers.driverId = dbo.results.driverId
GROUP BY dbo.drivers.nationality
HAVING SUM(dbo.results.points) > 0
ORDER BY SUM(dbo.results.points) DESC;

select * from dbo.constructor_results;
/*
5. Which constructor has won the most races?
*/
SELECT dbo.constructors.name AS 'constructor' ,dbo.constructors.nationality 'origin', COUNT(*) AS 'constructor_wins'
FROM dbo.constructors
JOIN dbo.constructor_results
ON dbo.constructors.constructorId = dbo.constructor_results.constructorId
GROUP BY dbo.constructors.name ,dbo.constructors.nationality
HAVING SUM(dbo.constructor_results.points) > 0
ORDER BY SUM(dbo.constructor_results.points) DESC;

/*
6. Which constructor has the most pole positions?
???????
*/

