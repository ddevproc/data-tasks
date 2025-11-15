--select id, count(id) from performance_test group by id order by id
--select b, count(b) from performance_test_2 group by b order by b



select top 1 * from perf_tst_lc_main
select top 1 * from perf_tst_hc_main

select top 1 * from perf_tst_lc_lookup
select top 1 * from perf_tst_hc_lookup