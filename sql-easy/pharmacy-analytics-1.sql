SELECT drug, SUM(total_sales - cogs) as total_profit FROM pharmacy_sales 
GROUP BY drug 
ORDER BY total_profit DESC
LIMIT 3;

'''
SELECT drug, (total_sales - cogs) as total_profit FROM pharmacy_sales 
GROUP BY drug, total_sales, cogs
ORDER BY total_profit DESC
LIMIT 3;
'''