-- Initial data
/*
Scenario: An assets table contains records for various assets.

DDL (SQL Server):

SQL

IF OBJECT_ID('dbo.assets', 'U') IS NOT NULL DROP TABLE dbo.assets;

CREATE TABLE dbo.assets (
    asset_id VARCHAR(10),
    value_usd DECIMAL(18, 2),
    region VARCHAR(50)
);

INSERT INTO dbo.assets (asset_id, value_usd, region) VALUES
('A1', 1200000.00, 'North America'),
('A2', 850000.00, 'EMEA'),
('A3', 1500000.00, 'North America'),
('A4', 700000.00, 'APAC'),
('A5', 950000.00, 'EMEA');


Goal: Calculate the total value of all assets, grouped by region, and order the results from highest total value to lowest.


*/

-- Solution

select SUM(value_usd) as total_value, region from assets
group by region
order by total_value 