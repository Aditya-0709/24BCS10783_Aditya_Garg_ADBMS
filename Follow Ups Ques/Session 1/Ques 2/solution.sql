SELECT COUNT(*) AS payment_count
FROM (
    SELECT
        *,
        LAG(transaction_timestamp) OVER (
            PARTITION BY merchant_id, credit_card_id, amount
            ORDER BY transaction_timestamp
        ) AS previous_time
    FROM transactions
) t
WHERE transaction_timestamp <= previous_time + INTERVAL '10 minutes';