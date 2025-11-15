--RUNNING TOTAL
/*
CREATE TABLE SalesData (
    SaleDate DATE,
    Amount DECIMAL(10,2)
);

INSERT INTO SalesData (SaleDate, Amount)
VALUES 
('2023-01-01', 100),
('2023-01-02', 150),
('2023-01-03', 120),
('2023-01-04', 130),
('2023-01-05', 160),
('2023-01-06', 180),
('2023-01-07', 140),
('2023-01-08', 170),
('2023-01-09', 190),
('2023-01-10', 200);

*/

select saledate
	,amount
	,sum(amount) over (order by saledate) as running_total
	,avg(amount) over (order by saledate rows between 2 preceding and current row) as moving_average_trailing
	,avg(amount) over (order by saledate rows between 1 preceding and 1 following) as moving_average_centered
	,avg(amount) over (order by saledate rows between current row and 2 following) as moving_average_forward_looking
	,count(amount) over (order by amount ) as running_count

from SalesData
order by saledate



