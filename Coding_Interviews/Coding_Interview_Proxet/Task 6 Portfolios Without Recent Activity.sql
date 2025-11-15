-- Initial data
/*
Task 6: Portfolios Without Recent Activity
Scenario: You have portfolios and transactions tables.

DDL (SQL Server):

SQL

IF OBJECT_ID('dbo.portfolios', 'U') IS NOT NULL DROP TABLE dbo.portfolios;
IF OBJECT_ID('dbo.transactions', 'U') IS NOT NULL DROP TABLE dbo.transactions;

CREATE TABLE dbo.portfolios (portfolio_id VARCHAR(10), portfolio_name VARCHAR(100));
CREATE TABLE dbo.transactions (transaction_id INT, portfolio_id VARCHAR(10), transaction_date DATE);

INSERT INTO dbo.portfolios (portfolio_id, portfolio_name) VALUES
('P_001', 'Global Growth Fund'),
('P_002', 'Real Estate Income'),
('P_003', 'Silent Fund');

INSERT INTO dbo.transactions (transaction_id, portfolio_id, transaction_date) VALUES
(1, 'P_001', DATEADD(day, -10, GETDATE())),
(2, 'P_002', DATEADD(day, -120, GETDATE())),
(3, 'P_001', DATEADD(day, -30, GETDATE()));

Goal: Identify all portfolios that have not had a transaction in the last 90 days.


create nonclustered index ix_1 on transactions(portfolio_id, transaction_date)

*/

-- Solution


select p.portfolio_name
from portfolios p 
left join transactions t on p.portfolio_id = t.portfolio_id and t.transaction_date between DATEADD(d, -90, GETDATE()) and GETDATE()
group by p.portfolio_name, p.portfolio_id
having COUNT(t.transaction_id) = 0

