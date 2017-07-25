-- insert into person (Id, Email)
-- VALUES (1,'a@b.com'),
-- 				(2,'c@d.com'),
-- 				(3,'a@b.com');



SELECT
	Email
FROM
	(
		SELECT
			count(*) as num,
			Email
		FROM
			Person
		GROUP BY
			Email
		HAVING num > 1
	) t;


SELECT
	Email
FROM
	Person
GROUP BY
	Email
HAVING
	count(*) > 1;













