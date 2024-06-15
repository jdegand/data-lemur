-- you can use USING and JOIN together 
-- USING can be used with self-joins
-- 1.0 is necessary for precision
-- JOIN type doesn't seem to matter here 

WITH cte AS (
    SELECT 
        SUM(CASE WHEN p2.country_id != p1.country_id THEN 1.0 ELSE 0 END) AS call_count
    FROM phone_calls AS pc
    JOIN phone_info AS p1 USING(caller_id)
    JOIN phone_info AS p2 ON pc.receiver_id = p2.caller_id
)

SELECT ROUND((call_count * 100.0 / (SELECT COUNT(*) FROM phone_calls)), 1) 
FROM cte;