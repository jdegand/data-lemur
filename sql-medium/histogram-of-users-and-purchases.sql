WITH RankedTransactions AS (
    SELECT
        user_id,
        transaction_date,
        product_id,
        RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS row_number
    FROM user_transactions
)

SELECT
    transaction_date,
    user_id,
    COUNT(product_id) AS purchase_count
FROM RankedTransactions
WHERE row_number = 1
GROUP BY transaction_date, user_id
ORDER BY transaction_date;

-- COUNT(DISTINCT product_id)?

-- ROW_NUMBER returns 1 for all purchase_count values
-- DISTINCT and ROW_NUMBER is not a good combination
-- window functions are calculated before DISTINCT is applied.
