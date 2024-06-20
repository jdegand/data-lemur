-- can't use DATEDIFF
-- This is probably wrong - but it seems close
-- changing from ROW_NUMBER to RANK or DENSE_RANK produced same result
-- PARTITION clauses problematic?

WITH cte AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY server_id, session_status ORDER BY status_time) AS row
  FROM server_utilization
),
cte2 AS (
  SELECT server_id,
         session_status,
         status_time AS start_time,
         LEAD(status_time) OVER (PARTITION BY server_id, row ORDER BY row) AS stop_time
  FROM cte
)
SELECT SUM(EXTRACT(DAY FROM stop_time - start_time)) AS total_uptime_days
FROM cte2;

/*
WITH cte AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY server_id, session_status ORDER BY status_time) AS row
  FROM server_utilization
),
cte2 AS (
  SELECT server_id,
         session_status,
         status_time AS start_time,
         LEAD(status_time) OVER (PARTITION BY server_id, row ORDER BY row) AS stop_time
  FROM cte
)
SELECT SUM(DATE_PART('day', stop_time - start_time)) AS total_uptime_days
FROM cte2;
*/

/*
-- result doesn't change with CAST added

WITH cte AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY server_id, session_status ORDER BY status_time) AS row 
    FROM server_utilization
), 
cte2 AS (
    SELECT server_id, 
           session_status, 
           status_time AS start_time, 
           LEAD(status_time) OVER (PARTITION BY server_id, row ORDER BY row) AS stop_time 
    FROM cte
) 
SELECT SUM(CAST(DATE_PART('day', stop_time - start_time) AS INTEGER)) AS total_uptime_days 
FROM cte2;
*/

/*
WITH cte AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY session_status ORDER BY status_time) AS row
  FROM server_utilization
),
cte2 AS (
  SELECT server_id,
         session_status,
         status_time AS start_time,
         LEAD(status_time) OVER (PARTITION BY row ORDER BY row) AS stop_time
  FROM cte
)
SELECT SUM(EXTRACT(DAY FROM stop_time - start_time)) AS total_uptime_days
FROM cte2;
*/