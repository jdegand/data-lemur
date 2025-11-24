WITH RankedEmployees AS (
    SELECT 
        e.name,
        d.department_name,
        e.salary,
        DENSE_RANK() OVER (
            PARTITION BY d.department_name 
            ORDER BY e.salary DESC
        ) AS emp_rank
    FROM employee e
    INNER JOIN department d 
        ON d.department_id = e.department_id
)
SELECT department_name, name, salary
FROM RankedEmployees
WHERE emp_rank <= 3
ORDER BY department_name ASC, salary DESC, name ASC;
