WITH CorrectedData AS (
    SELECT 
        CASE 
            WHEN MOD(order_id, 2) = 1 AND LEAD(item) OVER (ORDER BY order_id) IS NULL THEN order_id + 1
            ELSE LEAD(order_id) OVER (ORDER BY order_id)
        END AS corrected_order_id,
        item
    FROM orders
)
SELECT corrected_order_id - 1, item FROM CorrectedData;

/*
WITH CorrectedData AS (
    SELECT 
        CASE 
            WHEN MOD(order_id, 2) = 1 AND LEAD(item) OVER (ORDER BY order_id) IS NULL THEN order_id + 1
            ELSE LEAD(order_id) OVER (ORDER BY order_id)
        END AS corrected_order_id,
        item
    FROM orders
)
SELECT corrected_order_id - 1 AS corrected_order_id, item
FROM CorrectedData
ORDER BY corrected_order_id;
*/