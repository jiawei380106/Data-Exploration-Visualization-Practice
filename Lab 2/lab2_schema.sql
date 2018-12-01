 -- Name: Kaustubh Jagtap
 -- ID: A0168820B

CREATE DATABASE IF NOT EXISTS lab2;
USE lab2;

CREATE TABLE movies(serial INT, budget BIGINT, company VARCHAR(100), country VARCHAR(50), director VARCHAR(100), genre VARCHAR(50), gross BIGINT, name VARCHAR(100), rating VARCHAR(15), runtime SMALLINT, score DECIMAL(4,2), star VARCHAR (50), votes MEDIUMINT, writer VARCHAR(50), year SMALLINT, PRIMARY KEY (serial));

CREATE TABLE awards(serial INT, year SMALLINT, award VARCHAR(200), winner TINYINT, film VARCHAR(100), names VARCHAR(250), PRIMARY KEY (serial));


 -- to run: mysql> source [path-to-file]\[filename.sql]