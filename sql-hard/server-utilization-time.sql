WITH cte AS (
  SELECT 
      server_id,
      session_status,
      status_time,
      LEAD(status_time) OVER (
          PARTITION BY server_id 
          ORDER BY status_time
      ) AS next_time,
      LEAD(session_status) OVER (
          PARTITION BY server_id 
          ORDER BY status_time
      ) AS next_status
  FROM server_utilization
)
SELECT ROUND(SUM(EXTRACT(EPOCH FROM next_time - status_time) / 86400), 0) AS total_uptime_days
FROM cte
WHERE session_status = 'start' AND next_status = 'stop';
