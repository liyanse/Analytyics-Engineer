![Netflix-ok](https://github.com/liyanse/Analytyics-Engineer/assets/91662935/8dc932fd-4ca2-4c5c-9712-49bc9a42d6f0)


### Netflix Movie Title Analysis with SQL
The dataset was collected from Kaggle(https://www.kaggle.com/datasets/shivamb/netflix-shows)

## About this Dataset: 

Netflix is one of the most popular media and video streaming platforms. They have over 8000 movies or tv shows available on their platform, as of mid-2021, they have over 200M Subscribers globally. This tabular dataset consists of listings of all the movies and tv shows available on Netflix, along with details such as - cast, directors, ratings, release year, duration, etc.

## SQL
For this project, I'll be working with Microsoft SQL Server because it allows me to import excel sheets into the server
I have arranged the file into questions to allow e to get a better understanding of the dataset before we start with visualization.

1. Question 1
/*
Understand the table before we get started
*/
The dataset has the folowing columns; show_id, type	title, director, cast,country,date_added,release_year,rating,duration,listed_in and	description
Initially the data has a total of 6235 rows but I removed duplicate values in the title column to remove shows that appeared twice.
