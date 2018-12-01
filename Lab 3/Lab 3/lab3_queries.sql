-- qtn A

select subscription_type AS subs, count(*) 
from trip where duration <= 86400 group by subs;

-- qtn B

select min(duration) AS min, max(duration) AS max, avg(duration) AS average from trip
WHERE duration <= 86400;

-- qtn C

SELECT AVG(dock_count) as avg from station;


-- qtn D

select subq1.d, count(subq1.d) AS total from
(select cast(start_date as date) as d from trip WHERE duration<=86400) AS subq1
GROUP BY subq1.d
ORDER BY total DESC
LIMIT 1;


-- qtn E

select subq1.days, count(subq1.days) as total from
(select DAYNAME(cast(start_date as date)) as days from trip where duration<86400) as subq1
GROUP BY days
ORDER BY total DESC
LIMIT 1;


-- qtn F
select subq1.hour, count(subq1.hour) as total, TRUNCATE(count(subq1.hour)/(select count(*) from trip) * 100, 2) as percentage from
(select HOUR(start_date) as hour from trip) AS subq1
GROUP BY subq1.hour
ORDER BY subq1.hour < 6, subq1.hour;