WITH cte AS 
(SELECT *, GENERATE_SERIES(1,num_users,1) AS abc FROM search_frequency)

SELECT ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY searches)::DECIMAL, 1) AS median
FROM cte;

-- There is no function for median in SQL
-- Alternative is a recursive CTE
-- GENERATE_SERIES -> For each number, it starts from 1
-- i.e. 3 threes -> 3-1, 3-2, 3-3 

-- https://www.sisense.com/blog/medians-in-sql/
-- This article uses AVG to get median, but I couldn't replicate it -> median was 5 versus 3.5
-- https://wiki.postgresql.org/wiki/Aggregate_Median link in the article recommends PERCENTILE_CONT
-- different SQL variants may offer better way than postgres
