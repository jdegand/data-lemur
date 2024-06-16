WITH cte AS (
    SELECT 
        EXTRACT(YEAR FROM transaction_date) AS year, 
        product_id, 
        SUM(spend) AS curr_year_spend,
        LAG(SUM(spend)) OVER(PARTITION BY product_id ORDER BY EXTRACT(YEAR FROM transaction_date)) AS prev_year_spend
    FROM user_transactions 
    GROUP BY EXTRACT(YEAR FROM transaction_date), product_id
) 
SELECT 
    year, 
    product_id, 
    curr_year_spend, 
    prev_year_spend, 
    ROUND((curr_year_spend - prev_year_spend) / prev_year_spend * 100.0, 2) AS yoy_rate 
FROM cte;

/*
WITH cte AS (
    SELECT EXTRACT(YEAR FROM transaction_date) AS year, product_id, SUM(spend) AS curr_year_spend 
    FROM user_transactions 
    GROUP BY EXTRACT(YEAR FROM transaction_date), product_id
),

cte2 AS (
SELECT 
    *,
    LAG(curr_year_spend) OVER(PARTITION BY product_id ORDER BY year) AS prev_year_spend 
FROM cte
)

SELECT 
    year,
    product_id,
    curr_year_spend,
    prev_year_spend,
    ROUND((curr_year_spend - prev_year_spend) / prev_year_spend * 100.0, 2) AS yoy_rate 
FROM cte2;
*/
