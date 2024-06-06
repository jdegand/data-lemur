SELECT user_id, tweet_date, 
       ROUND(AVG(tweet_count) OVER (ORDER BY user_id ROWS BETWEEN 3 PRECEDING AND CURRENT ROW), 2) AS rolling_avg_3d
FROM tweets;
