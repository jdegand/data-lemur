SELECT
    sub.unique_queries,
    COUNT(sub.employee_id) AS employee_count
FROM (
    SELECT
        employees.employee_id,
        COALESCE(COUNT(DISTINCT queries.query_id), 0) AS unique_queries
    FROM employees
    LEFT JOIN queries ON employees.employee_id = queries.employee_id
        AND queries.query_starttime >= '2023-07-01'
        AND queries.query_starttime <= '2023-09-30'
    GROUP BY employees.employee_id
) AS sub
GROUP BY sub.unique_queries
ORDER BY sub.unique_queries ASC;

-- need LEFT JOIN to get the 0 values
-- I think you can use dates either way -> 07/01/2023 or 2023-07-01
