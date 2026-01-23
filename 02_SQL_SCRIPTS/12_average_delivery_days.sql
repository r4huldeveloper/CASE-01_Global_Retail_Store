SELECT 
    country,
    ROUND(AVG(DATE_DIFF(CAST(`Ship Date` AS DATE), CAST(`Order Date` AS DATE), DAY)), 2) AS avg_delivery_days,
    COUNT(DISTINCT `Order ID`) as total_orders
FROM `superstore_analysis.raw_data`
GROUP BY country
ORDER BY avg_delivery_days ASC;