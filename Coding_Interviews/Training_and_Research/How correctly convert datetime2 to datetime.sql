
declare @d2 DATETIME2(4), 
		@d2_s DATETIME2(4), 
		@d DATETIME

 set @d2 = '1753-01-01 22:59:59.9999' 
 set @d = '1753-01-01 22:59:59.997' 
 set @d2_s = '1753-01-01 22:59:59.9999' 

 select @d2 as date_time_2, @d as date_time, @d2_s


 select CAST(@d2 as datetime) as d2_4,
		CAST(@d2_s as datetime) as d2_s,
		CAST(iif(datepart(millisecond,@d2_s) > 997, 
			dateadd( mcs, -2900, @d2_s), 
			cast(@d2_s as time)) as datetime) as d2_s_f

select  cast('1753-01-01 22:59:59.9999' as datetime2(7)),
		dateadd( mcs, -2900, cast('1753-01-01 22:59:59.9999' as datetime2(7))), datepart(microsecond, cast('1753-01-01 23:59:59.9999' as datetime2(7)))


set @d = '22:59:59.997'

select @d

select  CAST(
    DATEADD(
        MILLISECOND, 
        (DATEPART(MILLISECOND, @d2) / 10) * 10,
        DATEADD(SECOND, DATEDIFF(SECOND, 0, @d2), 0)
    ) AS DATETIME
)