-- Найти  объекты,  значение  некоторого  показателя  которых превышает  среднее  значение  по соответствующей группе.

SELECT
    a.account_id,
    a.account_number,
    a.account_type,
    a.currency,
    a.balance,
    ROUND(
        (
            SELECT AVG(a2.balance)
            FROM accounts AS a2
            WHERE a2.status = 'active'
                AND a2.currency = a.currency
        ),
        2
    ) AS average_currency_balance

FROM accounts AS a

WHERE a.status = 'active'
    AND a.balance > (
        SELECT AVG(a2.balance)
        FROM accounts AS a2
        WHERE a2.status = 'active'
            AND a2.currency = a.currency
    )

ORDER BY
    a.currency,
    a.balance DESC;