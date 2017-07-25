-- SELECT
-- 	Department,
-- 	`Name` as Employee,
-- 	t1.Salary 
-- FROM
-- 	(
-- 		Employee1 e1
-- 		JOIN (
-- 			SELECT
-- 				d. NAME AS Department,
-- 				max(e.Salary) AS Salary
-- 			FROM
-- 				Employee1 e
-- 			INNER JOIN Department1 d ON e.DepartmentId = d.Id
-- 			GROUP BY
-- 				Department
-- 		) t1 ON e1.Salary = t1.Salary
-- 	);
-- 



SELECT
	dep. NAME AS Department,
	emp. NAME AS Employee,
	emp.Salary
FROM
	Department1 dep,
	Employee1 emp
WHERE
	emp.DepartmentId = dep.Id
AND emp.Salary = (
	SELECT
		max(Salary)
	FROM
		Employee1 e2
	WHERE
		e2.DepartmentId = dep.Id
);


SELECT
	Department1. NAME AS Department,
	emp1. NAME AS Employee,
	emp1.Salary
FROM
	Employee1 emp1
JOIN Department1 ON emp1.DepartmentId = Department.Id
WHERE
	emp1.Salary = (
		SELECT
			Max(Salary)
		FROM
			Employee1 emp2
		WHERE
			emp2.DepartmentId = emp1.DepartmentId
	);





















