WITH department_avg_salary AS (
    SELECT 
        e.department_id,
        TO_CHAR(s.payment_date, 'MM-YYYY') AS payment_month,
        AVG(s.amount) AS avg_department_salary
    FROM 
        employee e
    JOIN 
        salary s USING(employee_id)
    WHERE 
        TO_CHAR(s.payment_date, 'MM-YYYY') = '03-2024'
    GROUP BY 
        e.department_id, TO_CHAR(s.payment_date, 'MM-YYYY')
),
company_avg_salary AS (
    SELECT 
        TO_CHAR(s.payment_date, 'MM-YYYY') AS payment_month,
        AVG(s.amount) AS avg_company_salary
    FROM 
        salary s
    WHERE 
        TO_CHAR(s.payment_date, 'MM-YYYY') = '03-2024'
    GROUP BY 
        TO_CHAR(s.payment_date, 'MM-YYYY')
)
SELECT 
    d.department_id,
    d.payment_month,
    CASE 
        WHEN d.avg_department_salary > c.avg_company_salary THEN 'higher'
        WHEN d.avg_department_salary < c.avg_company_salary THEN 'lower'
        ELSE 'same'
    END AS comparison
FROM 
    department_avg_salary d
JOIN 
    company_avg_salary c USING(payment_month);
