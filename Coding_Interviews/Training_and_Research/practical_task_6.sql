/*
?? ????????? ????????? ??????:

SELECT  *  INTO dbo.Table2  FROM  #B  where 1=2

??? ?????? ???????

Select  *  from dbo.Table2


*/

drop table if exists dbo.Table2
drop table if exists #B
CREATE TABLE #B (id INT, NAME1 VARCHAR(100), id1 int)

INSERT INTO #B ( id, NAME1, id1 )
VALUES  ( 1, 'B1', 2 ),
	  ( 2, 'B2', 3 ),
	  ( 3, 'B3', NULL )


select * from #B

SELECT  *  INTO dbo.Table2  FROM  #B  where 1=2

select * from dbo.Table2

