-- Which awards did the movie The Lion in Winter win?
SELECT award FROM awards WHERE (film='The Lion in Winter' AND winner=1)

-- How many awards did The Grand Budapest Hotel win?
SELECT count(award) FROM awards WHERE (film='The Grand Budapest Hotel' AND winner=1);

-- How much did ‘The Grand Budapest Hotel’ cost to make?
SELECT budget FROM movies WHERE (name='The Grand Budapest Hotel');

-- How many movies has Denzel Washington starred in?
SELECT COUNT(*) FROM movies WHERE (star='Denzel Washington');

-- How much did the most expensive cost to make?
SELECT MAX(budget) FROM movies WHERE(star='Denzel Washington');

-- What was its title?
SELECT name FROM movies WHERE (star='Denzel Washington') AND budget =
(SELECT MAX(budget) FROM movies WHERE star='Denzel Washington');

-- Which movies in the movies table have won awards?
SELECT DISTINCT (movies.name)
FROM movies inner join awards
ON movies.name = awards.film
WHERE awards.winner = 1;


 -- to run: mysql> source [path-to-file]\[filename.sql]