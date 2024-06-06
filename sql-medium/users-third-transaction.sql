WITH numbered_rows AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY user_id) AS row_num
    FROM transactions
)
SELECT user_id, spend, transaction_date
FROM numbered_rows
WHERE row_num % 3 = 0;

/*
WITH numbered_rows AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY user_id) AS row_num
    FROM transactions
)
SELECT * 
FROM numbered_rows
WHERE row_num % 3 = 0;

-- if you use SELECT *, you can see the row numbers as well
*/
