SELECT MAX(salary) AS second_highest_value
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);

-- 13000 is highest salary and 12500 is second highest (right now)