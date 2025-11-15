/*
??? ?????? ???????
SELECT * FROM #A WHERE id NOT IN (SELECT id1 FROM #B)
??? ?????? ???????
SELECT * FROM #B WHERE id1 <>3


*/

drop table if exists #A
drop table if exists #B

select  1 as id, 'A1' as NAME
INTO #A
union all select  2, 'A2'
union all select  3, 'A3'

select  1 as id, 'B1' as NAME1, 2 as id1
INTO #B
union all select  2, 'B2', 3
union all select  3, 'B3', NULL

select * from #A
select * from #B


SELECT * FROM #A WHERE id NOT IN (SELECT id1 FROM #B)
SELECT * FROM #A WHERE id IN (SELECT id1 FROM #B)

SELECT * FROM #B WHERE id1 <>3


