WITH customer_stats AS(
    SELECT 
    `customer id`, `customer name`,
    COUNT(DISTINCT `order id`) AS total_orders,
    SUM(sales) as total_customer_sales,
    SUM(profit) as total_customer_profit
FROM `superstore_analysis.raw_data`
GROUP BY `Customer Name`, `customer id`
)

SELECT *,
CASE
    WHEN total_orders > 15 THEN 'LOYAL CUSTOMER'
    WHEN total_orders BETWEEN 6 AND 15 THEN 'REGULAR CUSTOMERS'
    WHEN total_orders BETWEEN 2 AND 5 THEN 'OCCASIONAL CUSTOMERS'
    ELSE 'ONE TIME CUSTOMERS'
    END AS CUSTOMER_SEGMENT
FROM customer_stats
ORDER BY total_orders DESC;

