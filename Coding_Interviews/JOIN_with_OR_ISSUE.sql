--select top 1 * from [dbo].[perf_tst_lc_main] m
--select top 1 * from [dbo].[perf_tst_lc_lookup] l where lc_id_ref is not null
/*
drop table if exists search_logs
drop table if exists products
create table search_logs (id int, search_term nvarchar(100))
create table products (product_id int, product_sku nvarchar(100), product_name nvarchar(100), category nvarchar(100))
insert into products (product_id , product_sku , product_name, category)
values (1, 'pr SKU 1', 'product name 1', 'category 1')
,(2, 'pr SKU 2', 'product name 2', 'category 2')
,(3, 'pr SKU 3', 'product name 3', 'category 3')
,(4, 'pr SKU 4', 'product name 4', 'category 4')
,(5, 'pr SKU 5', 'product name 5', 'category 5')
,(6, 'pr SKU 6', 'product name 6', 'category 6')
,(7, 'pr SKU 7', 'product name 7', 'category 7')

insert into search_logs (id, search_term)
values (1, 'pr SKU 6')
,(2, 'product name 7')
,(3, 'product name 1')
,(4, 'product name 2')
,(5, 'product name 3')
,(6, 'pr SKU 4')
,(7, 'pr SKU 5')
,(8, 'pr SKU 1')
,(9, 'pr SKU 2')
,(10, 'pr SKU 3')
,(11, 'pr SKU 7')
,(12, 'product name 5')
,(13, 'product name 4')
,(14, 'product name 6')


insert into search_logs (id, search_term)
values (1, 'pr SKU 6')
,(2, 'product name 7')
,(3, 'product name 1')
,(4, 'product name 2')
,(5, 'product name 3')
,(6, 'pr SKU 4')
,(7, 'pr SKU 5')

*/

--select * from products
--select * from search_logs


--SELECT s.*, 
--p.product_id, 
--p.category 
--FROM search_logs s 
--LEFT JOIN products p 
--ON s.search_term = p.product_sku OR s.search_term = p.product_name


drop table if exists perf_tst_hc_main_or_join_issue
select m.*
,l.name as l_name
,l.amount as l_amount
into perf_tst_hc_main_or_join_issue
from [dbo].[perf_tst_hc_main] m
left join [dbo].[perf_tst_hc_lookup] l
on m.hc_id_inc = l.hc_id_inc_ref
	or m.name  = l.name
where m.hc_id_inc < 10
--create nonclustered index ix_perf_tst_hc_main_name on perf_tst_hc_main(name)
--create nonclustered index ix_perf_tst_hc_lookup_name on perf_tst_hc_lookup(name)
--create nonclustered index ix_perf_tst_hc_main_amount on perf_tst_hc_main(amount)
--create nonclustered index ix_perf_tst_hc_lookup_amount on perf_tst_hc_lookup(amount)

--update [dbo].[perf_tst_hc_main]
--set name = name + cast(hc_id_inc as nvarchar(100))

--update [dbo].perf_tst_hc_lookup
--set name = name + cast(hc_id_inc as nvarchar(100))