-- Реализовать  запрос  с  EXISTS,  выявляющий  объекты,  для  которых  существует  хотя  бы  одна связанная запись, удовлетворяющая дополнительному условию.

SELECT
    c.client_id,
    c.first_name,
    c.last_name,
    c.phone,
    c.email

FROM clients AS c

WHERE EXISTS (
    SELECT 1

    FROM accounts AS a

    JOIN transactions AS t
        ON t.sender_account_id = a.account_id
        OR t.receiver_account_id = a.account_id

    WHERE a.client_id = c.client_id
        AND t.status = 'completed'
        AND t.amount >= 10000
)

ORDER BY c.client_id;