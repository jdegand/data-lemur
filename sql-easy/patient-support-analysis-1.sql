SELECT COUNT(*) AS policy_holder_count
FROM (
    SELECT COUNT(*)
    FROM callers
    GROUP BY policy_holder_id
    HAVING COUNT(case_id) >= 3
) AS subquery;
