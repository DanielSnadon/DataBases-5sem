BEGIN;

INSERT INTO clients (
    first_name,
    last_name,
    birth_date,
    passport,
    phone,
    email
)
VALUES
    (
        'Lionel',
        'Messi',
        '1987-06-24',
        '4001-100001',
        '+79990000001',
        'lionel.messi@example.com'
    ),
    (
        'Cristiano',
        'Ronaldo',
        '1985-02-05',
        '4001-100002',
        '+79990000002',
        'cristiano.ronaldo@example.com'
    ),
    (
        'Michael',
        'Jackson',
        '1958-08-29',
        '4001-100003',
        '+79990000003',
        'michael.jackson@example.com'
    ),
    (
        'Donald',
        'Trump',
        '1946-06-14',
        '4001-100004',
        '+79990000004',
        'donald.trump@example.com'
    );

INSERT INTO offices (
    office_code,
    name,
    city,
    address
)
VALUES
    (
        'MSK01',
        'Central office',
        'Moscow',
        'Tverskaya Street, 10'
    ),
    (
        'SPB01',
        'Nevsky office',
        'Saint Petersburg',
        'Nevsky Prospect, 25'
    ),
    (
        'KZN01',
        'Kazan office',
        'Kazan',
        'Baumana Street, 15'
    );

INSERT INTO accounts (
    client_id,
    office_id,
    account_number,
    account_type,
    currency,
    balance,
    status
)
VALUES
    (1, 1, '40817810000000000001', 'current', 'RUB', 85000.00, 'active'),
    (1, 1, '40817810000000000002', 'savings', 'RUB', 150000.00, 'active'),
    (2, 2, '40817840000000000003', 'current', 'USD', 2500.00, 'active'),
    (3, 2, '40817810000000000004', 'current', 'RUB', 42000.00, 'blocked'),
    (4, 3, '40817850000000000005', 'savings', 'EUR', 10000.00, 'active');

INSERT INTO cards (
    account_id,
    card_number,
    payment_system,
    issued_at,
    expires_on,
    status
)
VALUES
    (1, '2200000000000001', 'MIR', '2025-01-15', '2029-01-31', 'active'),
    (2, '2200000000000002', 'MIR', '2025-03-10', '2029-03-31', 'active'),
    (3, '4000000000000003', 'VISA', '2024-07-20', '2028-07-31', 'active'),
    (4, '5000000000000004', 'MASTERCARD', '2023-05-12', '2027-05-31', 'blocked');

INSERT INTO transactions (
    sender_account_id,
    receiver_account_id,
    transaction_type,
    amount,
    description
)
VALUES
    (1, 2, 'transfer', 1500.00, 'Transfer between clients'),
    (NULL, 3, 'deposit', 1000.00, 'Cash deposit'),
    (2, NULL, 'withdrawal', 2000.00, 'Cash withdrawal'),
    (4, 1, 'transfer', 700.00, 'Payment transfer');

COMMIT;