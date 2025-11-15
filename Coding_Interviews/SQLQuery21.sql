select date
	,amount
	,sum(amount) over (order by saledate) as running_total
	,avg(amount) over (order by saledate rows between 2 preceding and current row) as moving_average_trailing
	,avg(amount) over (order by saledate rows between 1 preceding and 1 following) as moving_average_centered
	,avg(amount) over (order by saledate rows between current row and 2 following) as moving_average_forward_looking
from Sales
order by saledate