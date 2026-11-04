-- 1 - Расчёт количественных показателей по группам. 

SELECT
    currency,
    COUNT(*) AS accounts_count,
    SUM(balance) AS total_balance,
    ROUND(AVG(balance), 2) AS average_balance,
    MIN(balance) AS minimum_balance,
    MAX(balance) AS maximum_balance

FROM accounts

GROUP BY currency

ORDER BY currency;

-- 2 - Расчёт суммарных или средних показателей с фильтрацией групп через HAVING.

SELECT
    o.office_id,
    o.office_code,
    o.name,
    o.city,

    COUNT(*) AS accounts_count,
    SUM(a.balance) AS total_rub_balance,
    ROUND(AVG(a.balance), 2) AS average_rub_balance

FROM offices AS o

JOIN accounts AS a
    ON a.office_id = o.office_id

WHERE a.status = 'active'
    AND a.currency = 'RUB'

GROUP BY
    o.office_id,
    o.office_code,
    o.name,
    o.city

HAVING SUM(a.balance) > 100000

ORDER BY total_rub_balance DESC;

-- 3 - Сравнение показателей между категориями объектов или временными периодами. 

SELECT
    DATE_TRUNC('month', t.created_at)::DATE AS operation_month,

    COALESCE(
        sa.currency,
        ra.currency
    ) AS currency,

    t.transaction_type,

    COUNT(*) AS operations_count,
    SUM(t.amount) AS total_amount,
    ROUND(AVG(t.amount), 2) AS average_amount,
    MIN(t.amount) AS minimum_amount,
    MAX(t.amount) AS maximum_amount

FROM transactions AS t

LEFT JOIN accounts AS sa
    ON sa.account_id = t.sender_account_id

LEFT JOIN accounts AS ra
    ON ra.account_id = t.receiver_account_id

WHERE t.status = 'completed'

GROUP BY
    DATE_TRUNC('month', t.created_at)::DATE,
    COALESCE(sa.currency, ra.currency),
    t.transaction_type

ORDER BY
    operation_month,
    currency,
    t.transaction_type;
