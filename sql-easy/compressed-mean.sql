SELECT ROUND(SUM(item_count * order_occurrences) / SUM(order_occurrences) * 10) / 10 AS mean
FROM items_per_order;

-- tried to use Round(,1) -> but it does not work because of double precision error 

/*

-- with many decimals

SELECT (SUM(item_count * order_occurrences) / SUM(order_occurrences)) as mean FROM items_per_order;
*/
