WITH numbered_rows AS (
    SELECT 
        measurement_time::date AS measurement_day,
        measurement_value,
        row_number() OVER(PARTITION BY measurement_time::date ORDER BY measurement_time ASC) AS row_num
    FROM measurements
)
SELECT 
    measurement_day,
    SUM(CASE WHEN row_num % 2 != 0 THEN measurement_value ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN row_num % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM numbered_rows
GROUP BY measurement_day
ORDER BY measurement_day;
