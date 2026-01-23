SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount > 0 AND Discount <= 0.2 THEN 'Low (0-20%)'
        WHEN Discount > 0.2 AND Discount <= 0.5 THEN 'Medium (20-50%)'
        ELSE 'High (>50%)'
    END AS discount_bracket,
    COUNT(*) AS order_count,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS margin_pct
FROM `superstore_analysis.raw_data`
GROUP BY 1
ORDER BY margin_pct DESC;