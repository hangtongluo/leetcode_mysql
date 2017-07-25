#插入数据
-- DELETE from trips where Id = 1; 
-- insert INTO trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
-- VALUES  (1, 1, 10, 1, 'completed', '2013-10-01'),
-- 				(2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
--         (3, 3, 12, 6, 'completed', '2013-10-01'),
--         (4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
--         (5, 1, 10, 1, 'completed', '2013-10-02'),
--         (6, 2, 11, 6, 'completed', '2013-10-02'),
--         (7, 3, 12, 6, 'completed', '2013-10-02'),
--         (8, 2, 12, 12, 'completed', '2013-10-03'),
--         (9, 3, 10, 12, 'completed', '2013-10-03'),
--         (10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');
-- 
-- insert into users (Users_Id, Banned, Role)
-- VALUES (1, 'No', 'client'),
-- 			 (2, 'Yes', 'client'),		
-- 			 (3, 'No', 'client'),																																																		
-- 			 (4, 'No', 'client'),																																																		
-- 			 (10, 'No', 'driver'),																																																		
-- 			 (11, 'No', 'driver'),																																																		
-- 			 (12, 'No', 'driver'),																																																		
-- 			 (13, 'No', 'driver');																																																		
-- 																																																	
-- The Trips table holds all taxi trips. Each trip has a unique Id, 
-- while Client_Id and Driver_Id are both foreign keys to the Users_Id 
-- at the Users table. Status is an ENUM type of (‘completed’, 
-- ‘cancelled_by_driver’, ‘cancelled_by_client’).
-- 

-- The Users table holds all users. Each user has an unique Users_Id, 
-- and Role is an ENUM type of (‘client’, ‘driver’, ‘partner’).

-- Write a SQL query to find the cancellation rate of requests 
-- made by unbanned clients between Oct 1, 2013 and Oct 3, 2013. 
-- For the above tables, your SQL query should return 
-- the following rows with the cancellation rate being rounded 
-- to two decimal places.
-- 

#GROUP BY 分割数据后称为多个独立的数据块，对每个数据块可以进行聚合操作
SELECT
	Request_at as DAY,
#******************************************************************************************
	round(sum(case when Status LIKE 'cancelled_%' then 1 else 0 END) / count(*), 2) as 'Cancellation Rote' 
#******************************************************************************************
FROM
	(
		SELECT
			t2.Request_at,
			t2.`Status`,
			t1.Banned,
			t1.Role
		FROM
			users t1
		LEFT JOIN trips AS t2 ON t1.Users_Id = t2.Client_Id
		AND Banned = 'No'
	) t
WHERE
	Request_at IS NOT NULL and Request_at between '2013-10-01' and '2013-10-03'
GROUP BY
  Request_at
ORDER BY
	Request_at;



SELECT Trips.Request_at Day,
       round(sum(if(status != 'completed', 1, 0)) / sum(1), 2) 'Cancellation Rate'
FROM Trips
JOIN Users
  ON Trips.Client_Id = Users.Users_Id
WHERE Users.Banned = 'No' 
  AND Trips.Request_at between '2013-10-01' AND '2013-10-03'   
GROUP BY Trips.Request_at;	



SELECT Request_at as Day,
       ROUND(COUNT(IF(Status != 'completed', TRUE, NULL)) / COUNT(*), 2) AS 'Cancellation Rate'
FROM Trips
WHERE (Request_at BETWEEN '2013-10-01' AND '2013-10-03')
      AND Client_id NOT IN (SELECT Users_Id FROM Users WHERE Banned = 'Yes')
GROUP BY Request_at;



select 
    t.Request_at as Day, 
    -- round(sum(case when t.Status like 'cancelled_%' then 1 else 0 end)/count(*),2) as 'Cancellation Rote'
    ROUND(COUNT(IF(Status != 'completed', TRUE, NULL)) / COUNT(*), 2) AS 'Cancellation Rate'
from Trips t 
    inner join Users u 
    on t.Client_Id = u.Users_Id and u.Banned='No'
    where t.Request_at between '2013-10-01' and '2013-10-03'
    group by t.Request_at;



SELECT
	Request_at as DAY,
	round(sum(if(status != 'completed', 1, 0)) / sum(1), 2) 'Cancellation Rate'
FROM
	(
		SELECT
			t2.Request_at,
			t2.Status,
			t1.Banned,
			t1.Role
		FROM
			Users t1
		LEFT JOIN Trips AS t2 ON t1.Users_Id = t2.Client_Id
		AND Banned = 'No'
	) t
WHERE
	Request_at between '2013-10-01' and '2013-10-03'
GROUP BY
  Request_at;






