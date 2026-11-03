BEGIN;

-- 1. Clients

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
        'Taylor',
        'Swift',
        '1989-12-13',
        '4001-100005',
        '+79990000005',
        'taylor.swift@example.com'
    ),
    (
        'Keanu',
        'Reeves',
        '1964-09-02',
        '4001-100006',
        '+79990000006',
        'keanu.reeves@example.com'
    ),
    (
        'Ronald',
        'Mcdonald',
        '1990-04-15',
        '4001-100007',
        '+79990000007',
        'mcdonalds@example.com'
    ),
    (
        'Elon',
        'Musk',
        '1965-04-04',
        '4001-100008',
        '+79990000008',
        'robert.downey@example.com'
    ),
    (
        'Vladimir',
        'Putin',
        '1988-05-05',
        '4001-100009',
        '+79990000009',
        'vlad.putin@example.com'
    ),
    (
        'Ryan',
        'Gosling',
        '1980-11-12',
        '4001-100010',
        '+79990000010',
        'ryan.gosling@example.com'
    ),
    (
        'Dmitry',
        'Stepanov',
        '1990-07-02',
        '4001-100011',
        '+79990000011',
        'dmitry.stepanov@example.com'
    ),
    (
        'Cillian',
        'Murphy',
        '1976-05-25',
        '4001-100012',
        '+79990000012',
        'cillian.murphy@example.com'
    ),
    (
        'Oleg',
        'Gazmanov',
        '1986-03-28',
        '4001-100013',
        '+79990000013',
        'oleg.gazmanov@example.com'
    ),
    (
        'Valentin',
        'Zaitsev',
        '1976-07-19',
        '4001-100014',
        '+79990000014',
        'zzz@example.com'
    ),
    (
        'Iosif',
        'Stalin',
        '2001-12-18',
        '4001-100015',
        '+79990000015',
        'iosif.stalin@example.com'
    ),
    (
        'Leonid',
        'Kanevski',
        '1975-04-02',
        '4001-100016',
        '+79990000016',
        'Leonid.Kanevski@example.com'
    );

-- 2. Offices

INSERT INTO offices (
    office_code,
    name,
    city,
    address
)
VALUES
    (
        'NSK01',
        'Siberian office',
        'Novosibirsk',
        'Krasny Prospekt, 25'
    ),
    (
        'EKB01',
        'Ural office',
        'Yekaterinburg',
        'Lenina Prospekt, 50'
    ),
    (
        'SCH01',
        'Black Sea office',
        'Sochi',
        'Kurortny Prospekt, 20'
    );

-- 3. Accounts

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
VALUES
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100005'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'MSK01'
        ),
        '40817810000000000006',
        'current',
        'RUB',
        200000.00,
        'active',
        '2026-01-15'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100006'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'SPB01'
        ),
        '40817840000000000007',
        'savings',
        'USD',
        15000.00,
        'active',
        '2026-02-10'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100007'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'EKB01'
        ),
        '40817850000000000008',
        'current',
        'EUR',
        3500.00,
        'active',
        '2026-03-20'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100008'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'NSK01'
        ),
        '40817810000000000009',
        'current',
        'RUB',
        0.00,
        'active',
        '2026-04-05'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100009'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'KZN01'
        ),
        '40817810000000000010',
        'savings',
        'RUB',
        98000.00,
        'active',
        '2026-05-18'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100010'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'SCH01'
        ),
        '40817840000000000011',
        'current',
        'USD',
        1200.00,
        'blocked',
        '2026-06-02'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100011'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'EKB01'
        ),
        '40817850000000000012',
        'savings',
        'EUR',
        22000.00,
        'active',
        '2026-06-17'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100012'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'NSK01'
        ),
        '40817810000000000013',
        'current',
        'RUB',
        45000.00,
        'active',
        '2026-07-01'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100013'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'MSK01'
        ),
        '40817840000000000014',
        'current',
        'USD',
        8500.00,
        'active',
        '2026-07-16'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100014'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'SPB01'
        ),
        '40817810000000000015',
        'savings',
        'RUB',
        0.00,
        'closed',
        '2026-08-03'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100015'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'KZN01'
        ),
        '40817810000000000016',
        'current',
        'RUB',
        12500.00,
        'active',
        '2026-08-19'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100016'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'SCH01'
        ),
        '40817850000000000017',
        'current',
        'EUR',
        7400.00,
        'active',
        '2026-09-04'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100005'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'EKB01'
        ),
        '40817840000000000018',
        'savings',
        'USD',
        6000.00,
        'active',
        '2026-09-21'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100007'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'MSK01'
        ),
        '40817810000000000019',
        'savings',
        'RUB',
        50000.00,
        'active',
        '2026-10-07'
    ),
    (
        (
            SELECT client_id
            FROM clients
            WHERE passport = '4001-100006'
        ),
        (
            SELECT office_id
            FROM offices
            WHERE office_code = 'NSK01'
        ),
        '40817810000000000020',
        'current',
        'RUB',
        33000.00,
        'active',
        '2026-10-22'
    );

-- 4. Cards

INSERT INTO cards (
    account_id,
    card_number,
    payment_system,
    issued_at,
    expires_on,
    status
)
VALUES
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000006'
        ),
        '2200000000000006',
        'MIR',
        '2026-01-20',
        '2030-01-31',
        'active'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000007'
        ),
        '4000000000000007',
        'VISA',
        '2026-02-15',
        '2030-02-28',
        'active'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000008'
        ),
        '4000000000000008',
        'VISA',
        '2026-03-25',
        '2030-03-31',
        'active'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000009'
        ),
        '5000000000000009',
        'MASTERCARD',
        '2026-04-10',
        '2030-04-30',
        'active'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000010'
        ),
        '2200000000000010',
        'MIR',
        '2022-06-15',
        '2026-06-30',
        'expired'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000011'
        ),
        '4000000000000011',
        'VISA',
        '2026-06-10',
        '2030-06-30',
        'blocked'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000012'
        ),
        '5000000000000012',
        'MASTERCARD',
        '2026-06-22',
        '2030-06-30',
        'active'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000013'
        ),
        '2200000000000013',
        'MIR',
        '2026-07-05',
        '2030-07-31',
        'active'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000014'
        ),
        '4000000000000014',
        'VISA',
        '2026-07-20',
        '2030-07-31',
        'active'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000016'
        ),
        '2200000000000016',
        'MIR',
        '2026-08-24',
        '2030-08-31',
        'active'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000018'
        ),
        '4000000000000018',
        'VISA',
        '2026-09-25',
        '2030-09-30',
        'active'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000019'
        ),
        '2200000000000019',
        'MIR',
        '2026-10-10',
        '2030-10-31',
        'active'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000006'
        ),
        '5000000000000021',
        'MASTERCARD',
        '2026-02-01',
        '2030-02-28',
        'active'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000012'
        ),
        '2200000000000022',
        'MIR',
        '2026-07-01',
        '2030-07-31',
        'active'
    );

-- 5. Transactions

INSERT INTO transactions (
    sender_account_id,
    receiver_account_id,
    transaction_type,
    amount,
    description,
    created_at,
    status
)
VALUES
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000006'
        ),
        'deposit',
        50000.00,
        'Salary deposit',
        '2026-07-03 09:15:00+03',
        'completed'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000007'
        ),
        'deposit',
        2500.00,
        'Cashback deposit',
        '2026-07-08 14:30:00+03',
        'completed'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000008'
        ),
        'deposit',
        700.00,
        'Cash deposit',
        '2026-07-19 11:20:00+03',
        'completed'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000009'
        ),
        'deposit',
        100000.00,
        'Large cash deposit',
        '2026-07-28 16:45:00+03',
        'pending'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000010'
        ),
        'deposit',
        0.01,
        'Test deposit',
        '2026-08-04 10:00:00+03',
        'completed'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000012'
        ),
        'deposit',
        15000.00,
        'Salary deposit',
        '2026-08-12 09:10:00+03',
        'completed'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000013'
        ),
        'deposit',
        3500.00,
        'Cancelled cash deposit',
        '2026-08-21 18:25:00+03',
        'cancelled'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000014'
        ),
        'deposit',
        8000.00,
        NULL,
        '2026-09-02 12:40:00+03',
        'completed'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000016'
        ),
        'deposit',
        20000.00,
        'Cash deposit',
        '2026-09-10 15:35:00+03',
        'completed'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000018'
        ),
        'deposit',
        1200.00,
        'Mobile application deposit',
        '2026-09-18 20:05:00+03',
        'pending'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000019'
        ),
        'deposit',
        45000.00,
        'Salary deposit',
        '2026-09-26 08:50:00+03',
        'completed'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000006'
        ),
        'deposit',
        6000.00,
        'Repeated cash deposit',
        '2026-10-03 13:10:00+03',
        'completed'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000008'
        ),
        'deposit',
        300.00,
        NULL,
        '2026-10-14 17:45:00+03',
        'completed'
    ),
    (
        NULL,
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000011'
        ),
        'deposit',
        900.00,
        'Deposit under review',
        '2026-10-24 19:30:00+03',
        'pending'
    );

INSERT INTO transactions (
    sender_account_id,
    receiver_account_id,
    transaction_type,
    amount,
    description,
    created_at,
    status
)
VALUES
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000006'
        ),
        NULL,
        'withdrawal',
        3000.00,
        'ATM withdrawal',
        '2026-07-05 12:20:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000007'
        ),
        NULL,
        'withdrawal',
        500.00,
        'Cash withdrawal',
        '2026-07-15 18:40:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000008'
        ),
        NULL,
        'withdrawal',
        250.00,
        NULL,
        '2026-07-30 10:15:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000009'
        ),
        NULL,
        'withdrawal',
        5000.00,
        'Cancelled ATM withdrawal',
        '2026-08-06 21:10:00+03',
        'cancelled'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000010'
        ),
        NULL,
        'withdrawal',
        10000.00,
        'Office cash withdrawal',
        '2026-08-18 13:25:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000011'
        ),
        NULL,
        'withdrawal',
        400.00,
        'Withdrawal under review',
        '2026-08-27 19:50:00+03',
        'pending'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000012'
        ),
        NULL,
        'withdrawal',
        4500.00,
        'ATM withdrawal',
        '2026-09-05 16:30:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000013'
        ),
        NULL,
        'withdrawal',
        750.00,
        'Cash withdrawal',
        '2026-09-14 09:45:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000014'
        ),
        NULL,
        'withdrawal',
        2000.00,
        NULL,
        '2026-09-23 17:05:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000016'
        ),
        NULL,
        'withdrawal',
        120.00,
        'ATM withdrawal',
        '2026-10-02 11:35:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000018'
        ),
        NULL,
        'withdrawal',
        900.00,
        'Withdrawal awaiting confirmation',
        '2026-10-16 22:10:00+03',
        'pending'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000019'
        ),
        NULL,
        'withdrawal',
        9000.00,
        'Office cash withdrawal',
        '2026-10-28 15:55:00+03',
        'completed'
    );

INSERT INTO transactions (
    sender_account_id,
    receiver_account_id,
    transaction_type,
    amount,
    description,
    created_at,
    status
)
VALUES
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000006'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000001'
        ),
        'transfer',
        12000.00,
        'Payment transfer',
        '2026-07-02 10:30:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000001'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000002'
        ),
        'transfer',
        5000.00,
        'Transfer between own accounts',
        '2026-07-07 13:45:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000007'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000003'
        ),
        'transfer',
        300.00,
        'USD transfer',
        '2026-07-12 16:20:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000008'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000005'
        ),
        'transfer',
        450.00,
        'EUR transfer',
        '2026-07-20 11:05:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000013'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000006'
        ),
        'transfer',
        2500.00,
        'Transfer awaiting confirmation',
        '2026-07-27 19:40:00+03',
        'pending'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000002'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000010'
        ),
        'transfer',
        7000.00,
        'Savings transfer',
        '2026-08-01 09:25:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000003'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000014'
        ),
        'transfer',
        600.00,
        'Cancelled USD transfer',
        '2026-08-09 14:55:00+03',
        'cancelled'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000012'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000008'
        ),
        'transfer',
        1000.00,
        'EUR payment',
        '2026-08-15 12:10:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000016'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000019'
        ),
        'transfer',
        1500.00,
        'Private transfer',
        '2026-08-22 18:35:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000004'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000001'
        ),
        'transfer',
        700.00,
        'Transfer from blocked account',
        '2026-08-30 20:15:00+03',
        'cancelled'
    );

INSERT INTO transactions (
    sender_account_id,
    receiver_account_id,
    transaction_type,
    amount,
    description,
    created_at,
    status
)
VALUES
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000006'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000009'
        ),
        'transfer',
        8000.00,
        'RUB transfer',
        '2026-09-04 10:40:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000014'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000018'
        ),
        'transfer',
        1200.00,
        'USD transfer',
        '2026-09-09 15:20:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000005'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000012'
        ),
        'transfer',
        350.00,
        'EUR transfer awaiting confirmation',
        '2026-09-13 12:50:00+03',
        'pending'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000019'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000002'
        ),
        'transfer',
        4000.00,
        'Transfer to savings account',
        '2026-09-19 17:30:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000010'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000013'
        ),
        'transfer',
        10000.00,
        'Large RUB transfer',
        '2026-09-27 09:15:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000001'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000016'
        ),
        'transfer',
        500.00,
        'Private transfer',
        '2026-10-01 14:05:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000018'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817840000000000007'
        ),
        'transfer',
        250.00,
        'USD private transfer',
        '2026-10-08 18:45:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000008'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817850000000000012'
        ),
        'transfer',
        700.00,
        'EUR private transfer',
        '2026-10-13 11:35:00+03',
        'completed'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000009'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000006'
        ),
        'transfer',
        2000.00,
        'Transfer awaiting confirmation',
        '2026-10-21 20:25:00+03',
        'pending'
    ),
    (
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000013'
        ),
        (
            SELECT account_id
            FROM accounts
            WHERE account_number = '40817810000000000016'
        ),
        'transfer',
        3000.00,
        NULL,
        '2026-10-29 16:10:00+03',
        'completed'
    );


COMMIT;