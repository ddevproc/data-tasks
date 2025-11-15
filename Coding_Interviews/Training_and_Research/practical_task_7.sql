/*
find second maximal salary

*/

drop table if exists #A

CREATE TABLE #A(id int,NAME VARCHAR(100),sex char,salary money)

INSERT INTO #A  ( id, NAME, sex, salary )
SELECT 1,   'A',     'm',    7500
union
SELECT 2,   'B',     'f',    1500
union
SELECT 3,   'C',     'm',    5500
union
SELECT 4,   'D',     'f',    6000
union
SELECT 5,   'E',     'f',    500
union
SELECT 6,   'F',     'f',    3000

select salary 
from #A
order by salary desc

-- var 1

select salary 
from #A
order by salary DESC
offset 1 row
fetch next 1 row only


-- var 2

select top 1 lead(salary) over (order by salary desc) as salary
from #A

-- var 3

;with s as (
select row_number() over (order by salary desc) as rn, salary 
from #A
)
select salary from s
where rn = 2

-- var 4
select top 1 salary 
from (
	select top 3 salary
	from #A
	order by salary desc
	) t
order by salary asc



