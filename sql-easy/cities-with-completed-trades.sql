SELECT users.city, COUNT(order_id) as total_orders 
FROM trades 
JOIN users ON users.user_id = trades.user_id 
WHERE status = 'Completed' 
GROUP BY users.city 
ORDER BY total_orders DESC
LIMIT 3;
