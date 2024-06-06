SELECT
    SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
    SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM (
    SELECT device_type
    FROM viewership
) AS subquery;

/*
SELECT 
    CASE 
        WHEN device_type IN ('tablet', 'phone') THEN 'Tablet/Phone'
        ELSE 'Laptop'
    END AS mobile_views,
    COUNT(*) 
FROM viewership
GROUP BY 
    CASE 
        WHEN device_type IN ('tablet', 'phone') THEN 'Tablet/Phone'
        ELSE 'Laptop'
    END;
*/
