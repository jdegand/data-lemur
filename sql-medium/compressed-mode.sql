WITH cte AS (
    SELECT
        item_count,
        order_occurrences,
        RANK() OVER (ORDER BY order_occurrences DESC) AS row_number
    FROM
        items_per_order
)

SELECT item_count AS mode
FROM cte
WHERE row_number = 1
ORDER BY item_count;

/*
-- this seems right but
-- using ROW_NUMBER is problematic 
-- since there are 2 order_occurences of 1000

WITH cte AS (
    SELECT
        item_count,
        order_occurrences,
        ROW_NUMBER() OVER (ORDER BY order_occurrences DESC) AS row_number
    FROM
        items_per_order
)

SELECT item_count AS mode
FROM cte
WHERE row_number = 1
ORDER BY item_count;
*/


/*
-- this isn't right
-- but I think it may be possible to use MAX 

SELECT item_count AS mode
FROM items_per_order
WHERE order_occurrences = (SELECT MAX(order_occurrences) FROM items_per_order GROUP BY item_count LIMIT 1)
ORDER BY item_count;
*/
