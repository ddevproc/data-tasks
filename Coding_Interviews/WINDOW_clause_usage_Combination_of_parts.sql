					
USE WideWorldImportersDW;
GO

ALTER DATABASE WideWorldImportersDW
SET COMPATIBILITY_LEVEL = 160;
GO

SELECT s.[Sale Key]
	,c.[Customer]
	,s.[Invoice Date Key]
	,s.[Total Excluding Tax]
	,ROW_NUMBER() OVER (w_order PARTITION BY s.[Customer Key] ) AS SeniorityRank

	,COUNT(*) OVER w AS [Customer Sale Count]
	,SUM(s.[Total Excluding Tax]) OVER w AS [Running Total]
	,AVG(s.[Total Excluding Tax]) OVER w_moving AS [Moving Average Centered]
FROM Fact.Sale AS s
INNER JOIN Dimension.Customer AS c 
	ON s.[Customer Key] = c.[Customer Key]
WHERE s.[Customer Key] BETWEEN 1 AND 5
	AND s.[Invoice Date Key] >= '2016-01-01'
WINDOW w AS (w_order PARTITION BY s.[Customer Key])
	,w_order AS (ORDER BY s.[Invoice Date Key], s.[Sale Key])
	,w_moving AS (w ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
ORDER BY
	s.[Customer Key]
	,s.[Invoice Date Key]
	,s.[Sale Key];






















