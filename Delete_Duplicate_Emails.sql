-- insert into person1 (Id, Email)
-- VALUES (1,'john@example.com'),
-- 				(2,'bob@example.com'),
-- 				(3,'john@example.com');
-- 

-- SELECT
-- 	min(Id) AS Id, Email
-- FROM
-- 	Person1
-- GROUP BY
-- 	email
-- ORDER BY
--   Id;
-- 
-- DELETE
-- FROM
-- 	Person1
-- WHERE
-- 	id NOT IN (
-- 		SELECT
-- 			min(id) AS id
-- 		FROM
-- 			Person1
-- 		GROUP BY
-- 			email
-- 	);


DELETE
FROM
	Person1
WHERE
	id NOT IN (
		SELECT
			t.id
		FROM
			(
				SELECT
					min(id) AS id
				FROM
					Person1
				GROUP BY
					email
			) t
	);












