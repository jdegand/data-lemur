/*
-- 200
SELECT COUNT(*)
FROM callers;
*/

/*
-- 11
SELECT COUNT(*) FROM callers 
WHERE call_category IS NULL OR call_category = 'n/a';
*/

WITH cte AS (
  SELECT COUNT(*) AS c FROM callers 
  WHERE call_category IS NULL OR call_category = 'n/a'
)

SELECT ROUND((c * 100.0 / (SELECT COUNT(*) FROM callers)), 1) AS uncategorised_call_pct
FROM cte;
