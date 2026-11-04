-- Реализовать запрос с NOT EXISTS, выявляющий объекты, для которых отсутствует определённое событие или связанная запись.

SELECT
    a.account_id,
    a.account_number,
    a.account_type,
    a.currency,
    a.balance,
    a.status AS account_status,
    c.client_id,
    c.first_name,
    c.last_name

FROM accounts AS a

JOIN clients AS c
    ON c.client_id = a.client_id

WHERE NOT EXISTS (
    SELECT 1

    FROM transactions AS t

    WHERE t.sender_account_id = a.account_id
        OR t.receiver_account_id = a.account_id
)

ORDER BY a.account_id;