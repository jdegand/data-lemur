WITH consecutive_events_cte AS (
  SELECT 
    event_id,
    contact_id,
    event_type,
    DATE_TRUNC('week', event_date) AS event_week,
    LAG(DATE_TRUNC('week', event_date)) OVER (
      PARTITION BY contact_id ORDER BY event_date) AS lag_event_week,
    LEAD(DATE_TRUNC('week', event_date)) OVER (
      PARTITION BY contact_id ORDER BY event_date) AS lead_event_week
  FROM marketing_touches
)
SELECT DISTINCT c.email
FROM consecutive_events_cte ce
JOIN crm_contacts c 
  ON c.contact_id = ce.contact_id
WHERE (ce.lag_event_week = ce.event_week - interval '1 week'
       OR ce.lead_event_week = ce.event_week + interval '1 week')
  AND ce.contact_id IN (
        SELECT contact_id 
        FROM marketing_touches 
        WHERE event_type = 'trial_request'
      );

"""
WITH touches AS (
    SELECT 
        mt.contact_id,
        DATE_TRUNC('week', mt.event_date)::date AS event_week,
        LAG(DATE_TRUNC('week', mt.event_date)::date) OVER (
            PARTITION BY mt.contact_id ORDER BY mt.event_date) AS lag_week,
        LEAD(DATE_TRUNC('week', mt.event_date)::date) OVER (
            PARTITION BY mt.contact_id ORDER BY mt.event_date) AS lead_week
    FROM marketing_touches mt
    WHERE EXISTS (
        SELECT 1 
        FROM marketing_touches t 
        WHERE t.contact_id = mt.contact_id 
          AND t.event_type = 'trial_request'
    )
)
SELECT DISTINCT c.email
FROM touches t
JOIN crm_contacts c 
  ON c.contact_id = t.contact_id
WHERE t.lag_week = t.event_week - interval '1 week'
   OR t.lead_week = t.event_week + interval '1 week'
ORDER BY c.email;
"""
