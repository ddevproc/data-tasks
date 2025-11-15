select top 1 *
from [dbo].[performance_test_2]
where b is null
--order by id
--offset 2000000 row
--fetch next 1000 row only

--insert into [dbo].[performance_test_2] 
--values (67, 'Sierra Leone', 704319.00, NULL)

--insert into [dbo].[performance_test] 
--values (NULL, 'Sierra Leone', 704319.00)
--delete from [dbo].[performance_test] where id is null
--values (NULL, 'Sierra Leone', 704319.00)
--alter table [dbo].[performance_test_2]
--add b int

--update [dbo].[performance_test_2]
--set b=id-5
--where id = 52

