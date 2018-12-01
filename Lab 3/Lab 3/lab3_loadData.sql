-- Name: Kaustubh Jagtap
-- ID: A0168820B

USE lab3;

-- load station
LOAD DATA LOCAL INFILE 'C:/Users/ksjag/Documents/NUS/Sem 2/BT2102/Labs/Lab 3/Lab 3/station.csv'
 	INTO TABLE station
 	FIELDS TERMINATED BY ','
 	LINES TERMINATED BY '\n'
 	IGNORE 1 LINES
 	(stationID, name, latitude, longitude, dock_count, city, @tmp_inst)
 	SET
 		installation_date = STR_TO_DATE(@tmp_inst, '%m/%d/%Y');

-- load trip
LOAD DATA LOCAL INFILE 'C:/Users/ksjag/Documents/NUS/Sem 2/BT2102/Labs/Lab 3/Lab 3/trip_processed.csv'
 	INTO TABLE trip
 	FIELDS TERMINATED BY ','
 	LINES TERMINATED BY '\n'
 	IGNORE 1 LINES
 	(tripID, duration, @tmp_start, start_station_name, start_station_id, @tmp_end, end_station_name, end_station_id, bikeID, subscription_type, zip_code)
 	SET
 		start_date = STR_TO_DATE(@tmp_start, '%m/%d/%Y %H: %i'),
 		end_date = STR_TO_DATE(@tmp_end, '%m/%d/%Y %H: %i');

-- load status
LOAD DATA LOCAL INFILE 'C:/Users/ksjag/Documents/NUS/Sem 2/BT2102/Labs/Lab 3/Lab 3/status.csv'
	INTO TABLE status
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;

-- load weather
LOAD DATA LOCAL INFILE 'C:/Users/ksjag/Documents/NUS/Sem 2/BT2102/Labs/Lab 3/Lab 3/weather_processed.csv'
	INTO TABLE weather
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(@tmp_date, max_temp, mean_temp, min_temp, max_dew_point, mean_dew_point, min_dew_point, max_humidity, mean_humidity, min_humidity, max_sea_level_pressure_inches, mean_sea_level_pressure_inches, min_sea_level_pressure_inches, max_visibility_miles, mean_visibility_miles, min_visibility_miles, max_wind_speed_mph, mean_wind_speed, max_gust_speed, precipitation_inches, cloud_cover, events, wind_dir_degrees, zip_code)
	SET
		today_date = STR_TO_DATE(@tmp_date, '%m/%d/%Y');
