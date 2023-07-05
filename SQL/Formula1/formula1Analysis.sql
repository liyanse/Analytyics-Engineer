/*
1. How many races have been held in the Formula 1 dataset?
1102 as of 2023-05-07
*/
SELECT COUNT(raceId)
FROM dbo.races;

/*
2. What is the average number of laps per race?
*/
SELECT raceId, AVG(lap) AS avg_laps
FROM dbo.lapTimes
GROUP BY raceId;

/*
3. Which driver has won the most races?
Definetly Hamilton
*/
SELECT dbo.drivers.forename AS 'first_name',
	dbo.drivers.surname AS 'last_name',
	dbo.drivers.nationality AS 'country',
	COUNT (*) AS 'total_wins'
FROM dbo.drivers
JOIN dbo.results ON dbo.drivers.driverId = dbo.results.driverId
WHERE dbo.results.positionOrder = 1
GROUP BY dbo.drivers.forename, dbo.drivers.surname, dbo.drivers.nationality
ORDER BY total_wins DESC; 

/*
4. Which constructor has won the most races?
Ferrari
*/
SELECT *
FROM dbo.constructorStandings;

SELECT dbo.constructors.name AS 'constructor',
		dbo.constructors.nationality AS 'country',
		COUNT(*) AS 'wins'
FROM dbo.constructors
JOIN dbo.constructorStandings ON dbo.constructors.constructorId = dbo.constructorStandings.constructorId
WHERE dbo.constructorStandings.position = 1
GROUP BY dbo.constructors.name, dbo.constructors.nationality
ORDER BY wins DESC;

/*
5. How many wins does has a specific driver have per GP?
*/
SELECT dbo.drivers.forename AS 'first_name',
	dbo.drivers.surname AS 'last_name',
	dbo.drivers.code AS 'code',
	dbo.races.name,
	COUNT (*) AS 'total_wins'
FROM dbo.drivers
JOIN dbo.results ON dbo.drivers.driverId = dbo.results.driverId 
JOIN dbo.races ON dbo.races.raceId = dbo.results.raceId
WHERE dbo.results.positionOrder = 1
GROUP BY dbo.drivers.forename, dbo.drivers.surname, dbo.drivers.code, dbo.races.name
ORDER BY total_wins DESC;

/*
6. What is the average qualifying position for a specific driver?
*/
SELECT *
FROM dbo.qualifying;
/*
initially I had set the positions datatype to numerical varchar so I have to change it to a small int inorder to calculate the average
*/
ALTER TABLE dbo.qualifying
ALTER COLUMN position SMALLINT;

SELECT dbo.drivers.forename AS 'first_name',
	dbo.drivers.surname AS 'last_name',
	dbo.drivers.code AS 'code',
	AVG(dbo.qualifying.position) AS 'avg_quali_position'
FROM dbo.drivers
JOIN dbo.qualifying ON dbo.drivers.driverId = dbo.qualifying.driverId
GROUP BY dbo.drivers.forename, dbo.drivers.surname, dbo.drivers.code
ORDER BY avg_quali_position;

/*
7. What is the average qualifying position for a specific constructor? 
*/
SELECT dbo.constructors.name AS 'constructor',
	dbo.constructors.nationality AS 'country',
	dbo.constructors.constructorRef AS 'code',
	AVG(dbo.qualifying.position) AS 'avg_quali_position'
FROM dbo.constructors
JOIN dbo.qualifying ON dbo.constructors.constructorId = dbo.qualifying.constructorId
GROUP BY dbo.constructors.name, dbo.constructors.nationality, dbo.constructors.constructorRef
ORDER BY avg_quali_position;

/*
8. What is the fastest lap time recorded in the dataset?
*/
SELECT *
FROM lapTimes;

SELECT MIN(TRY_CAST(SUBSTRING(CONVERT(varchar, dbo.lapTimes.time), 1, 2) + SUBSTRING(CONVERT(varchar, dbo.lapTimes.time), 4, 4) AS DECIMAL(5,1))) AS fastest_lap_time
FROM dbo.lapTimes;


SELECT dbo.drivers.forename AS 'first_name',
	dbo.drivers.surname AS 'last_name',
	dbo.drivers.code AS 'code',
	MAX(TRY_CAST(SUBSTRING(CONVERT(varchar, dbo.lapTimes.time), 1, 2) + SUBSTRING(CONVERT(varchar, dbo.lapTimes.time), 4, 4) AS DECIMAL(5,1))) AS fastest_lap_time
FROM dbo.drivers
JOIN dbo.lapTimes ON dbo.drivers.driverId = dbo.lapTimes.driverId
WHERE dbo.lapTimes.time IS NOT NULL
GROUP BY dbo.drivers.forename, dbo.drivers.surname, dbo.drivers.code
ORDER BY fastest_lap_time;
/* I was super confused on this honestly, it's probably the way I imported the time stamp column or something but I got some super messed up results for this*/

/*
9. Which driver has the most fastest laps?
*/
SELECT *
FROM dbo.results;

SELECT COUNT(dbo.results.driverId) AS num_of_fastest_laps
FROM dbo.drivers
JOIN dbo.results ON dbo.drivers.driverId = dbo.results.driverId
WHERE dbo.results.fastestLap IS NOT NULL
GROUP BY dbo.results.driverId
ORDER BY num_of_fastest_laps DESC;
/*
10. How many pole positions has a specific driver achieved? 
*/

/*
11. How many pole positions has a specific achieved constructor?
*/

/*
12. What is the average number of pit stops per?
*/

/*
13. Which driver has the most pit stops in a single race?
*/

/*
14. Which constructor has pit most the stops in a single race?
*/

/*
15. How many championships a has specific driver won?
*/

/*
16. How many championships has a specific constructor won?
*/

/*
17. List winner of each race, with race name and date
*/
SELECT drivers.forename AS 'first_name', drivers.surname AS 'last_name',
		races.name AS 'Grand Prix', races.date AS 'race_date',
		results.positionOrder as 'P1'
FROM drivers
JOIN results ON drivers.driverId = results.driverId
JOIN races ON results.raceId  = races.raceId
WHERE results.positionOrder = 1
ORDER BY race_date DESC;



/*
18. How many different circuits are included in the dataset?
77
*/
SELECT DISTINCT(circuitId), name
FROM dbo.circuits;
/*
19. How many different countries have hosted Formula 1 races in the dataset?
*/
SELECT circuitRef, circuits.country, COUNT(*) AS 'Number of Races'
FROM circuits
INNER JOIN races ON circuits.circuitId = races.circuitId
GROUP BY circuitRef, country
ORDER BY [Number of Races] DESC;

/*
20. Some countries seem to have more than 1 circuit so let's do a circuit and country query
*/
SELECT DISTINCT(circuitRef), country,
	COUNT(raceId) OVER (PARTITION BY circuitRef) AS 'Circuit Races',
	COUNT(raceId) OVER (PARTITION BY country) AS 'Country Races'
FROM dbo.circuits
INNER JOIN dbo.races ON circuits.circuitId = races.circuitId
ORDER BY [Country Races] DESC;