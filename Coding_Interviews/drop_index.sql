USE [AdventureWorks2022]
GO

/****** Object:  Index [PK_ProductVendor_ProductID_BusinessEntityID]    Script Date: 10/19/2025 3:57:46 PM ******/
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [PK_ProductVendor_ProductID_BusinessEntityID] WITH ( ONLINE = OFF )
GO

--drop INDEX  IX_ProductVendor_ProductID_BusinessEntityID on  [Purchasing].[ProductVendor] 


create NONCLUSTERED INDEX  IX_ProductVendor_ProductID_BusinessEntityID on  [Purchasing].[ProductVendor] (ProductID desc, BusinessEntityID desc)

--create unique INDEX  IX_ProductVendor_ProductID_BusinessEntityID on  [Purchasing].[ProductVendor] (ProductID desc, BusinessEntityID desc)
