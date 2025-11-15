USE AdventureWorks2022;  
GO  
SELECT BusinessEntityID, YEAR(QuotaDate) AS SalesYear, sum(SalesQuota) AS CurrentQuota,   
       LAG(sum(SalesQuota), 1,0) OVER (ORDER BY YEAR(QuotaDate)) AS PreviousQuota  
FROM Sales.SalesPersonQuotaHistory  
WHERE BusinessEntityID = 275 AND YEAR(QuotaDate) IN ('2011','2012')  
group by BusinessEntityID, YEAR(QuotaDate)




SELECT BusinessEntityID, YEAR(QuotaDate) AS SalesYear, sum(SalesQuota) AS CurrentQuota   
FROM Sales.SalesPersonQuotaHistory  
WHERE BusinessEntityID = 275 AND YEAR(QuotaDate) IN ('2011','2012')  
group by BusinessEntityID, YEAR(QuotaDate)



SELECT TerritoryName, BusinessEntityID, SalesYTD,   
       LAG (SalesYTD, 1, 0) OVER (PARTITION BY TerritoryName, BusinessEntityID ORDER BY SalesYTD DESC) AS PrevRepSales  
FROM Sales.vSalesPerson  
WHERE TerritoryName IN (N'Northwest', N'Canada')   
ORDER BY TerritoryName;



