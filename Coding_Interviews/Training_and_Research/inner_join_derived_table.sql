use [AdventureWorks2022]

select p.BusinessEntityID
	, p.FirstName
	, p.LastName
	, t.JobTitle
	,t.BusinessEntityType
from [Person].[Person] p
inner join (
		SELECT p2.BusinessEntityID AS PersonID, p2.FirstName, p2.LastName, e.[JobTitle], 'Employee' as BusinessEntityType
				FROM [HumanResources].[Employee] AS e
					INNER JOIN [Person].[Person] p2
					ON p2.[BusinessEntityID] = e.[BusinessEntityID]
				WHERE e.[BusinessEntityID] = p2.BusinessEntityID

)t

on p.BusinessEntityID = t.PersonID
where p.BusinessEntityID in (211, 297, 291)

