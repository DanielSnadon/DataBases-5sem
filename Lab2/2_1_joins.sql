-- 1) Получение подробной информации об операциях и связанных сущностях.
-- (Подробная информация о транзакциях, отправителях и получателях)

SELECT
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.status,
    t.created_at,
    sa.account_number AS sender_account,
    sc.first_name AS sender_first_name,
    sc.last_name AS sender_last_name,
    ra.account_number AS receiver_account,
    rc.first_name AS receiver_first_name,
    rc.last_name AS receiver_last_name

FROM transactions AS t

LEFT JOIN accounts AS sa
    ON sa.account_id = t.sender_account_id

LEFT JOIN clients AS sc
    ON sc.client_id = sa.client_id

LEFT JOIN accounts AS ra
    ON ra.account_id = t.receiver_account_id

LEFT JOIN clients AS rc
    ON rc.client_id = ra.client_id

ORDER BY
    t.created_at,
    t.transaction_id;

-- 2) Выявление объектов, у которых отсутствуют связанные записи.
-- (Счета без карт)

SELECT
    c.client_id,
    c.first_name,
    c.last_name,
    a.account_id,
    a.account_number,
    a.account_type,
    a.currency,
    a.status AS account_status

FROM clients AS c

JOIN accounts AS a
    ON a.client_id = c.client_id

LEFT JOIN cards AS cr
    ON cr.account_id = a.account_id

WHERE cr.card_id IS NULL

ORDER BY a.account_id;

-- Получение перечня объектов, удовлетворяющих нескольким взаимосвязанным условиям.
-- (Активные рублёвые счета с действующими картами MIR)

SELECT
    c.client_id,
    c.first_name,
    c.last_name,
    a.account_id,
    a.account_number,
    a.account_type,
    a.balance,
    a.status AS account_status,
    cr.card_id,
    cr.card_number,
    cr.payment_system,
    cr.status AS card_status

FROM clients AS c

JOIN accounts AS a
    ON a.client_id = c.client_id

JOIN cards AS cr
    ON cr.account_id = a.account_id

WHERE a.status = 'active'
    AND a.currency = 'RUB'
    AND a.balance > 0
    AND cr.status = 'active'
    AND cr.payment_system = 'MIR'

ORDER BY
    a.balance DESC,
    a.account_id;