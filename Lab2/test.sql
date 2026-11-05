-- Сумма всех счетов каждой валюты

-- VAR 1
-- SELECT
--     client_id,
--     currency,
--     SUM(balance) AS total_balance
-- FROM accounts
-- GROUP BY
--     client_id,
--     currency
-- ORDER BY
--     client_id,
--     currency;

-- VAR 2
-- SELECT
--     c.client_id,
--     c.first_name,
--     c.last_name,
--     a.currency,
--     SUM(a.balance) AS total_balance

-- FROM clients AS c

-- JOIN accounts AS a
--     ON a.client_id = c.client_id

-- GROUP BY
--     c.client_id,
--     c.first_name,
--     c.last_name,
--     a.currency

-- ORDER BY
--     c.client_id,
--     a.currency;

-- Сумма по операциям

-- WITH client_operations AS (
--     SELECT DISTINCT
--         a.client_id,
--         a.currency,
--         t.transaction_id,
--         t.amount
--     FROM accounts AS a

--     JOIN transactions AS t
--         ON t.sender_account_id = a.account_id
--         OR t.receiver_account_id = a.account_id

--     WHERE t.status = 'completed'
-- )

-- SELECT
--     client_id,
--     currency,
--     COUNT(*) AS operations_count,
--     SUM(amount) AS operations_total
-- FROM client_operations
-- GROUP BY
--     client_id,
--     currency
-- ORDER BY
--     client_id,
--     currency;

-- Порядок в коде          Логический порядок
--   SELECT                    FROM/JOIN
--    FROM                       WHERE
--    JOIN                     GROUP BY
--    WHERE                     HAVING
--  GROUP BY                    SELECT
--   HAVING                    ORDER BY
--    ORDER


SELECT
    transaction_type,
    COUNT(*) AS operations_count,
    SUM(amount) AS operations_total
FROM transactions
WHERE status = 'completed'
GROUP BY transaction_type
ORDER BY transaction_type;