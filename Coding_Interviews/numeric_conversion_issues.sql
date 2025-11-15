

select product_id, 
	avg(units) as avg_unit
from Sales
group by product_id


select product_id, 
	avg(total_units_per_order) as avg_unit
from 
(
select product_id, order_id,
	sum(units) as total_units_per_order
from Sales
group by product_id, order_id
) sales_by_order
group by product_id


select cast(x as int), x, round(x,0) from (
select cast((2+3+10+20) as decimal(10,2))/ cast(4 as decimal(10,2)) as x ) t

select (2+3+5+5+20)/5





select product_id, 
	avg(units)/count(distinct order_id) as avg_unit
from Sales
group by product_id
