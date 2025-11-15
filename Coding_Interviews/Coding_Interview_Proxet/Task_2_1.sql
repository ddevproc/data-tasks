/*
drop table user_purchases
create table user_purchases ( purchase_id int identity(1,1), user_id int, product_id int, purchase_date datetime)

insert into user_purchases (user_id, product_id, purchase_date)
select 1001, 111123, '2025-01-01'
union all 
select 1002, 121145, '2025-01-01'
union all 
select 1002, 121145, '2025-01-03'
union all 
select 1002, 121145, '2025-01-03'
union all 
select 1002, 121145, '2025-01-04'
union all 
select 1002, 121145, '2025-01-05'
union all 
select 1001, 121145, '2025-02-03'
union all 
select 1001, 121145, '2025-04-01'
union all 
select 1003, 121145, '2025-01-01'
union all 
select 1004, 121145, '2025-01-01'
union all 
select 1004, 121145, '2025-01-02'
union all 
select 1005, 121145, '2025-04-02'

*/

select * from user_purchases

;with tbl as (
select user_id
from user_purchases
group by user_id
having COUNT (product_id) > 1
),
tbl2 as (
select ROW_NUMBER() over (partition by up.user_id order by purchase_date asc) as rn, up.*
from user_purchases up
inner join tbl t on t.user_id = up.user_id
)
select * from tbl  

