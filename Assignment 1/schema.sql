 -- Name: Kaustubh Jagtap
 -- ID: A0168820B

CREATE DATABASE IF NOT EXISTS assignment1;
USE assignment1;

CREATE TABLE tweetstream (tweetstreamID BIGINT, date_time DATETIME, PRIMARY KEY (tweetstreamID));

CREATE TABLE user (userID BIGINT, username VARCHAR (50), fullName VARCHAR (100), profileURL VARCHAR (100), profileDesc 
					TEXT, numFollowers INT, numFriends INT, imageURL VARCHAR (100), numTweets INT, PRIMARY KEY (userID));

CREATE TABLE tweet (tweetID BIGINT, content TEXT, creationDatetime DATETIME, creationTimezone TINYINT, postingDatetime
					DATETIME, postingTimezone TINYINT, country VARCHAR(74), longitude DECIMAL(9,6), latitude DECIMAL(9,6),
					sentiment TINYINT, tweetstreamID BIGINT, userID BIGINT, PRIMARY KEY (tweetID), FOREIGN KEY
					(tweetstreamID) REFERENCES tweetstream (tweetstreamID), FOREIGN KEY (userID) REFERENCES user (userID));

CREATE TABLE mention (userID BIGINT, tweetID BIGINT, PRIMARY KEY (userID, tweetID), FOREIGN KEY (userID) REFERENCES user 
					 (userID), FOREIGN KEY (tweetID) REFERENCES tweet (tweetID));

CREATE TABLE repost (userID BIGINT, tweetID BIGINT, retweetDatetime DATETIME, PRIMARY KEY (userID, tweetID), FOREIGN KEY 
					(userID) REFERENCES user (userID), FOREIGN KEY (tweetID) REFERENCES tweet (tweetID));

CREATE TABLE campustag (tweetID BIGINT, category CHAR(15), PRIMARY KEY (tweetID, category), FOREIGN KEY (tweetID)
				 		REFERENCES tweet (tweetID));

CREATE TABLE url (tweetID BIGINT, link VARCHAR(100), type TINYINT, PRIMARY KEY (tweetID, link), FOREIGN KEY (tweetID) 
				  REFERENCES tweet (tweetID));

CREATE TABLE hashtag (tweetID BIGINT, tag VARCHAR (50), PRIMARY KEY (tweetID, tag), FOREIGN KEY (tweetID) REFERENCES tweet 
					 (tweetID));

 -- to run: mysql> source [path-to-file]\[filename.sql]