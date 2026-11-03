BEGIN;

-- (1) Добавление новой сущности и связанных с ней записей с помощью INSERT.

INSERT INTO clients (
    first_name,
    last_name,
    birth_date,
    passport,
    phone,
    email
)
VALUES (
    'Anton',
    'Ivanov',
    '1994-08-17',
    '4001-200001',
    '+79991000001',
    'anton.ivanov@mail.com'
)
RETURNING
    client_id,
    first_name,
    last_name,
    passport;

INSERT INTO accounts (
    client_id,
    office_id,
    account_number,
    account_type,
    currency,
    balance,
    status,
    opened_at
)
VALUES (
    (
        SELECT client_id
        FROM clients
        WHERE passport = '4001-200001'
    ),
    (
        SELECT office_id
        FROM offices
        WHERE office_code = 'MSK01'
    ),
    '40817810000000000101',
    'current',
    'RUB',
    5000.00,
    'active',
    '2026-11-03'
)
RETURNING
    account_id,
    client_id,
    account_number,
    balance;

INSERT INTO cards (
    account_id,
    card_number,
    payment_system,
    issued_at,
    expires_on,
    status
)
VALUES (
    (
        SELECT account_id
        FROM accounts
        WHERE account_number = '40817810000000000101'
    ),
    '2200000000000101',
    'MIR',
    '2026-11-03',
    '2030-11-30',
    'active'
)
RETURNING
    card_id,
    account_id,
    card_number,
    status;

INSERT INTO transactions (
    sender_account_id,
    receiver_account_id,
    transaction_type,
    amount,
    description,
    created_at,
    status
)
VALUES (
    NULL,
    (
        SELECT account_id
        FROM accounts
        WHERE account_number = '40817810000000000101'
    ),
    'deposit',
    5000.00,
    'Initial account deposit',
    '2026-11-03 12:00:00+03',
    'completed'
)
RETURNING
    transaction_id,
    transaction_type,
    amount,
    status;

-- (2) Изменение состояния существующей операции через UPDATE.

UPDATE transactions
SET status = 'completed'
WHERE transaction_type = 'deposit'
    AND status = 'pending'
    AND receiver_account_id = (
        SELECT account_id
        FROM accounts
        WHERE account_number = '40817810000000000009'
    )
    AND created_at = '2026-07-28 16:45:00+03'
RETURNING
    transaction_id,
    transaction_type,
    amount,
    created_at,
    status;

-- (3) Массовое изменение нескольких записей по содержательному условию.

UPDATE transactions
SET status = 'cancelled'
WHERE status = 'pending'
    AND created_at < '2026-10-01 00:00:00+03'
RETURNING
    transaction_id,
    transaction_type,
    amount,
    created_at,
    status;

-- (4) Удаление записи с помощью DELETE с учётом существующих ограничений целостности. 

DELETE FROM cards
WHERE card_number = '5000000000000021'
RETURNING
    card_id,
    account_id,
    card_number,
    payment_system,
    status;

COMMIT;

-- (5) Демонстрацию отмены изменений с помощью ROLLBACK.

BEGIN;

UPDATE accounts
SET balance = balance + 12345.67
WHERE account_number = '40817810000000000006'
RETURNING
    account_id,
    account_number,
    balance;

ROLLBACK;

SELECT
    account_number,
    balance
FROM accounts
WHERE account_number = '40817810000000000006';

