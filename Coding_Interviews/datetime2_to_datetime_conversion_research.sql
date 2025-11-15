declare @d_datetime2 DATETIME2(4), 
		@d_datetime22 DATETIME2(4), 
		@d_datetime DATETIME

 set @d_datetime2 = '1753-01-01 22:59:59.9998' 
 set @d_datetime22 = '1753-01-01 22:59:59.999' 

 
 select @d_datetime2 as d_datetime2


 select CAST(iif(datepart(microsecond, @d_datetime2) > 997, 
			dateadd( mcs, -2900, @d_datetime2), 
			cast(@d_datetime2 as time)) as datetime) as d_datetime

 select CAST(dateadd( mcs, 997 - datepart(microsecond, @d_datetime2), @d_datetime2) as datetime) as d_datetime_new


 select @d_datetime22

 select dateadd( mcs, 997 - datepart(microsecond, @d_datetime22), @d_datetime22) as d_datetime22_new, CAST( dateadd( mcs, 997 - datepart(microsecond, @d_datetime22), @d_datetime22) as datetime) 

 set @d_datetime22 = '1753-01-01 23:59:59.9999' 

 select @d_datetime22

 select datepart(microsecond, @d_datetime22)
 select 997000 - datepart(microsecond, @d_datetime22)
 select dateadd( mcs, 997000 - datepart(microsecond, @d_datetime22), @d_datetime22) as d_datetime22_new, CAST( dateadd( mcs, 997000 - datepart(microsecond, @d_datetime22), @d_datetime22) as datetime) 

 select CAST(dateadd( mcs, 997000 - datepart(mcs, @d_datetime22), @d_datetime22) as datetime) as FINAL