SELECT e.employee_id AS employee_id, e.name AS employee_name
FROM employee e
JOIN employee m ON e.manager_id = m.employee_id
GROUP BY e.employee_id, e.name, e.salary, m.salary
HAVING e.salary > m.salary;
