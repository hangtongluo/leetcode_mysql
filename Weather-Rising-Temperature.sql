#插入数据
-- INSERT into weather VALUES(10, '2015-01-01', 1);
-- INSERT into weather VALUES(25, '2015-01-02', 2);
-- INSERT into weather VALUES(20, '2015-01-03', 3);
-- INSERT into weather VALUES(30, '2015-01-04', 4);


#应用双表查询
-- 
-- TO_DAYS(date)
-- 给定一个日期date，返回一个天数（自0年的天数）。
SELECT wt1.Id 
from weather as wt1, weather as wt2
where wt1.Temperature > wt2.Temperature AND
			TO_DAYS(wt1.Date) - TO_DAYS(wt2.Date) = 1;


-- SUBDATE() 日期減法
-- SUBDATE(date,INTERVAL expr unit)
-- SUBDATE(expr,days)
-- date 傳入的日期
-- expr 傳入的時間
-- unit 傳入的單位
-- days 傳入的日數
select w1.Id from weather w1, weather w2
where SUBDATE(w1.Date,1) = w2.Date;

select w1.Id from weather w1, weather w2
where SUBDATE(w1.Date,1) = w2.Date and 
		w1.Temperature > w2.Temperature;

select w2.Id from weather w1, weather w2
where ADDDATE(w1.Date,1) = w2.Date and
		w1.Temperature < w2.Temperature;

select TO_DAYS("2017-3-15") as num_data;


-- 定义和用法
-- DATEDIFF() 函数返回两个日期之间的时间。
-- 语法
-- DATEDIFF(datepart,startdate,enddate)
-- startdate 和 enddate 参数是合法的日期表达式。
SELECT a.Id FROM Weather AS a, Weather AS b
WHERE DATEDIFF(a.Date, b.Date)=1 AND 
		a.Temperature > b.Temperature;















