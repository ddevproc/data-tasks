--select top 10 * from [dbo].[perf_tst_hc_main] m
--select top 10 * from [dbo].[perf_tst_hc_lookup] l

drop table if exists perf_tst_hc_main_or_join_issue
select m.*
--into perf_tst_hc_main_or_join_issue
from [dbo].[perf_tst_hc_main] m
where m.amount = 
		(
		select min(l.amount )
		from [dbo].[perf_tst_hc_lookup] l
		where l.hc_id_inc = m.hc_id_inc)
--option(
--querytraceon 3604 --вывод на консоль
--,querytraceon 8606 --дерево логических операторов
--,querytraceon 8608 --начальное мемо
--,querytraceon 8615 --конечное мемо
--,querytraceon 8607 --дерево физических операторов
--)
--and m.hc_id_inc < 10

drop table if exists perf_tst_hc_main_or_join_issue_4
select m.*
into perf_tst_hc_main_or_join_issue_4
from [dbo].[perf_tst_hc_main] m
outer apply  (
		select l.hc_id_inc, min(l.amount ) as l_amount
		from [dbo].[perf_tst_hc_lookup] l
		where l.hc_id_inc  = m.hc_id_inc
		group by l.hc_id_inc
		) t
where m.amount = t.l_amount
		
