SELECT
    transaction_date,
    user_id,
    COUNT(*) AS purchase_count
FROM user_transactions
WHERE (user_id, transaction_date) IN (
    SELECT
        user_id,
        MAX(transaction_date)
    FROM user_transactions
    GROUP BY user_id
)
GROUP BY transaction_date, user_id
ORDER BY transaction_date;