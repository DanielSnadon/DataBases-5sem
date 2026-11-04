SELECT
    COUNT(*) AS rub_accounts,
    SUM(balance) AS total_rub_balance,
    AVG(balance) AS average_rub_balance,
    MIN(balance) AS minimum_rub_balance,
    MAX(balance) AS maximum_rub_balance
FROM accounts
WHERE currency = 'RUB';