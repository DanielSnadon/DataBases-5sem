SELECT
    transaction_id,
    transaction_type,
    sender_account_id,
    receiver_account_id
FROM transactions
WHERE sender_account_id IS NULL
    OR receiver_account_id IS NULL
ORDER BY transaction_id;

SELECT DISTINCT
    account_type,
    currency
FROM accounts
ORDER BY account_type, currency;
