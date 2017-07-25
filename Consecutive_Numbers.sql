-- insert into `logs` (Id, Num)
-- values (1,1),
-- 				(2,1),
-- 				(3,1),
-- 				(4,2),
-- 				(5,1),
-- 				(6,2),
-- 				(7,2);
-- 
SELECT DISTINCT
	l1.Num
FROM
	LOGS l1,
	LOGS l2,
	LOGS l3
WHERE
	l1.Id = l2.Id - 1
AND l2.Id = l3.Id - 1
AND l1.Num = l2.Num
AND l2.Num = l3.Num;


SELECT DISTINCT
	l1.Num
FROM
	LOGS l1
JOIN LOGS l2 ON l1.Id = l2.Id - 1
JOIN LOGS l3 ON l2.Id = l3.Id - 1
WHERE
	l1.Num = l2.Num
AND l2.Num = l3.Num;







