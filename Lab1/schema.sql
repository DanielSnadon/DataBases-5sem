CREATE TABLE clients (
    client_id BIGINT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    passport VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(256),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT clients_pk
        PRIMARY KEY (client_id),

    CONSTRAINT clients_passport_unique
        UNIQUE (passport),
    
    CONSTRAINT clients_phone_unique
        UNIQUE (phone),

    CONSTRAINT clients_email_unique
        UNIQUE (email)  
);

CREATE TABLE offices (
    office_id BIGINT GENERATED ALWAYS AS IDENTITY,
    office_code VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,

    CONSTRAINT offices_pk
        PRIMARY KEY (office_id),

    CONSTRAINT offices_code_unique
        UNIQUE (office_code),
    
    CONSTRAINT offices_location_unique
        UNIQUE (city, address),

    CONSTRAINT offices_code_check
        CHECK (CHAR_LENGTH(office_code) BETWEEN 4 AND 10)
);

CREATE TABLE accounts (
    account_id BIGINT GENERATED ALWAYS AS IDENTITY,
    client_id BIGINT NOT NULL,
    office_id BIGINT NOT NULL,
    account_number VARCHAR(20) NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    currency CHAR(3) NOT NULL,
    balance NUMERIC(15, 2) NOT NULL DEFAULT 0,
    status VARCHAR(15) NOT NULL DEFAULT 'active',
    opened_at DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT accounts_pk
        PRIMARY KEY (account_id),
    
    CONSTRAINT accounts_number_unique
        UNIQUE (account_number),

    CONSTRAINT accounts_client_fk
        FOREIGN KEY (client_id)
        REFERENCES clients(client_id)
        ON DELETE RESTRICT,

    CONSTRAINT accounts_office_fk
        FOREIGN KEY (office_id)
        REFERENCES offices(office_id)
        ON DELETE RESTRICT,

    CONSTRAINT accounts_type_check
        CHECK (account_type IN ('current', 'savings')),

    CONSTRAINT accounts_currency_check
        CHECK (currency IN ('RUB', 'ESD', 'EUR')),

    CONSTRAINT accounts_balance_check
        CHECK (balance >= 0),

    CONSTRAINT accounts_status_check
        CHECK (status IN ('active', 'blocked', 'closed'))
);

CREATE TABLE cards (
    card_id BIGINT GENERATED ALWAYS AS IDENTITY,
    account_id BIGINT NOT NULL,
    card_number VARCHAR(19) NOT NULL,
    payment_system VARCHAR(20) NOT NULL,
    issued_at DATE NOT NULL DEFAULT CURRENT_DATE,
    expires_on DATE NOT NULL,
    status VARCHAR(15) NOT NULL DEFAULT 'active',

    CONSTRAINT cards_pk
        PRIMARY KEY (card_id),

    CONSTRAINT cards_number_unique
        UNIQUE (card_number),

    CONSTRAINT cards_account_fk
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
        ON DELETE CASCADE,

    CONSTRAINT cards_payment_system_check
        CHECK (payment_system IN ('MIR', 'VISA', 'MASTERCARD')),

    CONSTRAINT cards_status_check
        CHECK (status IN ('active', 'blocked', 'expired')),
    
    CONSTRAINT cards_date_check
        CHECK (expires_on > issued_at)
);

CREATE TABLE transactions (
    transaction_id BIGINT GENERATED ALWAYS AS IDENTITY,
    sender_account_id BIGINT,
    receiver_account_id BIGINT,
    transaction_type VARCHAR(20) NOT NULL,
    amount NUMERIC(15, 2) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT transactions_pk
        PRIMARY KEY (transaction_id),

    CONSTRAINT transactions_sender_fk
        FOREIGN KEY (sender_account_id)
        REFERENCES accounts(account_id)
        ON DELETE RESTRICT,
    
    CONSTRAINT transactions_amount_check
        CHECK (amount > 0),

    CONSTRAINT transactions_type_check
        CHECK (transaction_type IN ('transfer', 'deposit', 'withdrawal')),

    CONSTRAINT transactions_accounts_check
        CHECK (
            (
                transaction_type = 'transfer'
                AND sender_account_id IS NOT NULL
                AND receiver_account_id IS NOT NULL
                AND sender_account_id != receiver_account_id
            )
            OR
            (
                transaction_type = 'deposit'
                AND sender_account_id IS NULL
                AND receiver_account_id IS NOT NULL
            )
            OR
            (
                transaction_type = 'withdrawal'
                AND sender_account_id IS NOT NULL
                AND receiver_account_id IS NULL
            )
        )
);