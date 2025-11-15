DROP TABLE IF EXISTS table1
DROP TABLE IF EXISTS table2
CREATE TABLE table1 (id INT, val VARCHAR(100))
CREATE TABLE table2 (id INT, val VARCHAR(100), id_ref INT)

INSERT INTO table1 (id, val) 
VALUES (1, 'A1'), (2, 'A2'), (3, 'A3')

INSERT INTO table2 (id, val, id_ref) 
VALUES (1, 'B1', 2), (2, 'B2', 3), (3, 'B3', NULL)


select * from table1
select * from table2

SELECT *
FROM table1
WHERE id NOT IN (
		SELECT id_ref
		FROM table2
		)

------ HOW TO FIX THE PROBLEM WITH NULLs

SELECT *
FROM table1
WHERE id NOT IN (
		SELECT id_ref
		FROM table2
		WHERE id_ref IS NOT NULL
		)
	

SELECT *
FROM table1 t1
WHERE NOT EXISTS (
		SELECT id_ref
		FROM table2 t2
		WHERE t1.id = t2.id_ref
		)






return















Select 1 as result where 1 not in (3, 2, NULL);

Select 1 as result where 1 not in (3, 2, 4);

Select 1 as result where 1 in (3, 1, NULL);

Select 1 as result where 1 in (3, 1, 4);

select '*******************'

Select 1 as result where 1 not in (Select 3 union select 2 union select NULL);

Select 1 as result where 1 not in (Select 3 union select 2 union select 4);

Select 1 as result where 1 in (Select 3 union select 1 union select NULL);

Select 1 as result where 1 in (Select 3 union select 1 union select 4);
