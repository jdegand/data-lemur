WITH cte AS (
    SELECT 
        *,
        LAG(transaction_timestamp) OVER (PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp) AS prev_transaction_time
    FROM transactions
)
SELECT 
    COUNT(transaction_id) AS payment_count
FROM (
    SELECT 
        *,
        EXTRACT(EPOCH FROM transaction_timestamp - prev_transaction_time) / 60 AS time_diff
    FROM cte
) AS subquery
WHERE time_diff <= 10;

/*
-- Using MINUTE gives different result than EPOCH
-- need to check more timestamps
-- MINUTE result will be the number of whole minutes in the time interval, discarding any seconds or fractions of a minute.

WITH cte AS (
    SELECT 
        *,
        LAG(transaction_timestamp) OVER (PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp) AS prev_transaction_time
    FROM transactions
)
SELECT 
    COUNT(transaction_id) AS payment_count
FROM (
    SELECT 
        *,
        EXTRACT(MINUTE FROM (transaction_timestamp - prev_transaction_time)) AS time_diff
    FROM cte
) AS subquery
WHERE time_diff <= 10;
*/

/*

-- alternative way

WITH numbered_transactions AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp) AS rn
    FROM transactions
), 
cte AS (
    SELECT 
        curr.transaction_id, 
        curr.transaction_timestamp, 
        prev.transaction_timestamp AS prev_transaction_time
    FROM numbered_transactions curr
    LEFT JOIN numbered_transactions prev ON curr.merchant_id = prev.merchant_id 
        AND curr.credit_card_id = prev.credit_card_id 
        AND curr.amount = prev.amount 
        AND curr.rn = prev.rn + 1
)
SELECT 
    COUNT(transaction_id) AS payment_count
FROM (
    SELECT 
        *,
        EXTRACT(EPOCH FROM (transaction_timestamp - prev_transaction_time)) / 60 AS time_diff
    FROM cte
) AS subquery
WHERE time_diff <= 10;
*/
