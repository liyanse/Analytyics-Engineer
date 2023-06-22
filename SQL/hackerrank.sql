/*
1. Query the Name of any student in STUDENTS who scored higher than  Marks.
 Order your output by the last three characters of each name.
  If two or more students both have names ending in the same last three characters 
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID ASC;


/*
2. Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, 
order those particular students by their name alphabetically.
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order.
If there is more than one student with the same grade (1-7) assigned to them, 
order those particular students by their marks in ascending order.

Write a query to help Eve.
*/
SELECT 
CASE WHEN grd.grade < 8 THEN NULL 
WHEN grd.grade >= 8 THEN std.name END,
grd.grade, std.marks FROM students std, grades grd
WHERE std.marks BETWEEN grd.min_mark AND grd.max_mark
ORDER BY grd.grade DESC, std.name ASC;

/*
3.Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
Write a query to print the respective hacker_id and name of hackers who achieved full scores 
for more than one challenge. Order your output in descending order by the total number of challenges 
in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/
select h.hacker_id, h.name from Submissions as s join Hackers as h 
on s.hacker_id = h.hacker_id 
join Challenges as c on s.challenge_id = c.challenge_id
join Difficulty as d on c.Difficulty_level = d.Difficulty_level
where s.score = d.score 
group by h.hacker_id, h.name 
having count(*) > 1
order by count(*) desc, h.hacker_id;

/*
4. Given the CITY and COUNTRY tables,
 query the names of all the continents (COUNTRY.Continent) and 
 their respective average city populations (CITY.Population) 
 rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT CUN.CONTINENT, FLOOR(AVG(C.POPULATION))
FROM CITY AS C
JOIN COUNTRY AS CUN ON C.COUNTRYCODE = CUN.CODE
GROUP BY CUN.CONTINENT


/*
5. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
The STATION table is described as follows:

Station.jpg

where LAT_N is the northern latitude and LONG_W is the western longitude.

Sample Input

For example, CITY has four entries: DEF, ABC, PQRS and WXY.

Sample Output

ABC 3
PQRS 4
Explanation

When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.

Note
You can write two separate queries to get the desired output. It need not be a single query.
*/

SELECT CITY, LENGTH(CITY) AS NAME_LENGTH
FROM STATION
ORDER BY NAME_LENGTH, CITY
LIMIT 1;

SELECT CITY, LENGTH(CITY) AS NAME_LENGTH
FROM STATION
ORDER BY NAME_LENGTH DESC, CITY
LIMIT 1;

/*
6. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[AEIOU]'

select distinct city from station where left(city, 1) in ('a','e','i','u','o')

/*
7. Query the list of CITY names ending with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '[aeiou]$';

select distinct city from station where right(city, 1) in ('a','e','i','u','o')

/*
8. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) IN ('a', 'e', 'i', 'o', 'u')
  AND LOWER(SUBSTR(CITY, -1)) IN ('a', 'e', 'i', 'o', 'u');

/*
9. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');

/*
10. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY,-1)) NOT IN ('a', 'e', 'i', 'o', 'u');

/*
11. P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5): * * * * * 
* * * * 
* * * 
* * 
*
 Write an SQL query to print the pattern P(20).
*/
WITH RECURSIVE pattern_cte AS (
  SELECT 20 AS n, REPEAT('* ', 20) AS pattern
  UNION ALL
  SELECT n - 1, SUBSTRING_INDEX(pattern, ' ', n - 1)
  FROM pattern_cte
  WHERE n > 1
)
SELECT pattern
FROM pattern_cte;

/*
12. Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table,
 but did not realize her keyboard's  key was broken until after completing the calculation. 
 She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
*/
SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) 
FROM EMPLOYEES;