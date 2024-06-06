SELECT manufacturer, CONCAT('$', ROUND(SUM(total_sales) / 1000000, 0), ' million') AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY sale DESC;

-- FORMAT doesn't work with postgresql