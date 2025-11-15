--create table Sales (order_id int, product_id char, city varchar(20), units int)
/*
insert into sales
select 100, 'A', 'London', 2
union all
select 100, 'B', 'Paris', 6
union all
select 200, 'B', 'Madrid', 3
union all
select 300, 'C', 'Athens', 14
union all
select 300, 'A', 'London', 3
union all
select 400, 'A', 'London', 5
union all
select 400, 'A', 'Madrid', 5
union all
select 400, 'D', 'Berlin', 10
union all
select 500, 'A', 'London', 20

*/

select order_id, 
	product_id, 
	city, 
	units
from Sales


