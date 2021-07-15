SELECT DISTINCT
		ISNULL(dbo.dimProduct.DimProductKey, -1) AS dimProductKey,
		ISNULL(dbo.dimChannel.dimChannelKey, -1) AS dimChannelKey,
		ISNULL(dbo.dimReseller.DimResellerKey, -1)AS dimResellerKey,		
		ISNULL(dbo.dimCustomer.DimCustomerKey, -1) AS dimCustomerKey,
		ISNULL(dbo.dimStore.DimStoreKey, -1) AS dimStoreKey,
		dbo.StageSalesDetail.SalesQuantity AS SaleQuantity, 
		dbo.StageSalesDetail.SalesAmount AS SaleAmount,
		dbo.dimDate.DimDateID AS dimSaleDateKey
		

	FROM StageSalesHeader
	LEFT JOIN StageSalesDetail ON
	dbo.StageSalesDetail.SalesHeaderID = dbo.StageSalesHeader.SalesHeaderID
	LEFT JOIN dimProduct ON
	dbo.dimProduct.ProductID = dbo.StageSalesDetail.ProductID 
	LEFT JOIN dimChannel ON
	dbo.dimChannel.ChannelID = dbo.StageSalesHeader.ChannelID
	LEFT JOIN dimReseller ON
	dbo.dimReseller.ResellerID = dbo.StageSalesHeader.ResellerID
	LEFT JOIN dimCustomer ON
	dbo.dimCustomer.CustomerID = dbo.StageSalesHeader.CustomerID
	LEFT JOIN dimStore ON
	dbo.dimStore.StoreID = dbo.StageSalesHeader.StoreID
	LEFT JOIN dimDate ON
	dbo.dimDate.FullDate = dbo.StageSalesHeader.[Date]