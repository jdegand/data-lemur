/*
SELECT user_id, 
       (SELECT COUNT(DISTINCT post_date::DATE) 
        FROM posts p2 
        WHERE p2.user_id = p1.user_id) - 1 AS days_between
FROM posts p1
WHERE post_date >= '2021-01-01' AND post_date < '2022-01-01'
GROUP BY user_id
HAVING COUNT(post_id) > 1;
*/
