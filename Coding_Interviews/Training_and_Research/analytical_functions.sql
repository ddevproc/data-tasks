DECLARE @StartDate DATE = '2000-01-01';
DECLARE @EndDate   DATE = CAST(GETDATE() AS DATE);
DECLARE @WindowDays INT = 7;

WITH DailySales AS (
  SELECT
    COALESCE(so.SalesPersonID, 0) AS SalesPersonID,
    CAST(so.OrderDate AS DATE) AS SalesDate,
    SUM(sod.UnitPrice * sod.OrderQty * (1 - sod.UnitPriceDiscount)) AS SalesAmount
  FROM Sales.SalesOrderHeader so
  JOIN Sales.SalesOrderDetail sod ON sod.SalesOrderID = so.SalesOrderID
  WHERE so.OrderDate BETWEEN @StartDate AND @EndDate
  GROUP BY COALESCE(so.SalesPersonID,0), CAST(so.OrderDate AS DATE)
),
Rolling AS (
  SELECT
    SalesPersonID, SalesDate, SalesAmount,
    AVG(SalesAmount) OVER (PARTITION BY SalesPersonID ORDER BY SalesDate
                          ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS TrailingAvg,
    STDEV(SalesAmount) OVER (PARTITION BY SalesPersonID ORDER BY SalesDate
                             ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS TrailingStd
  FROM DailySales
)
SELECT p.FirstName, p.LastName,
  r.SalesPersonID, r.SalesDate, r.SalesAmount, r.TrailingAvg,
  r.TrailingAvg AS ForecastTrailing7,
  (r.SalesAmount - r.TrailingAvg) / NULLIF(r.TrailingStd, 0) AS ZScore,
  CASE WHEN ABS((r.SalesAmount - r.TrailingAvg) / NULLIF(r.TrailingStd, 0)) > 3 THEN 1 ELSE 0 END AS IsAnomaly
FROM Rolling r
join [Person].Person p on r.SalesPersonID = p.BusinessEntityID
ORDER BY r.SalesPersonID, r.SalesDate;
