-- INSERT INTO scores (Id, Score)
-- 		VALUES  (1, 3.50),
-- 						(2, 3.65),
-- 						(3, 4.00),
-- 						(4, 3.85),
-- 						(5, 4.00),
-- 						(6, 3.65);

#外查询先出现结果逐个查询，子查询用外查询的结果（位置在from前）
-- 与嵌套子查询的区别在于信息传递时双向的，而不是单向的。
SELECT
	s1.Score,
	(
		SELECT
			count(DISTINCT score)
		FROM
			scores AS s2
		WHERE
			s1.Score <= s2.score
	) AS rank   #关联子查询出现一个结果count()
FROM
	scores AS s1
ORDER BY
	s1.Score DESC;















