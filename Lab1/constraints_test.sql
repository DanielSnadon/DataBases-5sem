INSERT INTO clients (
    first_name,
    last_name,
    birth_date,
    passport,
    phone,
    email
)
VALUES (
    'Test',
    'Client',
    '2000-01-01',
    '4001-100001',
    '+79991111111',
    'test.client@example.com'
);



UPDATE accounts
SET balance = -100.00
WHERE account_id = 1;



UPDATE accounts
SET currency = 'WWW'
WHERE account_id = 1;



INSERT INTO accounts (
    client_id,
    office_id,
    account_number,
    account_type,
    currency,
    balance,
    status
)
VALUES (
    9999,
    1,
    '40817810000000000999',
    'current',
    'RUB',
    1000.00,
    'active'
);



INSERT INTO transactions (
    sender_account_id,
    receiver_account_id,
    transaction_type,
    amount,
    description
)
VALUES (
    1,
    1,
    'transfer',
    500.00,
    'Invalid transfer'
);



INSERT INTO offices (
    office_code,
    name,
    city,
    address
)
VALUES (
    'TEST01',
    'Test office',
    'Moscow',
    'Tverskaya Street, 10'
);