SELECT country,
COUNT(DISTINCT `Customer ID`) as total_unique_customers,
SUM(sales) AS country_revenue
FROM `superstore_analysis.raw_data`
GROUP BY Country
ORDER BY total_unique_customers DESC;