
--UPDATE STATISTICS performance_test
--UPDATE STATISTICS performance_test_2
--select * from performance_test_tmp
drop table if exists performance_test_tmp
SELECT *
into performance_test_tmp
FROM performance_test 
WHERE id NOT IN (
		SELECT b
		FROM performance_test_2
		WHERE b IS NOT NULL
		)
		--and id is not null


--CREATE NONCLUSTERED COLUMNSTORE INDEX csindx_id
--    ON dbo.performance_test(id);	
--drop index csindx_id ON dbo.performance_test	
--CREATE CLUSTERED COLUMNSTORE INDEX csindx_id_cl ON dbo.performance_test;

