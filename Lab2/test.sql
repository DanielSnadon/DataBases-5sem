SELECT
    c.client_id,
    c.first_name,
    c.last_name,
    a.account_id,
    a.account_number,
    a.account_type,
    a.currency
FROM clients AS c
JOIN accounts AS a
    ON a.client_id = c.client_id
LEFT JOIN cards AS cr
    ON cr.account_id = a.account_id
WHERE cr.card_id IS NULL
ORDER BY a.account_id;