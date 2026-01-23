SELECT 
    `Ship Mode`,
    ROUND(AVG(DATE_DIFF(CAST(`Ship Date` AS DATE), CAST(`Order Date` AS DATE), DAY)), 1) AS avg_delivery_days,
    SUM(Profit) AS total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS margin_pct
FROM `superstore_analysis.raw_data`
GROUP BY 1
ORDER BY margin_pct DESC;