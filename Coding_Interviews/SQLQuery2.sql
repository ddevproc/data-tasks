DECLARE @d01 DATETIME2(3) = '2025-10-12 19:20:15.560'
	,@d02 DATETIME2(3) = '2025-10-12 19:20:15.561'
	,@d03 DATETIME2(3) = '2025-10-12 19:20:15.562'
	,@d04 DATETIME2(3) = '2025-10-12 19:20:15.563'
	,@d05 DATETIME2(3) = '2025-10-12 19:20:15.564'
	,@d06 DATETIME2(3) = '2025-10-12 19:20:15.565'
	,@d07 DATETIME2(3) = '2025-10-12 19:20:15.566'
	,@d08 DATETIME2(3) = '2025-10-12 19:20:15.567'
	,@d09 DATETIME2(3) = '2025-10-12 19:20:15.568'
	,@d10 DATETIME2(3) = '2025-10-12 19:20:15.569'

SELECT '@d01' AS ' ', @d01 AS date_datetime2, CAST(@d01 AS DATETIME) AS date_datetime
union
SELECT '@d02', @d02 AS date_datetime2	, CAST(@d02 AS DATETIME) AS date_datetime
union
SELECT '@d03', @d03 AS date_datetime2, CAST(@d03 AS DATETIME) AS date_datetime
union
SELECT '@d04', @d04 AS date_datetime2, CAST(@d04 AS DATETIME) AS date_datetime
union
SELECT '@d05', @d05 AS date_datetime2, CAST(@d05 AS DATETIME) AS date_datetime
union
SELECT '@d06', @d06 AS date_datetime2, CAST(@d06 AS DATETIME) AS date_datetime
union
SELECT '@d07', @d07 AS date_datetime2, CAST(@d07 AS DATETIME) AS date_datetime
union
SELECT '@d08', @d08 AS date_datetime2, CAST(@d08 AS DATETIME) AS date_datetime
union
SELECT '@d09', @d09 AS date_datetime2, CAST(@d09 AS DATETIME) AS date_datetime
union
SELECT '@d10', @d10 AS date_datetime2, CAST(@d10 AS DATETIME) AS date_datetime
