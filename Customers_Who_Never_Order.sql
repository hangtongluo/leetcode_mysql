-- insert into customers (Id, Name)
-- VALUES (1, 'Joe'),
-- 				(2, 'Henry'),
-- 				(3, 'Sam'),
-- 				(4, 'Max');
-- 
-- 
-- insert into Orders (Id, CustomerId)
-- VALUES (1, 3),
-- 				(2, 1);
SELECT
	NAME
FROM
	customers
WHERE
	NAME NOT IN (
		SELECT
			c. NAME
		FROM
			customers c
		RIGHT JOIN orders o ON c.Id = o.CustomerId
	);


SELECT
	c.NAME, o.Id
FROM
	customers c
right JOIN orders o ON c.Id = o.CustomerId;


select c.`Name` 
	from customers c, orders o
	where c.Id != o.CustomerId;

select c.`Name` 
	from customers c, orders o
	where c.Id = o.CustomerId;

SELECT
	NAME
FROM
	customers
WHERE
	Id NOT IN (
		SELECT
			o.CustomerId
		FROM
			orders o
	);


SELECT
	c.`Name`,
	o.Id,
	o.CustomerId
FROM
	`Customers` c
LEFT JOIN `Orders` o ON (o.`CustomerId` = c.`Id`);
-- WHERE
-- 	o.`Id` IS NULL;


SELECT
	c.`Name`
FROM
	`Customers` c
LEFT JOIN `Orders` o ON (o.`CustomerId` = c.`Id`)
WHERE
	o.`Id` IS NULL;


