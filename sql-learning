##Step 1: Basics SELECT Queries 
```sql
SELECT
      *
FROM
    calm-segment-475021-s1.movie_data.movie
LIMIT 100;


### Selecting Specific Columns
```sql
SELECT
    `Release Date` AS Release_Date,
     `Movie Title` AS Movie_Title,
      Genre,
      Revenue
FROM 
    `calm-segment-475021-s1.movie_data.movie`


### Filtering Data
```sql
SELECT 
     *
FROM
    `calm-segment-475021-s1.movie_data.movie`
WHERE
    Revenue < 10000000;


### Sorting Result
```sql
SELECT
      *
FROM
    `calm-segment-475021-s1.movie_data.movie`
ORDER BY
       Revenue DESC;


## Step 2: Aggregation & Grouping Queries
     
     ### Counting Total Movies
```sql
SELECT
     COUNT(*) AS total_movies
FROM
    `calm-segment-475021-s1.movie_data.movie`;


### Total Revenue Per Genre
```sql
SELECT
    Genre,
    SUM(Revenue) AS total_revenue
FROM
    `calm-segment-475021-s1.movie_data.movie`
GROUP BY
    Genre
ORDER BY
    total_revenue DESC;


### Average Revenue by Genre
```sql
SELECT
    Genre,
    AVG(Revenue) AS avg_revenue
FROM
    `calm-segment-475021-s1.movie_data.movie`
GROUP BY
    Genre
ORDER BY
    avg_revenue DESC;


### Movies Count per Genre
```sql
SELECT
    Genre,
    COUNT(*) AS movie_count
FROM
    `calm-segment-475021-s1.movie_data.movie`
GROUP BY
    Genre
ORDER BY
    movie_count DESC;
