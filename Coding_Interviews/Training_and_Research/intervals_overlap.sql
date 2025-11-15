/*

It is needed to develop a query to retrieve a list of employees whose business trip schedule has overlaps with business trip schedule of other employees.
Result set should contain two columns. The first column should be the employee_id column. 
The second column should be the overlap column. If emploee’s business trip schedule has overlaps with business trip schedule of other employees,  
the overlap field should be populated with 1, otherwise with 0.


*/

drop table if exists #business_trip_schedule

CREATE TABLE #business_trip_schedule(employee_id int, bt_start_date date, bt_end_date date)

INSERT INTO #business_trip_schedule (employee_id, bt_start_date, bt_end_date)
SELECT 1002, '2021-04-01', '2021-04-21' 
union
SELECT 2104, '2021-03-16', '2021-04-06' 
union
SELECT 3414, '2021-04-22', '2021-05-17' 
union
SELECT 4942, '2021-03-01', '2021-04-06' 
union
SELECT 5186, '2021-02-11', '2021-03-03' 
union
SELECT 643, '2021-01-04', '2021-02-08' 


select * from #business_trip_schedule
order by bt_start_date, bt_end_date 


select distinct bt1.employee_id, 
	case 
		when bt2.employee_id is not null then 1
		when bt2.employee_id is null then 0
	end as is_overlapped
from #business_trip_schedule bt1 
left join #business_trip_schedule bt2 
	on bt1.employee_id <> bt2.employee_id
		and bt1.bt_start_date <= bt2.bt_end_date
		and bt1.bt_end_date >= bt2.bt_start_date
order by bt1.employee_id

