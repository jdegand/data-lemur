WITH RankedEmployees AS (
    SELECT 
        employee.name,
        department.department_name,
        employee.salary,
        ROW_NUMBER() OVER (PARTITION BY department.department_name ORDER BY employee.salary DESC) AS rank
    FROM employee
    INNER JOIN department ON department.department_id = employee.department_id
)
SELECT name, department_name, salary
FROM RankedEmployees
WHERE rank <= 3;

'''
SELECT employee.name, department.department_name, employee.salary
FROM employee 
JOIN department 
ON department.department_id = employee.department_id
ORDER BY employee.salary DESC;
'''