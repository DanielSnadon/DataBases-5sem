-- Статистика завершённых операций отдельно по каждому месяцу и каждой валюте

WITH completed_operations AS (
    SELECT
        t.transaction_id,
        DATE_TRUNC('month', t.created_at)::DATE AS operation_month,
        COALESCE(sender_account.currency,
                 receiver_account.currency) AS currency,
        t.transaction_type,
        t.amount

    FROM transactions AS t

    LEFT JOIN accounts AS sender_account
        ON sender_account.account_id = t.sender_account_id

    LEFT JOIN accounts AS receiver_account
        ON receiver_account.account_id = t.receiver_account_id

    WHERE t.status = 'completed'
),

monthly_statistics AS (
    SELECT
        operation_month,
        currency,

        COUNT(*) AS operations_count,

        SUM(
            CASE
                WHEN transaction_type = 'deposit'
                    THEN amount
                ELSE 0
            END
        ) AS deposit_total,

        SUM(
            CASE
                WHEN transaction_type = 'withdrawal'
                    THEN amount
                ELSE 0
            END
        ) AS withdrawal_total,

        SUM(
            CASE
                WHEN transaction_type = 'transfer'
                    THEN amount
                ELSE 0
            END
        ) AS transfer_total,

        ROUND(AVG(amount), 2) AS average_amount,
        MIN(amount) AS minimum_amount,
        MAX(amount) AS maximum_amount

    FROM completed_operations

    GROUP BY
        operation_month,
        currency
)

SELECT
    operation_month AS "Месяц",
    currency AS "Валюта",
    operations_count AS "Кол-во операций",
    deposit_total AS "Сумма вводов",
    withdrawal_total AS "Сумма выводов",
    transfer_total AS "Сумма переводов",
    average_amount AS "Средняя сумма",
    minimum_amount AS "Минимальная сумма",
    maximum_amount AS "Максимальная сумма",

    deposit_total - withdrawal_total AS "Прибыль банка"

FROM monthly_statistics

ORDER BY
    operation_month,
    currency;