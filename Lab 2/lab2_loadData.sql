 -- Name: Kaustubh Jagtap
 -- ID: A0168820B

 USE lab2;

 LOAD DATA LOCAL INFILE 'C:/Users/ksjag/Documents/NUS/Sem 2/BT2102/Labs/Lab 2/movies.csv'
 	INTO TABLE movies
 	FIELDS TERMINATED BY '|'
 	LINES TERMINATED BY '\n'
 	IGNORE 1 LINES;

 LOAD DATA LOCAL INFILE 'C:/Users/ksjag/Documents/NUS/Sem 2/BT2102/Labs/Lab 2/awards.csv'
 	INTO TABLE awards
 	FIELDS TERMINATED BY '|'
 	LINES TERMINATED BY '\n'
 	IGNORE 1 LINES;



 	 -- to run: mysql> source [path-to-file]\[filename.sql]