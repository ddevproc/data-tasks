declare @t table (id int, val char)
insert into @t
values (1, 'A')
,(2, 'B')
,(3, 'B')
,(4, NULL)

select * from @t


select * from @t where isnull(val, '') <> 'B'


