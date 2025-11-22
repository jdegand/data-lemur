SELECT
    sub.unique_queries,
    COUNT(sub.employee_id) AS employee_count
FROM (
    SELECT
        employees.employee_id,
        COUNT(DISTINCT queries.query_id) AS unique_queries
    FROM employees
    LEFT JOIN queries ON employees.employee_id = queries.employee_id
        AND queries.query_starttime >= '2023-07-01'
        AND queries.query_starttime <= '2023-10-01'
    GROUP BY employees.employee_id
) AS sub
GROUP BY sub.unique_queries
ORDER BY sub.unique_queries;
