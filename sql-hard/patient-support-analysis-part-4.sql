WITH long_calls AS (
    -- Step 1: filter only calls longer than 300 seconds
    SELECT
        policy_holder_id,
        call_date
    FROM callers
    WHERE call_duration_secs > 300
),
monthly_counts AS (
    -- Step 2: aggregate counts per year/month
    SELECT
        EXTRACT(YEAR FROM call_date) AS yr,
        EXTRACT(MONTH FROM call_date) AS mth,
        COUNT(*) AS call_count
    FROM long_calls
    GROUP BY EXTRACT(YEAR FROM call_date), EXTRACT(MONTH FROM call_date)
),
growth_calc AS (
    -- Step 3: use LAG to get previous month’s count
    SELECT
        yr,
        mth,
        call_count,
        LAG(call_count) OVER (ORDER BY yr, mth) AS prev_count
    FROM monthly_counts
)
-- Step 4: compute growth percentage
SELECT
    yr,
    mth,
    ROUND(
        CASE 
            WHEN prev_count IS NULL OR prev_count = 0 THEN NULL
            ELSE ((call_count - prev_count) * 100.0 / prev_count)
        END, 1
    ) AS long_calls_growth_pct
FROM growth_calc
ORDER BY yr, mth;

"""
WITH monthly_counts AS (
    -- Aggregate directly by month using DATE_TRUNC
    SELECT
        DATE_TRUNC('month', call_date) AS month_start,
        COUNT(*) AS call_count
    FROM callers
    WHERE call_duration_secs > 300
    GROUP BY DATE_TRUNC('month', call_date)
)
SELECT
    EXTRACT(YEAR FROM month_start) AS yr,
    EXTRACT(MONTH FROM month_start) AS mth,
    ROUND(
        (call_count - LAG(call_count) OVER (ORDER BY month_start)) * 100.0 /
        NULLIF(LAG(call_count) OVER (ORDER BY month_start), 0),
        1
    ) AS long_calls_growth_pct
FROM monthly_counts
ORDER BY month_start;
"""
