-- SELECT * FROM user_actions WHERE event_type IS NULL;
-- The event_type requirement really doesn't matter, as the previous query returns nothing

SELECT EXTRACT(MONTH FROM ua1.event_date) AS month, COUNT(DISTINCT ua1.user_id) AS monthly_active_users 
FROM user_actions ua1 
INNER JOIN user_actions ua2 ON ua1.user_id = ua2.user_id AND EXTRACT(MONTH FROM ua1.event_date) = EXTRACT(MONTH FROM ua2.event_date) + 1 
WHERE EXTRACT(MONTH FROM ua1.event_date) = '7'
GROUP BY EXTRACT(MONTH FROM ua1.event_date);

/*
SELECT EXTRACT(MONTH FROM ua1.event_date) AS month,
       COUNT(DISTINCT ua1.user_id) AS monthly_active_users
FROM user_actions ua1
INNER JOIN user_actions ua2
ON ua1.user_id = ua2.user_id
AND EXTRACT(MONTH FROM ua1.event_date) = EXTRACT(MONTH FROM ua2.event_date) + 1
GROUP BY EXTRACT(MONTH FROM ua1.event_date);
*/

-- Using EXTRACT makes the query more general, but you could use actual month numbers for better performance
