--use [AdventureWorks2022]

--select p.BusinessEntityID
--	, p.FirstName
--	, p.LastName
--	, t.JobTitle
--	,t.BusinessEntityType
--from [Person].[Person] p
--cross apply 
--(
--				SELECT p.BusinessEntityID AS PersonID, p.FirstName, p.LastName, e.[JobTitle], 'Employee' as BusinessEntityType
--				FROM [HumanResources].[Employee] AS e
--					INNER JOIN [Person].[Person] p
--					ON p.[BusinessEntityID] = e.[BusinessEntityID]
--				WHERE e.[BusinessEntityID] = p.BusinessEntityID
--)t
--where p.BusinessEntityID in (
--211, 297, 291
--)



declare @t1 table (id int, val varchar(100)) 
declare @t2 table (id int, val varchar(100)) 

insert into @t1
values (101, 'AAA 1')
,(102, 'AAA 2')
, (103, 'AAA 3')
, (104, 'AAA 4')
, (105, 'AAA 5')
, (106, 'AAA 6')
, (107, 'AAA 7')
, (108, 'AAA 8')
, (109, 'AAA 9')
, (110, 'AAA 10')

insert into @t2
values (201, 'BBB 1')
, (202, 'BBB 2')
, (203, 'BBB 3')
, (204, 'BBB 4')
, (205, 'BBB 5')

insert into @t2
values (107, 'BBB 7')
, (109, 'BBB 9')



select *--t1.id, t1.val, t2.id, t2.val 
from @t1 t1
outer apply (select tt2.id, tt2.val from @t2 tt2 where tt2.id = t1.id ) t2


select *--t1.id, t1.val, t2.id, t2.val 
from @t1 t1
cross apply (select tt2.id, tt2.val from @t2 tt2 where tt2.id = t1.id ) t2
