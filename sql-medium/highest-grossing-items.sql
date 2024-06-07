WITH RankedProducts AS (
    SELECT
        category,
        product,
        spend,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY spend DESC) AS rn
    FROM
        product_spend
    WHERE
        EXTRACT(YEAR FROM transaction_date) = 2022
)
SELECT
    category,
    product,
    spend as total_spend
FROM
    RankedProducts
WHERE
    rn <= 2;
