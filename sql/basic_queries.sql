## Basic SELECT Queries

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
       Revenue DESC
