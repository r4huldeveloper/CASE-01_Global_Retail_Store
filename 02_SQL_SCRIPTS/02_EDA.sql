SELECT 
  Sum(sales) AS Total_Sales,
  SUM(profit) AS Total_Profit,
  AVG(discount) AS Average_Discount,
  SUM(quantity) AS Total_Quantity
FROM `superstore_analysis.raw_data`;