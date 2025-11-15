use training


SELECT lc_id, lc_id_ref
FROM perf_tst_lc_lookup
WHERE lc_id_ref is null

SELECT *
FROM perf_tst_hc_lookup
WHERE hc_id_inc_ref is null
--update t
--set lc_id_ref = NULL
--FROM perf_tst_lc_lookup t
--WHERE lc_id = 67 and name = 'Bolivia'

--update perf_tst_lc_lookup
--set lc_id_ref = lc_id
--where lc_id_ref IS NULL

--update perf_tst_lc_lookup
--set lc_id_ref = case when lc_id = 50001 then 111
--when lc_id = 237843 then 111
--when lc_id = 111 then 111
--when lc_id = 1 then 111
--when lc_id = 2113236 then 111
--when lc_id = 1987234 then 111
--when lc_id = 3010248 then 111
--end









SELECT hc_id_inc, hc_id_inc_ref
FROM perf_tst_hc_lookup
WHERE hc_id_inc_ref IS NULL

--insert into perf_tst_lc_lookup values (67, 'AAABBBBCCCC', 9484895.00, NULL)
--set identity_insert perf_tst_hc_lookup Off

--insert into perf_tst_hc_lookup (hc_id_inc, name, amount, hc_id_inc_ref)
--values (67, 'JJJJABBBBCCCC', 94868562.00, NULL)


--insert into perf_tst_hc_lookup (hc_id_inc, name, amount, hc_id_inc_ref)
--values (50001, 'XXXAABBBBCCCC', 9181895.00, NULL)
--,(237843, 'YYYBBBCCCC', 9384895.00, NULL)
--,(111, 'ZZZZBBBBCCCC', 9684895.00, NULL)
--,(1, 'RRRRRBBBBCCCC', 948689.00, NULL)
--,(2113236, 'EEEEEAAABBBBCCCC', 9282895.00, NULL)
--,(1987234, 'FFFFFAAABBBBCCCC', 9384455.00, NULL)
--,(3010248, 'HHHHHABBBBCCCC', 7484895.00, NULL)



select top 10 * from perf_tst_hc_lookup where hc_id_inc_ref is not null
order by 3 desc

--delete from perf_tst_hc_lookup where hc_id_inc =  4000001

delete from perf_tst_lc_lookup
where lc_id in (67)

delete from perf_tst_hc_lookup
where hc_id_inc in (50001, 237843, 111, 1, 2113236, 1987234, 3010248)




--UPDATE STATISTICS performance_test
--UPDATE STATISTICS performance_test_2
--select * from performance_test_tmp
CHECKPOINT; 
DBCC DROPCLEANBUFFERS;
SET STATISTICS TIME ON; 
SET STATISTICS IO ON;


UPDATE STATISTICS perf_tst_lc_main
UPDATE STATISTICS perf_tst_hc_main
UPDATE STATISTICS perf_tst_lc_lookup
UPDATE STATISTICS perf_tst_hc_lookup


SET SHOWPLAN_TEXT ON

drop table if exists perf_tst_lc_main_notin


						SELECT *
						INTO perf_tst_lc_main_notin
						FROM perf_tst_lc_main
						WHERE lc_id NOT IN (
								SELECT lc_id_ref
								FROM perf_tst_lc_lookup
								--WHERE lc_id_ref IS NOT NULL
								)
					

						
						
						
						
						
						
						
						--WHERE lc_id_ref IS NOT NULL
CHECKPOINT; 
DBCC DROPCLEANBUFFERS;
SET STATISTICS TIME ON; 
SET STATISTICS IO ON;



								
drop table if exists perf_tst_hc_main_notin




									SELECT *
									INTO perf_tst_hc_main_notin
									FROM perf_tst_hc_main
									WHERE hc_id_inc NOT IN (
											SELECT hc_id_inc_ref
											FROM perf_tst_hc_lookup
											--WHERE hc_id_inc_ref IS NOT NULL
											)
									



									
									
									
									
									--WHERE hc_id_inc_ref IS NOT NULL










		--and id is not null
		--option(MAXDOP 1)
--create nonclustered index ix on performance_test_2 (b)
--CREATE NONCLUSTERED COLUMNSTORE INDEX csindx_id
--    ON dbo.performance_test(id);	
--create clustered index ix_cl on performance_test_2 (b)
--drop index ix ON dbo.performance_test_2	
--drop index csindx_id ON dbo.performance_test	
--CREATE CLUSTERED COLUMNSTORE INDEX csindx_id_cl ON dbo.performance_test;

--drop index csindx_id_cl ON dbo.performance_test_2