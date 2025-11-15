MERGE sl_SaleReceiptPaymentsEmvSet AS target
  USING emv  AS source  
  ON (target.SaleReceiptPaymentsID = source.PaymentID AND target.EmvDataSetPropertyName=rtrim(source.Prop_name))
  WHEN MATCHED THEN   UPDATE SET EmvDataSetPropertyValue = rtrim(source.Prop_Value)
  WHEN NOT MATCHED THEN
	INSERT (SaleReceiptPaymentsID,EmvDataSetPropertyName,EmvDataSetPropertyValue,CounterCard)
	VALUES (source.PaymentID, source.Prop_name, source.Prop_Value, source.[Counter]);	  
end
