drop table if exists dbo.SalesDemo 
CREATE TABLE dbo.SalesDemo (
    SalesDemoID    INT IDENTITY(1,1) PRIMARY KEY,
    SalesOrderID   INT NOT NULL,
    ProductID      INT NOT NULL,
    LineNumber     INT NOT NULL,
    UnitPrice      DECIMAL(18,2) NOT NULL,
    Qty            INT NOT NULL,
    CreatedAt      DATETIME2 NOT NULL DEFAULT getutcdate())


INSERT INTO dbo.SalesDemo (SalesOrderID, ProductID, LineNumber, UnitPrice, Qty)
VALUES
(1001, 200, 1, 10.00, 2),
(1001, 200, 1, 10.00, 2), -- duplicate
(1001, 200, 1, 10.00, 2), -- duplicate
(1002, 201, 1, 12.50, 1),
(1002, 201, 1, 12.50, 1); -- duplicate

select 
        ROW_NUMBER() OVER (
            PARTITION BY SalesOrderID, ProductID, LineNumber
            ORDER BY CreatedAt ASC--, SalesDemoID ASC
        ) AS rn, *
from 
dbo.SalesDemo; 

WITH cte AS (
    SELECT
        SalesDemoID,
        ROW_NUMBER() OVER (
            PARTITION BY SalesOrderID, ProductID, LineNumber
            ORDER BY CreatedAt ASC, SalesDemoID ASC
        ) AS rn
    FROM dbo.SalesDemo
)
delete sd
FROM dbo.SalesDemo sd
JOIN cte ON sd.SalesDemoID = cte.SalesDemoID
WHERE cte.rn > 1;

select 
        ROW_NUMBER() OVER (
            PARTITION BY SalesOrderID, ProductID, LineNumber
            ORDER BY CreatedAt ASC--, SalesDemoID ASC
        ) AS rn, *
from 
dbo.SalesDemo; 

/*
SELECT TOP (0) *
INTO dbo.SalesDemo_Dedup
FROM dbo.SalesDemo;
*/

 --select * from dbo.SalesDemo_Dedup

delete sd
FROM (
    SELECT
        SalesDemoID,
        ROW_NUMBER() OVER (
            PARTITION BY SalesOrderID, ProductID, LineNumber
            ORDER BY CreatedAt asc, SalesDemoID asc
        ) AS rn
    FROM dbo.SalesDemo
) sd
WHERE sd.rn > 1;