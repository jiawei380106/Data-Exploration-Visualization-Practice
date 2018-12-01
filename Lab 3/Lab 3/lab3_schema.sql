 -- Name: Kaustubh Jagtap
 -- ID: A0168820B

CREATE DATABASE IF NOT EXISTS lab3;
USE lab3;

CREATE TABLE station(stationID INT(3), name VARCHAR(50), latitude FLOAT(10,7), longitude FLOAT(10,7), dock_count INT(4), city VARCHAR(50), installation_date DATE, PRIMARY KEY (stationID));

CREATE TABLE trip(tripID INT, duration INT(5), start_date DATETIME, start_station_name VARCHAR(100), start_station_id INT(3), end_date DATETIME, end_station_name VARCHAR(100), end_station_id INT(3), bikeID INT(6), subscription_type enum('Subscriber', 'Customer'), zip_code INT(5), PRIMARY KEY (tripID), FOREIGN KEY (start_station_id) REFERENCES station (stationID), FOREIGN KEY (end_station_id) REFERENCES station (stationID));

CREATE TABLE status(stationID INT, bikes_available INT, docks_available INT, reading_time DATETIME);

CREATE TABLE weather(ID int not null AUTO_INCREMENT, today_date DATE, max_temp FLOAT(4,1), mean_temp FLOAT(4,1), min_temp FLOAT(4,1), max_dew_point FLOAT(4,1), mean_dew_point FLOAT(4,1), min_dew_point FLOAT(4,1), max_humidity FLOAT(4,1), mean_humidity FLOAT(4,1), min_humidity FLOAT(4,1), max_sea_level_pressure_inches FLOAT(4,2), mean_sea_level_pressure_inches FLOAT(4,2), min_sea_level_pressure_inches FLOAT(4,2), max_visibility_miles FLOAT(3,1), mean_visibility_miles FLOAT(3,1), min_visibility_miles FLOAT(3,1), max_wind_speed_mph FLOAT(4,1), mean_wind_speed FLOAT(4,1), max_gust_speed FLOAT(4,1), precipitation_inches FLOAT(3,2), cloud_cover FLOAT(2,1), events CHAR(20), wind_dir_degrees FLOAT(4,1), zip_code INT(5), PRIMARY KEY (ID));