SELECT 
    user_id, 
    CASE 
        WHEN daily_pay.paid IS NULL THEN 'CHURN' 
        WHEN advertiser.user_id IS NULL THEN 'NEW' 
        WHEN advertiser.status != 'CHURN' AND daily_pay.paid IS NOT NULL THEN 'EXISTING' 
        WHEN advertiser.status = 'CHURN' AND daily_pay.paid IS NOT NULL THEN 'RESURRECT' 
    END AS new_status 
FROM advertiser
FULL JOIN daily_pay
USING(user_id)
ORDER BY user_id;
