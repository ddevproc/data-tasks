use [AdventureWorks2022]

select top 10 p.BusinessEntityID
	, p.FirstName
	, p.LastName
	, t.JobTitle
	,t.BusinessEntityType
from [Person].[Person] p
cross apply [dbo].[ufnGetContactInformation](p.BusinessEntityID) t
--where p.BusinessEntityID in (211, 297, 291)
order by 1 desc


select top 10 p.BusinessEntityID
	, p.FirstName
	, p.LastName
	, t.JobTitle
	,t.BusinessEntityType
from [Person].[Person] p
outer apply [dbo].[ufnGetContactInformation](p.BusinessEntityID) t
--where p.BusinessEntityID in (211, 297, 291)
order by 1 desc