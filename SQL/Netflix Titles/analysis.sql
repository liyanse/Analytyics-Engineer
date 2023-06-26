/*
Understand the table before we get started
*/
SELECT * FROM
dbo.netflix_titles;

/*
Remove duplicate values
*/
SELECT DISTINCT title
FROM dbo.netflix_titles;

/*
2. Deleting the duplicate title values
*/
DELETE FROM dbo.netflix_titles
WHERE title IN (
	SELECT title
	FROM dbo.netflix_titles
	GROUP BY title
	HAVING COUNT(*) >1
);
/*
3. How many Directors of shows are missing from the dataset
*/
SELECT show_id, title, cast
FROM dbo.netflix_titles
WHERE director IS NULL;

/*
4. Who are the most prolific producers of Netflix shows?
*/
SELECT director, COUNT(*) AS prolific_producer
FROM dbo.netflix_titles
WHERE  director IS NOT NULL
GROUP BY director
ORDER BY prolific_producer DESC;

/*
5. Unique years and dates when movies were produced
Years and dates where a lot of movies were released
*/
SELECT COUNT(DISTINCT date_added)
FROM dbo.netflix_titles;

SELECT date_added, COUNT(*) AS number_of_movies
FROM dbo.netflix_titles
WHERE date_added IS NOT NULL
GROUP BY date_added  
ORDER BY number_of_movies DESC
;

/*
What are the most popular years for Netflix show releases?
*/
SELECT release_year, COUNT(*) AS number_of_movies
FROM dbo.netflix_titles
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY number_of_movies DESC
;

/*
6. What are the most popular keywords in Netflix show descriptions?
*/
SELECT word, COUNT(*) AS occurrence
FROM (
    SELECT value AS word
    FROM dbo.netflix_titles
    CROSS APPLY STRING_SPLIT(description, ' ')
) AS subquery
GROUP BY word
ORDER BY occurrence DESC;

/*
7. Country with the most movies
*/
SELECT country, COUNT(*) AS states_per_movie
FROM dbo.netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY states_per_movie DESC;

/*
8. What is the most produced show category?
*/
SELECT listed_in, COUNT(*) AS category
FROM dbo.netflix_titles
GROUP BY listed_in
ORDER BY category DESC;

