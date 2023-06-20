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
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
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