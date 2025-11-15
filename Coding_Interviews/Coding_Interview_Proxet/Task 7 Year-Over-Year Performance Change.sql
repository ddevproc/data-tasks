-- Initial data
/*
Task 7: Year-Over-Year Performance Change

Scenario: You have a portfolio_monthly_snapshots table.

DDL (SQL Server):

IF OBJECT_ID('dbo.portfolio_monthly_snapshots', 'U') IS NOT NULL DROP TABLE dbo.portfolio_monthly_snapshots;

CREATE TABLE dbo.portfolio_monthly_snapshots (
    portfolio_id VARCHAR(10),
    snapshot_month DATE,
    total_value DECIMAL(18, 2)
);

INSERT INTO dbo.portfolio_monthly_snapshots (portfolio_id, snapshot_month, total_value) VALUES
('P_001', '2024-09-30', 1000000.00), ('P_001', '2025-09-30', 1200000.00),
('P_002', '2024-09-30', 500000.00), ('P_002', '2025-09-30', 550000.00);

*****************
SQL

IF OBJECT_ID('dbo.portfolio_monthly_snapshots', 'U') IS NOT NULL DROP TABLE dbo.portfolio_monthly_snapshots;

CREATE TABLE dbo.portfolio_monthly_snapshots (
    portfolio_id VARCHAR(10),
    snapshot_month DATE,
    total_value DECIMAL(18, 2)
);

INSERT INTO dbo.portfolio_monthly_snapshots (portfolio_id, snapshot_month, total_value) VALUES
('P_001', '2025-09-30', 1000000.00)
,('P_001', '2024-09-30', 1200000.00)
,('P_001', '2023-09-30', 128000.00)
,('P_001', '2022-09-30', 220000.00)
,('P_001', '2021-09-30', 6500000.00)
,('P_001', '2025-08-30', 32200000.00)
,('P_001', '2024-08-30', 44440000.00)
,('P_001', '2023-08-30', 5200000.00)

,('P_002', '2025-09-30', 2000002.00)
,('P_002', '2024-09-30', 2200003.00)
,('P_002', '2023-09-30', 3200004.00)
,('P_002', '2022-09-30', 4200005.00)
,('P_002', '2021-09-30', 5200006.00)


Goal: For each portfolio, calculate the market value from the same month in the prior year and show the year-over-year change.


*/

-- Solution
SELECT
    a.portfolio_id,
    a.snapshot_month AS current_month,
    a.total_value AS current_year_value,
    b.total_value AS prior_year_value,
    (a.total_value - b.total_value) AS year_over_year_change
FROM
    dbo.portfolio_monthly_snapshots AS a
JOIN
    dbo.portfolio_monthly_snapshots AS b
        ON a.portfolio_id = b.portfolio_id
        AND b.snapshot_month = DATEADD(year, -1, a.snapshot_month);




 WITH PriorYearValues AS (
    SELECT
        portfolio_id,
        snapshot_month,
        total_value,
        -- Look back 12 rows within each portfolio's data, ordered by date
        LAG(total_value, 12) OVER (PARTITION BY portfolio_id ORDER BY snapshot_month) AS prior_year_value
    FROM
        dbo.portfolio_monthly_snapshots
)
SELECT
    portfolio_id,
    snapshot_month,
    total_value AS current_year_value,
    prior_year_value,
    (total_value - prior_year_value) AS year_over_year_change
FROM
    PriorYearValues
WHERE
    -- Only show rows where a prior year value exists to compare against
    prior_year_value IS NOT NULL;





;with ta as (
select 1 as a
union all 
select 1
union all 
select 1
union all 
select 1
union all 
select 1
union all 
select 1
union all 
select 1
),
tb as (
select 1 as b
union all 
select 1
union all 
select 1
union all 
select 1
union all 
select 1
union all 
select 1
union all 
select 1
),
tc as (
select a from ta 
cross join tb
),
td as (
select 1 as a from tc 
cross join tc as tc2
),
cal as (
select top 10 2025 - row_number() over (order by (select 1)) + 1 as cal_year 
from td
)
select 
	cal.cal_year	
	,pms_c.portfolio_id
	,pms_c.snapshot_month
	,pms_c.total_value as total_value_this_year
	--,pms_p.total_value as total_value_prev_year
from portfolio_monthly_snapshots pms_c
left join cal on cal.cal_year = datepart(yy, pms_c.snapshot_month)
--left join portfolio_monthly_snapshots pms_p on pms_c.portfolio_id = pms_p.portfolio_id and pms_p.snapshot_month = DATEADD(yy, -1, pms_c.snapshot_month)
order by cal.cal_year desc
	,pms_c.portfolio_id asc



