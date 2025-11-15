drop table if exists performance_test_2_tmp
SELECT *
into performance_test_2_tmp
FROM performance_test t1
WHERE NOT EXISTS (
		SELECT b
		FROM performance_test_2 t2
		WHERE t1.id = t2.b
		)

--CREATE NONCLUSTERED COLUMNSTORE INDEX csindx_id
--    ON dbo.performance_test_2(id, b);	
--drop index csindx_id_2 ON dbo.performance_test_2	
--CREATE NONCLUSTERED COLUMNSTORE INDEX csindx_id_2
--    ON dbo.performance_test_2(b);	

--CREATE CLUSTERED COLUMNSTORE INDEX csindx_id_cl ON dbo.performance_test_2;


--alter table performance_test_2
--alter column b nvarchar(1000)