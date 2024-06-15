WITH max_cte AS (
    SELECT 
        ticker, 
        open, 
        TO_CHAR(date, 'Mon-YYYY') AS months
    FROM stock_prices
    WHERE open IN (
        SELECT MAX(open)
        FROM stock_prices
        GROUP BY ticker
    )
), 
min_cte AS (
    SELECT 
        ticker, 
        open, 
        TO_CHAR(date, 'Mon-YYYY') AS months
    FROM stock_prices
    WHERE open IN (
        SELECT MIN(open)
        FROM stock_prices
        GROUP BY ticker
    )
)
SELECT 
    A.ticker, 
    A.months AS highest_mth, 
    A.open AS highest_open, 
    B.months AS lowest_mth, 
    B.open AS lowest_open
FROM max_cte A
JOIN min_cte B USING(ticker)
ORDER BY A.ticker;

-- The "IN" operator is used to specify multiple values in a WHERE clause.

/*
SELECT TO_CHAR(date, 'Mon-YYYY') as lowest_mth
FROM stock_prices
WHERE open = (SELECT MIN(open) FROM stock_prices);
*/
