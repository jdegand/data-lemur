WITH CorrectedData AS (
    SELECT 
        CASE 
            WHEN MOD(order_id, 2) = 1 
                THEN COALESCE(LEAD(item) OVER (ORDER BY order_id), item)
            ELSE COALESCE(LAG(item) OVER (ORDER BY order_id), item)
        END AS corrected_item,
        order_id
    FROM orders
)
SELECT order_id AS corrected_order_id, corrected_item AS item
FROM CorrectedData
ORDER BY corrected_order_id;

-- need coalesce to handle null on last item of LEAD
