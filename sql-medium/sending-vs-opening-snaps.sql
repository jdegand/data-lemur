SELECT 
    ab.age_bucket,
    ROUND(
        SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END) 
        / NULLIF(SUM(CASE WHEN a.activity_type IN ('send','open') THEN a.time_spent ELSE 0 END),0) * 100.0, 
        2
    ) AS send_perc,
    ROUND(
        SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END) 
        / NULLIF(SUM(CASE WHEN a.activity_type IN ('send','open') THEN a.time_spent ELSE 0 END),0) * 100.0, 
        2
    ) AS open_perc
FROM activities a
INNER JOIN age_breakdown ab ON ab.user_id = a.user_id
WHERE a.activity_type IN ('send','open')
GROUP BY ab.age_bucket
ORDER BY ab.age_bucket;
