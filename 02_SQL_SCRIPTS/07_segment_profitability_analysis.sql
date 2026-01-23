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

Select CUSTOMER_SEGMENT,
    COUNT(*) AS total_customers,
    SUM(total_customer_sales) as total_segment_revenue,
    AVG(total_customer_sales) as avg_revenue_per_customer,
    ROUND((SUM(total_customer_profit) / SUM(total_customer_sales)) * 100, 2) as margin_percent
FROM segmented_data
GROUP BY CUSTOMER_SEGMENT
ORDER BY margin_percent DESC;



