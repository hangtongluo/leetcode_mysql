-- insert into allibaba (city, buyer_id, order_id, amt)
-- values ('a', 1, 1, 100),
-- 				('a', 1, 2, 100),
-- 				('b', 2, 3, 100),
-- 				('b', 3, 4, 20),
-- 				('c', 4, 5, 0);

select 
	al.city,
	count(DISTINCT al.buyer_id) as num,
	sum(al.amt) as amt
from 
	allibaba as al
WHERE al.amt > 0
GROUP BY al.city;









