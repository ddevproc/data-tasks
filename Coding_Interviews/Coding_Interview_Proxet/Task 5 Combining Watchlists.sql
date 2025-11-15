-- Initial data
/*
Scenario: Two analysts have provided tables of investment_ids.

DDL (SQL Server):

SQL

IF OBJECT_ID('dbo.analyst1_watchlist', 'U') IS NOT NULL DROP TABLE dbo.analyst1_watchlist;
IF OBJECT_ID('dbo.analyst2_watchlist', 'U') IS NOT NULL DROP TABLE dbo.analyst2_watchlist;

CREATE TABLE dbo.analyst1_watchlist (investment_id VARCHAR(10));
CREATE TABLE dbo.analyst2_watchlist (investment_id VARCHAR(10));

INSERT INTO dbo.analyst1_watchlist (investment_id) VALUES ('INV_A'), ('INV_B'), ('INV_C');
INSERT INTO dbo.analyst2_watchlist (investment_id) VALUES ('INV_B'), ('INV_D'), ('INV_E');



Goal: Create a single, combined list of unique investment_ids from both watchlists.


*/

-- Solution

select * from analyst1_watchlist
union
select * from analyst2_watchlist