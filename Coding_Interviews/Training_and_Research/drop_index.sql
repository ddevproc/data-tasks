USE [AdventureWorks2022]
GO

/****** Object:  Index [PK_ProductVendor_ProductID_BusinessEntityID]    Script Date: 10/19/2025 3:57:46 PM ******/
ALTER TABLE [Purchasing].[ProductVendor] DROP CONSTRAINT [PK_ProductVendor_ProductID_BusinessEntityID] WITH ( ONLINE = OFF )
GO


