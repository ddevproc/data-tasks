--select id, count(id) from performance_test group by id order by id
--select b, count(b) from performance_test_2 group by b order by b



select count(*) from perf_tst_lc_main with (nolock)
select count(*) from perf_tst_hc_main with (nolock)
--alter table perf_tst_hc_lookup drop column hc_id

select count(*) from perf_tst_lc_lookup with (nolock)
select count(*) from perf_tst_hc_lookup with (nolock)


--insert into perf_tst_lc_lookup (lc_id, name, amount, lc_id_ref)
--select top 36281 hc_id_inc, name, amount, hc_id_inc_ref from perf_tst_hc_lookup




select 4000000 - 3963719
select top 1 * from perf_tst_hc_lookup with (nolock)
--delete from perf_tst_hc_lookup where hc_id_inc = 501919

select top 10 * from perf_tst_lc_main with (nolock)
select top 10 * from perf_tst_hc_main with (nolock)
--alter table perf_tst_hc_lookup drop column hc_id
select top 10 * from perf_tst_lc_lookup with (nolock)
select top 10 * from perf_tst_hc_lookup with (nolock)

--select lc_id, count(*) 
--from perf_tst_lc_lookup with (nolock) group by lc_id --having count(*)<2 order by 2 desc,1 desc 


--update l
--set l.lc_id = 15, l.lc_id_ref = 15
--from perf_tst_lc_lookup l
--inner join (
--select lc_id
--from perf_tst_lc_lookup group by lc_id having count(*)<2
--) t on l.lc_id = t.lc_id



--select top 100000 * from perf_tst_lc_lookup with (nolock)


create clustered index ix_perf_tst_lc_main_lc_id on perf_tst_lc_main(lc_id)

create clustered index ix_perf_tst_hc_main_hc_id_inc on perf_tst_hc_main(hc_id_inc)


--update t
--set t.lc_id_ref = NULL
--from perf_tst_hc_lookup t
--where lc_id_inc in ( 111, 50001, 237843, 1987234, 2113236, 3010248)


--create clustered index ix_perf_tst_lc_main_lc_id on perf_tst_lc_main (lc_id)
--create clustered index ix_perf_tst_lc_lookup_lc_id_ref on perf_tst_lc_lookup (lc_id_ref)
--create clustered index cl_perf_tst_hc_main_hc_id_inc on perf_tst_hc_main (hc_id_inc)

--create clustered index cl_perf_tst_hc_lookup_hc_id_ref on perf_tst_hc_lookup (hc_id_ref)

--create clustered index cl_perf_tst_lc_main_lc_id on perf_tst_lc_main(lc_id)

--create clustered index cl_perf_tst_lc_lookup_lc_id_ref on perf_tst_lc_lookup (lc_id_ref)




--drop index [ix_cl] on perf_tst_lc_lookup