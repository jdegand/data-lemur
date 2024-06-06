SELECT 
    DISTINCT deals.employee_id,
    CASE 
        WHEN deals.deal_size > sales_quotas.quota THEN 'Yes'
        ELSE 'No'
    END AS made_quota
FROM deals, sales_quotas
WHERE sales_quotas.employee_id = deals.employee_id
ORDER BY deals.employee_id ASC;
