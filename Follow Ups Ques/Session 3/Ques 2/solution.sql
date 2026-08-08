SELECT COUNT(DISTINCT policy_holder_id) AS policy_holder_count
FROM (
    SELECT
        policy_holder_id,
        call_date,
        LAG(call_date) OVER (
            PARTITION BY policy_holder_id
            ORDER BY call_date
        ) AS previous_call_date
    FROM callers
) t
WHERE call_date <= previous_call_date + INTERVAL '7 days';