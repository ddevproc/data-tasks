-- Initial data
/*

Scenario: You have a properties table for a real estate fund.



IF OBJECT_ID('dbo.properties', 'U') IS NOT NULL DROP TABLE dbo.properties;

CREATE TABLE dbo.properties (
    property_id INT,
    address VARCHAR(255),
    market_value DECIMAL(18, 2)
);

INSERT INTO dbo.properties (property_id, address, market_value) VALUES
(101, '123 Main St, New York, NY', 6500000.00),
(102, '456 Oak Ave, Los Angeles, CA', 4800000.00),
(103, '789 Pine Ln, Chicago, IL', 5100000.00);


Goal: Find the property_id and address of all properties with a market value greater than $5,000,000.


*/

-- Solution

select  property_id, [address] 
from properties
where market_value > 5000000

