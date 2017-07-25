-- insert into employee (Id, Name, Salary, ManagerId)
-- 	VALUES (1, 'Joe', 70000, 3),
-- 				 (2, 'Henry ', 80000, 4),
-- 				 (3, 'Sam   ', 60000, NULL),
-- 				 (4, 'Max   ', 90000, NULL);


select 
    e1.Name 
from 
    Employee e1, Employee e2
where e1.ManagerId = e2.ID;# and e1.Salary > e2.Salary;

select 
    e1.Name 
from 
    Employee e1, Employee e2
where e1.Salary > e2.Salary;

select 
    e1.Name 
from 
    Employee e1, Employee e2
where e1.ManagerId = e2.ID and e1.Salary > e2.Salary;

SELECT
	a. NAME
FROM
	Employee a
INNER JOIN Employee b ON a.ManagerId = b.Id
WHERE
	a.Salary > b.Salary;

SELECT
	NAME AS Employee
FROM
	Employee e1
WHERE
	Salary > (
		SELECT
			Salary
		FROM
			Employee e2
		WHERE
			e2.Id = e1.ManagerId
	);

SELECT employer.Name
    FROM  Employee employer 
		JOIN Employee manager ON employer.ManagerId = manager.Id
      WHERE employer.Salary > manager.Salary ;


-- Where:

select 
e1.Name
from Employee e1, Employee e2
where e1.ManagerId = e2.Id and e1.Salary > e2.Salary;

-- Join:

select s
e1.Name
from Employee e1 join Employee e2
on e1.ManagerId = e2.Id and e1.Salary>e2.Salary;






















