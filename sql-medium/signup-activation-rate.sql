SELECT ROUND(AVG(CAST(signup_action = 'Confirmed' AS INT)) * 100 / 100, 2) AS confirm_rate 
FROM texts 
JOIN emails USING(email_id);

-- doesn't matter what JOIN you use (INNER, LEFT, RIGHT)

-- In SQL, the `USING` clause can be used to replace the `ON` clause in a join statement when you are joining tables based on a single column that has the same name in both tables.
