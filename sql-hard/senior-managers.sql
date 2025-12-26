WITH first_level AS (
  -- employees with their immediate manager
  SELECT 
    e1.emp_id   AS reportee,
    e1.manager_id AS manager_id
  FROM employees e1
),
second_level AS (
  -- managers with their names
  SELECT 
    e2.emp_id       AS manager_id,
    e2.manager_name AS manager_name,
    e2.manager_id   AS upper_manager
  FROM employees e2
),
third_level AS (
  -- upper managers (manager of the manager)
  SELECT 
    e3.emp_id AS upper_manager
  FROM employees e3
),
manager_hierarchy AS (
  SELECT
    s.manager_name,
    s.manager_id,
    f.reportee,
    s.upper_manager
  FROM first_level f
  JOIN second_level s
    ON f.manager_id = s.manager_id
  JOIN third_level t
    ON s.upper_manager = t.upper_manager
)
SELECT
  manager_name,
  COUNT(DISTINCT manager_id) AS direct_report_count
FROM manager_hierarchy
GROUP BY manager_name
ORDER BY direct_report_count DESC;
