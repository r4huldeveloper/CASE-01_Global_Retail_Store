WITH customer_stats AS(
    SELECT 
    `customer id`, `customer name`,
    COUNT(DISTINCT `order id`) AS total_orders,
    SUM(sales) as total_customer_sales,
    SUM(profit) as total_customer_profit 
FROM `superstore_analysis.raw_data`
GROUP BY `Customer Name`, `customer id`
),
segmented_data AS(
SELECT *,
CASE
    WHEN total_orders > 15 THEN 'LOYAL CUSTOMER'
    WHEN total_orders BETWEEN 6 AND 15 THEN 'REGULAR CUSTOMERS'
    WHEN total_orders BETWEEN 2 AND 5 THEN 'OCCASIONAL CUSTOMERS'
    ELSE 'ONE TIME CUSTOMERS'
    END AS CUSTOMER_SEGMENT
FROM customer_stats
ORDER BY total_orders DESC
)

SELECT 
    EXTRACT(YEAR FROM CAST(`Order Date` AS DATE)) AS order_year,
    sc.CUSTOMER_SEGMENT,
    ROUND(SUM(rd.Profit), 2) AS yearly_total_profit,
    ROUND((SUM(rd.Profit) / SUM(rd.Sales)) * 100, 2) AS yearly_margin_percent
FROM `superstore_analysis.raw_data` AS rd
JOIN segmented_data AS sc ON rd.`Customer ID` = sc.`Customer ID`
GROUP BY order_year, CUSTOMER_SEGMENT
ORDER BY order_year DESC, yearly_total_profit DESC;