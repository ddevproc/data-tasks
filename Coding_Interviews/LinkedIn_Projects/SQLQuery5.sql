use AdventureWorks2022;
go
select * from Sales.SalesOrderHeader soh 
where exists (select sc.CustomerID from Sales.Customer sc where sc.CustomerID = soh.CustomerID)
go
select * from Sales.SalesOrderHeader soh 
where exists (select sc.CustomerID from Sales.Customer sc where soh.CustomerID = sc.CustomerID)