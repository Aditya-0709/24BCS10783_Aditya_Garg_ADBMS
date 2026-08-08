SELECT
    a.age_bucket,
    ROUND(
        SUM(CASE WHEN act.activity_type = 'send'
                 THEN act.time_spent ELSE 0 END)
        * 100.0
        /
        SUM(CASE WHEN act.activity_type IN ('send', 'open')
                 THEN act.time_spent ELSE 0 END),
        2
    ) AS send_perc,

    ROUND(
        SUM(CASE WHEN act.activity_type = 'open'
                 THEN act.time_spent ELSE 0 END)
        * 100.0
        /
        SUM(CASE WHEN act.activity_type IN ('send', 'open')
                 THEN act.time_spent ELSE 0 END),
        2
    ) AS open_perc

FROM activities act
JOIN age_breakdown a
    ON act.user_id = a.user_id
WHERE act.activity_type IN ('send', 'open')
GROUP BY a.age_bucket;