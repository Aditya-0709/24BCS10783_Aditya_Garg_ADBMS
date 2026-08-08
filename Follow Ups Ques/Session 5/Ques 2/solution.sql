WITH weekly_touches AS (
    SELECT DISTINCT
        contact_id,
        DATE_TRUNC('week', event_date) AS week_start,
        MAX(
            CASE
                WHEN event_type = 'trial_request' THEN 1
                ELSE 0
            END
        ) OVER (
            PARTITION BY contact_id, DATE_TRUNC('week', event_date)
        ) AS has_trial
    FROM marketing_touches
),

numbered_weeks AS (
    SELECT
        contact_id,
        week_start,
        has_trial,
        ROW_NUMBER() OVER (
            PARTITION BY contact_id
            ORDER BY week_start
        ) AS rn
    FROM weekly_touches
),

streaks AS (
    SELECT
        contact_id,
        week_start,
        has_trial,
        week_start - (rn * INTERVAL '1 week') AS grp
    FROM numbered_weeks
),

valid_contacts AS (
    SELECT
        contact_id
    FROM streaks
    GROUP BY contact_id, grp
    HAVING COUNT(*) >= 3
       AND MAX(has_trial) = 1
)

SELECT DISTINCT
    c.email
FROM crm_contacts c
JOIN valid_contacts v
    ON c.contact_id = v.contact_id;