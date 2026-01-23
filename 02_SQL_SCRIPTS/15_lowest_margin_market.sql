SELECT 
    market,
    region,
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low (0-20%)'
        ELSE 'High (>20%)'
    END AS discount_group,
    COUNT(*) as order_count,
    SUM(Sales) as total_sales,
    SUM(Profit) as total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) as margin_pct
FROM `superstore_analysis.raw_data`
WHERE (market = 'APAC' AND region = 'Southeast Asia') 
   OR (market = 'LATAM' AND region = 'South')
GROUP BY 1, 2, 3
ORDER BY market, margin_pct DESC;