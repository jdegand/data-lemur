SELECT emails.user_id
FROM texts
INNER JOIN emails ON texts.email_id = emails.email_id
WHERE signup_action = 'Confirmed' 
AND date_part('day', texts.action_date) = date_part('day', emails.signup_date) + 1;

/*
-- This also works

SELECT emails.user_id
FROM texts
INNER JOIN emails ON texts.email_id = emails.email_id
WHERE signup_action = 'Confirmed' 
AND texts.action_date = emails.signup_date + INTERVAL '1 day';
*/
