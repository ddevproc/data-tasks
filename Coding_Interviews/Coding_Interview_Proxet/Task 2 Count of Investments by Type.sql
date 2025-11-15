-- Initial data
/*
Scenario: You have an investments table.

***************
IF OBJECT_ID('dbo.investments', 'U') IS NOT NULL DROP TABLE dbo.investments;

CREATE TABLE dbo.investments (
    investment_id VARCHAR(10),
    investment_type VARCHAR(50)
);

INSERT INTO dbo.investments (investment_id, investment_type) VALUES
('INV_A', 'Equity'),
('INV_B', 'Fixed Income'),
('INV_C', 'Real Estate'),
('INV_D', 'Equity'),
('INV_E', 'Real Estate');

*************************

Goal: Write a query to count how many investments exist for each investment_type.


*/

-- Solution

select COUNT(investment_id), investment_type  from investments
group by investment_type