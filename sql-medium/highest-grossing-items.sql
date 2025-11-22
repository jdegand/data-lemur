WITH ProductTotals AS (
    SELECT
        category,
        product,
        SUM(spend) AS total_spend
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY category, product
),
RankedProducts AS (
    SELECT
        category,
        product,
        total_spend,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_spend DESC) AS rn
    FROM ProductTotals
)
SELECT
    category,
    product,
    total_spend
FROM RankedProducts
WHERE rn <= 2
ORDER BY category, total_spend DESC;
