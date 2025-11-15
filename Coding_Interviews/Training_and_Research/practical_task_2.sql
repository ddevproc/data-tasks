/*
????? ???????? ??????? m ? f 
*/

drop table if exists #A
CREATE TABLE #A(id int,NAME VARCHAR(100),sex char,salary money)
INSERT INTO #A  ( id, NAME, sex, salary )
SELECT 1,   'A',     'm',    2500
union
SELECT 2,   'B',     'f',    1500
union
SELECT 3,   'C',     'm',    5500
union
SELECT 4,   'D',     'f',    500


select * from #A


update a
set a.sex = case when sex = 'm' then 'f'
				 when sex = 'f' then 'm'
			end
from #A a

select * from #A