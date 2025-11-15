DECLARE @columnName NVARCHAR(255)='user''s "custom" name'
DECLARE @sql NVARCHAR(MAX) = 'SELECT FirstName AS ' + QUOTENAME(@columnName) + ' FROM dbo.DimCustomer'

select QUOTENAME(@columnName, '(')

print @sql