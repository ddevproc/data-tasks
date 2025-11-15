USE AdventureWorks2022;
GO


    SELECT PurchaseOrderID,
    EmployeeID, VendorID
    FROM Purchasing.PurchaseOrderHeader

drop table if exists #t1

SELECT EmployeeID,
   -- [250] AS Emp1,
   -- [251] AS Emp2,
   -- [256] AS Emp3,
   -- [257] AS Emp4,
   -- [260] AS Emp5
   [1692] as v1, [1696] as v2, [1508]  as v3
into #t1
FROM
(
    SELECT PurchaseOrderID,
    EmployeeID, VendorID
    FROM Purchasing.PurchaseOrderHeader
) p
PIVOT
(
    COUNT (PurchaseOrderID)
    --FOR EmployeeID IN ([250], [251], [256], [257], [260])
	for vendorid in ([1692], [1696], [1508])
) AS pvt
ORDER BY pvt.EmployeeID;

select * from #t1


SELECT EmployeeID, VendorID, Orders
FROM (
    SELECT EmployeeID, v1,v2,v3
    FROM #t1
) p
UNPIVOT
(
    Orders FOR VendorID IN (v1,v2,v3)
) AS unpvt
order by EmployeeID, vendorid
