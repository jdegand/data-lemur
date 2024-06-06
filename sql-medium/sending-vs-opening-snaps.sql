SELECT age_breakdown.age_bucket,
       ROUND(SUM(CASE WHEN activities.activity_type = 'send' THEN activities.time_spent ELSE 0 END) / SUM(activities.time_spent) * 100.0, 2) AS send_perc,
       ROUND(SUM(CASE WHEN activities.activity_type = 'open' THEN activities.time_spent ELSE 0 END) / SUM(activities.time_spent) * 100.0, 2) AS open_perc
FROM activities
LEFT JOIN age_breakdown ON age_breakdown.user_id = activities.user_id
GROUP BY age_breakdown.age_bucket
ORDER BY age_breakdown.age_bucket;

/*
SELECT age_breakdown.age_bucket, 
       ROUND((SUM(CASE WHEN activity_type = 'sending' THEN time_spent ELSE 0 END) / SUM(time_spent)) * 100, 2) AS sending_percentage, 
       ROUND((SUM(CASE WHEN activity_type = 'opening' THEN time_spent ELSE 0 END) / SUM(time_spent)) * 100, 2) AS opening_percentage 
FROM activities 
JOIN age_breakdown ON activities.user_id = age_breakdown.user_id 
GROUP BY age_breakdown.age_bucket;
*/