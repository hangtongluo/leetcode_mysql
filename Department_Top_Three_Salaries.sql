-- insert into employee1 (Id, Name, Salary, DepartmentId)
-- VALUES (1, 'Joe', 70000, 1),
-- 				(2, 'Henry', 80000, 2),
-- 				(3, 'Sam', 60000, 2),
-- 				(4, 'Max', 90000, 1),
-- 				(5, 'Janet', 69000, 1),
-- 				(6, 'Randy', 85000, 1);

-- insert into department1 (Id, Name)
-- VALUES (1, 'IT'),
-- 				(2, 'Sales');
-- 

SELECT
	*
FROM
	(
		SELECT
			d. NAME AS Department,
			e. NAME AS Employee,
			e.Salary AS Salary
		FROM
			Employee1 e
		LEFT JOIN Department1 d ON e.DepartmentId = d.Id -- group by Department 
		ORDER BY
			Department
	) t1;


select d.Name Department, e1.Name Employee, e1.Salary
from Employee1 e1 
INNER JOIN Department1 d
on e1.DepartmentId = d.Id
where 3 > (select count(distinct(e2.Salary)) 
                  from Employee1 e2 
                  where e2.Salary > e1.Salary 
                  and e1.DepartmentId = e2.DepartmentId
                  )
ORDER BY Department;


select D.Name as Department, E.Name as Employee, E.Salary as Salary 
  from Employee1 E, Department1 D
   where (select count(distinct(Salary)) from Employee1 
           where DepartmentId = E.DepartmentId and Salary > E.Salary) in (0, 1, 2)
         and 
           E.DepartmentId = D.Id 
         order by E.DepartmentId, E.Salary DESC;


select  
	d.`Name` Department,
	e.`Name` Employee,
	e.Salary
from 
	employee1 e LEFT JOIN department1 d
	ON e.DepartmentId = d.Id
		WHERE (
			select 
				count(DISTINCT Salary) 
			from 
				employee1 e1
			where e1.Salary > e.Salary and e1.DepartmentId = e.DepartmentId #组内比较
		) < 3
ORDER BY Department;


SELECT e.Salary, e.DepartmentId, (
      SELECT COUNT(DISTINCT(e1.Salary)) 
      FROM Employee1 e1 
      WHERE e1.Salary >= e.Salary 
      AND e.DepartmentId = e1.DepartmentId) AS "Rank"
 FROM Employee1 e;


select 
	e1.DepartmentId,
	e1.Salary,
	(select 
		count(distinct Salary) 
	from 
		employee1 e 
	where e.Salary >= e1.Salary and e.DepartmentId = e1.DepartmentId) as rank
from 
 employee1 e1;
-- where rank < 4;




SELECT
	Department,
	Name
FROM
	(
		Employee e1
		JOIN (
			SELECT
				d. NAME AS Department,
				max(e.Salary) AS Salary
			FROM
				Employee1 e
			INNER JOIN Department1 d ON e.DepartmentId = d.Id
			GROUP BY
				Department
		) t1 ON e1.Salary = t1.Salary
	);

SELECT
	d1.`Name` AS department,
	e1.`Name` AS employee,
	e1.Salary
FROM
	employee1 e1,
	department1 d1
WHERE
	e1.DepartmentId = d1.Id
AND e1.Salary = (
	SELECT
		max(Salary)
	FROM
		employee1 e2
	WHERE
		e2.DepartmentId = d1.Id
);





 







