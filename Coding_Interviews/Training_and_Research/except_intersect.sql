declare @t1 table (id int, val varchar(100)) 
declare @t2 table (id int, val varchar(100)) 

insert into @t1
values (101, 'AAA 1')
,(102, 'AAA 2')
, (103, 'AAA 3')
, (104, 'AAA 4')
, (105, 'AAA 5')
, (106, 'AAA 6')
, (107, 'AAA 7')
, (108, 'AAA 8')
, (109, 'AAA 9')
, (110, 'AAA 10')

insert into @t2
values (201, 'BBB 1')
, (202, 'BBB 2')
, (203, 'BBB 3')
, (204, 'BBB 4')
, (205, 'BBB 5')

insert into @t2
values (107, 'AAA 7')
, (109, 'AAA 9')



select t1.id, t1.val
from @t1 t1

select t2.id, t2.val 
from @t2 t2
select '***********************'

select t1.id, t1.val from @t1 t1
except 
select t2.id, t2.val from @t2 t2
order by 1
 

select t1.id, t1.val from @t1 t1
intersect
select t2.id, t2.val from @t2 t2
order by 1

