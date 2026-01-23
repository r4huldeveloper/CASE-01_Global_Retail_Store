SELECT 
  `Sub-Category`,
  SUM(sales) as total_sales,
  SUM(profit) as total_profit,
  AVG(discount) as avg_discount,
  (SUM(profit)/ SUM(sales))*100 as Margin_percent
  FROM `superstore_analysis.raw_data`
  GROUP BY `Sub-Category`
  ORDER BY TOTAL_PROFIT ASC
  LIMIT 5
