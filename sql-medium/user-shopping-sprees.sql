SELECT
  DISTINCT T1.user_id
FROM transactions AS T1
JOIN transactions AS T2
  ON DATE(T2.transaction_date) = DATE(T1.transaction_date) + 1
JOIN transactions AS T3
  ON DATE(T3.transaction_date) = DATE(T1.transaction_date) + 2
  ORDER BY T1.user_id;

/*
SELECT DISTINCT user_id
FROM (
    SELECT 
        user_id,
        DATE(transaction_date) AS transaction_date,
        LAG(DATE(transaction_date), 1) OVER (PARTITION BY user_id ORDER BY DATE(transaction_date)) AS prev_day,
        LAG(DATE(transaction_date), 2) OVER (PARTITION BY user_id ORDER BY DATE(transaction_date)) AS prev2_day
    FROM transactions
) t
WHERE transaction_date = prev_day + INTERVAL '1 day'
  AND prev_day = prev2_day + INTERVAL '1 day';
*/

