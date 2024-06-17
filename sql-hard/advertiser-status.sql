/*
-- Need LEFT JOIN to get null values
-- but this isn't enough as you miss payers present in advertiser
-- and not found in daily_pay 
-- fitdata is missing
-- need a case to look for NULL as well? Yes.
-- changing to FULL JOIN -> you get all data, but fitdata's new_status is NULL 

SELECT 
    user_id,
    CASE
        WHEN status = 'NEW' AND EXISTS (SELECT 1 FROM daily_pay WHERE daily_pay.user_id = advertiser.user_id) THEN 'EXISTING'
        WHEN status = 'NEW' THEN 'CHURN'
        WHEN status = 'EXISTING' AND EXISTS (SELECT 1 FROM daily_pay WHERE daily_pay.user_id = advertiser.user_id) THEN 'EXISTING'
        WHEN status = 'EXISTING' THEN 'CHURN'
        WHEN status = 'CHURN' AND EXISTS (SELECT 1 FROM daily_pay WHERE daily_pay.user_id = advertiser.user_id) THEN 'RESURRECT'
        WHEN status = 'CHURN' THEN 'CHURN'
        WHEN status = 'RESURRECT' AND EXISTS (SELECT 1 FROM daily_pay WHERE daily_pay.user_id = advertiser.user_id) THEN 'EXISTING'
        WHEN status = 'RESURRECT' THEN 'CHURN'
    END AS new_status
FROM advertiser LEFT JOIN daily_pay USING(user_id);
*/

/*
-- change to FULL JOIN and add conditional to check for NULL status 

SELECT 
    user_id,
    CASE
        WHEN status = 'NEW' AND EXISTS (SELECT 1 FROM daily_pay WHERE daily_pay.user_id = advertiser.user_id) THEN 'EXISTING'
        WHEN status = 'NEW' THEN 'CHURN'
        WHEN status = 'EXISTING' AND EXISTS (SELECT 1 FROM daily_pay WHERE daily_pay.user_id = advertiser.user_id) THEN 'EXISTING'
        WHEN status = 'EXISTING' THEN 'CHURN'
        WHEN status = 'CHURN' AND EXISTS (SELECT 1 FROM daily_pay WHERE daily_pay.user_id = advertiser.user_id) THEN 'RESURRECT'
        WHEN status = 'CHURN' THEN 'CHURN'
        WHEN status = 'RESURRECT' AND EXISTS (SELECT 1 FROM daily_pay WHERE daily_pay.user_id = advertiser.user_id) THEN 'EXISTING'
        WHEN status = 'RESURRECT' THEN 'CHURN'
        WHEN status IS NULL THEN 'NEW'
    END AS new_status
FROM advertiser FULL JOIN daily_pay USING(user_id);
*/

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
USING(user_id);
