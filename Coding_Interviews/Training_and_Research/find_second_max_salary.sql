/*
SELECT the second highest salary from the employees table

*/


-- Variant 1

Select max(salary) as s
from employees
where salary < (Select max(salary) from employees


-- need to think hot to perform in using other methods


