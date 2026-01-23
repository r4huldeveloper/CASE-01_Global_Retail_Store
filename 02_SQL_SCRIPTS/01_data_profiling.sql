SELECT 
  MIN(`Order Date`) AS First_Order,
  MAX(`Order Date`) AS Last_Order,
  COUNT(*) AS Total_Rows
FROM `superstore_analysis.raw_data`;