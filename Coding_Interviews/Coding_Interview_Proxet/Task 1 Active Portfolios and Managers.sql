-- Initial data
/*
Scenario: You have a portfolios table and a managers table.

***************

IF OBJECT_ID('dbo.managers', 'U') IS NOT NULL DROP TABLE dbo.managers;
IF OBJECT_ID('dbo.portfolios', 'U') IS NOT NULL DROP TABLE dbo.portfolios;

CREATE TABLE dbo.managers (
    manager_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE dbo.portfolios (
    portfolio_id VARCHAR(10),
    portfolio_name VARCHAR(100),
    status VARCHAR(20),
    manager_id INT
);

INSERT INTO dbo.managers (manager_id, first_name, last_name) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith');

INSERT INTO dbo.portfolios (portfolio_id, portfolio_name, status, manager_id) VALUES
('P_001', 'Global Growth Fund', 'Active', 1),
('P_002', 'Real Estate Income', 'Active', 2),
('P_003', 'Emerging Markets', 'Inactive', 1);

*************************

Goal: List the names of all portfolios with a status of 'Active', along with the first and last name of their assigned manager.


*/

-- Solution
use coding_interview_proxet

select p.portfolio_name
	,m.first_name
	,m.last_name 
from portfolios p
left join managers m on p.manager_id = m.manager_id
where p.status = 'Active'



