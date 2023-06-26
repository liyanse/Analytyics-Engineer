SELECT * FROM
dbo.netflix_titles;

/*
1. Checking for repetitive title names
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
3. How many Directors of showsare missing from the dataset
*/
SELECT show_id, title, cast
FROM dbo.netflix_titles
WHERE director IS NULL;

/*
4. How many Unique categories of movies are there
*/
SELECT DISTINCT listed_in
FROM dbo.netflix_titles;

/*
5. How many Unique directors of movies are there
*/
SELECT DISTINCT director
FROM dbo.netflix_titles;

/*
Unique years and dates when movies were produced
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

SELECT release_year, COUNT(*) AS number_of_movies
FROM dbo.netflix_titles
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY number_of_movies DESC
;

/*
Country with the most movies
*/
SELECT country, COUNT(*) AS states_per_movie
FROM dbo.netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY states_per_movie DESC;


/*
Find my favorite shows
*/
SELECT title, duration, rating, director
FROM dbo.netflix_titles
WHERE title = 'F.R.I.E.N.D.S';

SELECT title, duration, rating, director
FROM dbo.netflix_titles
WHERE title = 'The King Eternal Monarch';

SELECT title, duration, rating, director
FROM dbo.netflix_titles
WHERE title = 'Stranger Things';