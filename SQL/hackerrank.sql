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
5. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
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

/*
13. We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table.
 Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as  space-separated integers.
*/

SELECT MAX(salary*months), COUNT(*)
FROM Employee
WHERE (salary*months) = (SELECT MAX(salary*months)
                         FROM Employee);

/*
14. Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of  decimal places.
The sum of all values in LONG_W rounded to a scale of  decimal places.
Input Format

The STATION table is described as follows:
*/

SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2)
FROM STATION;

/*
15. Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . 
Round your answer to  decimal places.
*/
SELECT ROUND(LONG_W,4)
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
) 

/*
16. Consider  and  to be two points on a 2D plane.

 happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.
*/
SELECT ROUND(ABS(MIN(LAT_N)-MAX(LAT_N))+ABS(MIN(LONG_W)-MAX(LONG_W)),4)
FROM STATION;

/*
17. Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  
are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.
*/
SELECT ROUND(SQRT(POWER(MIN(LAT_N)-MAX(LAT_N),2)+POWER(MIN(LONG_W)-MAX(LONG_W),2)),4)
FROM STATION;

/*
A median is defined as a number separating the higher half of a data set from the lower half.
 Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

Input Format
*/
/*
Working Platform:- MySQL, Oracle
*/
SELECT ROUND(S.LAT_N, 4) FROM STATION S 
    WHERE 
        (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N > S.LAT_N) 
        = (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N < S.LAT_N);