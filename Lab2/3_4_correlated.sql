-- Реализовать запрос, в котором условие внутреннего запроса зависит от текущей строки внешнего запроса.

SELECT
    c.client_id,
    c.first_name,
    c.last_name,
    (
        SELECT COUNT(*)

        FROM accounts AS a

        WHERE a.client_id = c.client_id
    ) AS accounts_count,
    (
        SELECT COUNT(DISTINCT t.transaction_id)

        FROM accounts AS a

        JOIN transactions AS t
            ON t.sender_account_id = a.account_id
            OR t.receiver_account_id = a.account_id

        WHERE a.client_id = c.client_id
            AND t.status = 'completed'
    ) AS completed_operations_count

FROM clients AS c

ORDER BY
    completed_operations_count DESC,
    c.client_id;