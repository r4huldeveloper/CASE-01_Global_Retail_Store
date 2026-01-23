SELECT 
category, 
SUM(sales) AS Total_sales
FROM superstore_analysis.raw_data
GROUP BY category
ORDER BY Total_sales desc;