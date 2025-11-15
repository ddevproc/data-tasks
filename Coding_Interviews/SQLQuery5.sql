
declare @d01 datetime2(3) = '2025-10-12 19:20:15.560'
		,@d02 datetime2(3) = '2025-10-12 19:20:15.561'
		,@d03 datetime2(3) = '2025-10-12 19:20:15.562'
		,@d04 datetime2(3) = '2025-10-12 19:20:15.563'
		,@d05 datetime2(3) = '2025-10-12 19:20:15.564'
		,@d06 datetime2(3) = '2025-10-12 19:20:15.565'
		,@d07 datetime2(3) = '2025-10-12 19:20:15.566'
		,@d08 datetime2(3) = '2025-10-12 19:20:15.567'
		,@d09 datetime2(3) = '2025-10-12 19:20:15.568'
		,@d10 datetime2(3) = '2025-10-12 23:59:59.999'

Select '@d01' as ' ', @d01 as date_datetime2, cast(@d01 as datetime) as date_datetime
UNION ALL
Select '@d02', @d02 as date_datetime2, cast(@d02 as datetime) as date_datetime
UNION ALL
Select '@d03', @d03 as date_datetime2, cast(@d03 as datetime) as date_datetime
UNION ALL
Select '@d04', @d04 as date_datetime2, cast(@d04 as datetime) as date_datetime
UNION ALL
Select '@d05', @d05 as date_datetime2, cast(@d05 as datetime) as date_datetime
UNION ALL
Select '@d06', @d06 as date_datetime2, cast(@d06 as datetime) as date_datetime
UNION ALL
Select '@d07', @d07 as date_datetime2, cast(@d07 as datetime) as date_datetime
UNION ALL
Select '@d08', @d08 as date_datetime2, cast(@d08 as datetime) as date_datetime
UNION ALL
Select '@d09', @d09 as date_datetime2, cast(@d09 as datetime) as date_datetime
UNION ALL
Select '@d10', @d10 as date_datetime2, cast(@d10 as datetime) as date_datetime