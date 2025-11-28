WITH call_intervals AS (
    SELECT
        policy_holder_id,
        call_date,
        LAG(call_date) OVER (PARTITION BY policy_holder_id ORDER BY call_date) AS prev_call_date
    FROM callers
)
SELECT COUNT(DISTINCT policy_holder_id) AS unique_callers
FROM call_intervals
WHERE prev_call_date IS NOT NULL
  AND CASE 
        WHEN call_date - prev_call_date <= INTERVAL '7 DAY' 
        THEN 1 
        ELSE 0 
      END = 1;
