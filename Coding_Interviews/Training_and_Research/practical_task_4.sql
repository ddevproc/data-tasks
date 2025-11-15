/*
??? ?????? ???????


SELECT 
COUNT(*) as C1,
COUNT(A) as CA,
COUNT(B) as CB,
SUM(A) as SA,
SUM(B) as SB 
from    [Table_1]




*/


drop table if exists #A 

select 1 as id, 1 as A, NULL as B
into #A
union all 
select 2 as id, 3 as A, NULL as B
union all 
select 3 as id, NULL as A, 4 as B


select * from #A


SELECT 
COUNT(*) as C1,
COUNT(A) as CA,
COUNT(B) as CB,
SUM(A) as SA,
SUM(B) as SB 
from   #A