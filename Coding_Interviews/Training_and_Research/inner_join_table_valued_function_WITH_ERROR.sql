use [AdventureWorks2022]

select p.BusinessEntityID
	, p.FirstName
	, p.LastName
	, t.JobTitle
	,t.BusinessEntityType
from [Person].[Person] p
inner join [dbo].[ufnGetContactInformation](p.BusinessEntityID) t on p.BusinessEntityID = t.PersonID
where p.BusinessEntityID in (211, 297, 291)