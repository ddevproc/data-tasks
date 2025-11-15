/*
DELETE DUPLICATES

*/

drop table if exists #training_details


CREATE TABLE #training_details(user_training_id INT, [user_id] INT,  training_id INT,  training_date date)
INSERT INTO #training_details
SELECT 1,1,1,'2015-08-02'
UNION 
SELECT 2,2,1,'2015-08-03'
UNION 
SELECT 3,3,2,'2015-08-02'
UNION 
SELECT 4,4,2,'2015-08-04'
UNION 
SELECT 5,2,2,'2015-08-03'
UNION 
SELECT 6,1,1,'2015-08-02'
UNION 
SELECT 7,3,2,'2015-08-04'
UNION 
SELECT 8,4,3,'2015-08-03'
UNION 
SELECT 9,1,4,'2015-08-03'
UNION 
SELECT 10,3,1,'2015-08-02'
UNION 
SELECT 11,4,2,'2015-08-04'
UNION 
SELECT 12,3,2,'2015-08-02'
UNION 
SELECT 13,1,1,'2015-08-02'
UNION 
SELECT 14,4,3,'2015-08-03'




select user_id, training_id, training_date  
from #training_details 
order by user_id, training_id, training_date  







;with t as (
select user_id, training_id, training_date, row_number() over (partition by user_id, training_id, training_date order by user_id) as rn 
from #training_details 
)
delete from t
where rn > 1

select user_id, training_id, training_date  
from #training_details 
order by user_id, training_id, training_date  



