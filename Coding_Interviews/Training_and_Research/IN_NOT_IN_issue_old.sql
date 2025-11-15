Select 1
where 1 not in (3, 2, NULL);

Select 1
where 1 not in (3, 2, 4);


Select 1
where 1 in (3, 1, NULL);

Select 1
where 1 in (3, 1, 4);


Select 1
where 1 not in (Select 3 union select 2 union select NULL);

Select 1
where 1 not in (Select 3 union select 2 union select 4);


Select 1
where 1 in (Select 3 union select 2 union select NULL);

Select 1
where 1 in (Select 3 union select 2 union select 4);
