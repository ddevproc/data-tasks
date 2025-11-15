use training


--select *
--into performance_test_2_hc
--from performance_test_2

--alter table performance_test_2_hc add inc_id int identity(1,1)
--alter table performance_test_hc add inc_id int identity(1,1)

--EXEC sp_rename 'performance_test', 'perf_tst_lc_main';
--EXEC sp_rename 'performance_test_2', 'perf_tst_lc_lookup';
--EXEC sp_rename 'performance_test_hc', 'perf_tst_hc_main';
--EXEC sp_rename 'performance_test_2_hc', 'perf_tst_hc_lookup';


--EXEC sp_rename 'perf_tst_lc_main.id', 'lc_id', 'COLUMN';
--EXEC sp_rename 'perf_tst_lc_main.val', 'name', 'COLUMN';
--EXEC sp_rename 'perf_tst_lc_main.num', 'amount', 'COLUMN';

--EXEC sp_rename 'perf_tst_hc_main.id', 'hc_id', 'COLUMN';
--EXEC sp_rename 'perf_tst_hc_main.val', 'name', 'COLUMN';
--EXEC sp_rename 'perf_tst_hc_main.num', 'amount', 'COLUMN';


--EXEC sp_rename 'perf_tst_lc_lookup.id', 'lc_id', 'COLUMN';
--EXEC sp_rename 'perf_tst_lc_lookup.val', 'name', 'COLUMN';
--EXEC sp_rename 'perf_tst_lc_lookup.num', 'amount', 'COLUMN';
--EXEC sp_rename 'perf_tst_lc_lookup.id_ref', 'lc_id_ref', 'COLUMN';

--EXEC sp_rename 'perf_tst_hc_lookup.id', 'lc_id', 'COLUMN';
--EXEC sp_rename 'perf_tst_hc_lookup.val', 'name', 'COLUMN';
--EXEC sp_rename 'perf_tst_hc_lookup.num', 'amount', 'COLUMN';
--EXEC sp_rename 'perf_tst_hc_lookup.hc_id_ref', 'hc_id_inc_ref', 'COLUMN';


--EXEC sp_rename 'perf_tst_hc_main.inc_id', 'hc_id_inc', 'COLUMN';
--EXEC sp_rename 'perf_tst_hc_lookup.hc_id_inc', 'lc_id_inc', 'COLUMN';



CHECKPOINT; 
DBCC DROPCLEANBUFFERS;
SET STATISTICS TIME ON; 
SET STATISTICS IO ON;
SET SHOWPLAN_TEXT ON
drop table if exists perf_tst_lc_tmp_notexists

--aaa
					SELECT m.*
					INTO perf_tst_lc_tmp_notexists
					FROM perf_tst_lc_main m
					WHERE NOT EXISTS (
							SELECT lc_id_ref
							FROM perf_tst_lc_lookup l
							WHERE m.lc_id = l.lc_id_ref
							)

				
		
		select top 10 * from sys.databases d
		where d.name = 'Training'
		
		
		
		
		--option(MAXDOP 1)



		
CHECKPOINT; 
DBCC DROPCLEANBUFFERS;
SET STATISTICS TIME ON; 
SET STATISTICS IO ON;

drop table if exists perf_tst_hc_tmp_notexists


						SELECT m.*
						INTO perf_tst_hc_tmp_notexists
						FROM perf_tst_hc_main m
						WHERE NOT EXISTS (
								SELECT hc_id_inc_ref
								FROM perf_tst_hc_lookup l
								WHERE m.hc_id_inc = l.hc_id_inc_ref
								)
						
					






--create clustered index cl_ix on performance_test (id)
--CREATE NONCLUSTERED COLUMNSTORE INDEX csindx_id
--    ON dbo.performance_test_2(id, b);	
--drop index csindx_id_2 ON dbo.performance_test_2	
--CREATE NONCLUSTERED COLUMNSTORE INDEX csindx_id_2
--    ON dbo.performance_test_2(b);	

--CREATE CLUSTERED COLUMNSTORE INDEX csindx_id_cl ON dbo.performance_test_2;


--alter table performance_test_2
--alter column b nvarchar(1000)
alter table [dbo].[perf_tst_lc_main]
alter column lc_id int

alter table [dbo].[perf_tst_lc_main]
alter column name nvarchar(100)

alter table [dbo].[perf_tst_lc_main]
alter column amount decimal(12,2)


--create clustered index [cl_perf_tst_lc_lookup_lc_id_ref]ON dbo.[perf_tst_lc_lookup] (lc_id_ref)
--cl_perf_tst_hc_lookup_hc_id_ref ON dbo.[perf_tst_hc_lookup] (hc_id_ref)


--drop index cl_perf_tst_lc_main_lc_id on dbo.perf_tst_lc_main

--create clustered index cl_perf_tst_lc_main_lc_id on dbo.perf_tst_lc_main(lc_id)