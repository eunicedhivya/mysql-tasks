```
-- Exercise 1 — Tasks
-- -----------------------------------------------
SELECT Title FROM movies;
SELECT Director FROM movies;
SELECT Title, Directors FROM movies;
SELECT Title, Year FROM movies;
SELECT * FROM movies;
```
![Exercise 1!](imgs/1.PNG)

```
-- Exercise 2 — Tasks
-- -----------------------------------------------
-- Find the movie with a row id of 6
SELECT id, title FROM movies 
WHERE id = 6;

-- Find the movies released in the years between 2000 and 2010
SELECT title, year FROM movies
WHERE year BETWEEN 2000 AND 2010;

-- Find the movies not released in the years between 2000 and 2010
SELECT title, year FROM movies
WHERE year NOT BETWEEN 2000 AND 2010;

-- Find the first 5 Pixar movies and their release year
SELECT title, year FROM movies
WHERE year <= 2003;
```
![Exercise 2!](imgs/2.PNG)


```
-- Exercise 3 — Tasks
-- ---------------------------------------------------

-- Find all the Toy Story movies 
SELECT * FROM movies 
WHERE title LIKE "Toy Story%";

-- Find all the movies directed by John Lasseter
SELECT * FROM movies 
WHERE title LIKE "Toy Story%";

-- Find all the movies (and director) not directed by John Lasseter
SELECT title, director FROM movies 
WHERE director != "John Lasseter";

-- Find all the WALL-* movies
SELECT * FROM movies 
WHERE title LIKE "WALL%";
```
![Exercise 3!](imgs/3.PNG)

```
-- Exercise 4 — Tasks
-- List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT director FROM movies
ORDER BY director ASC;

-- List the last four Pixar movies released (ordered from most recent to least)
SELECT title, year FROM movies
ORDER BY year DESC LIMIT 4;

-- List the first five Pixar movies sorted alphabetically
SELECT title FROM movies
ORDER BY title ASC LIMIT 5;

-- List the next five Pixar movies sorted alphabetically
SELECT title FROM movies
ORDER BY title ASC LIMIT 5 OFFSET 5;
```
![Exercise 4!](imgs/4.PNG)