/*  */

BEGIN;

-- ALTER TABLE accounts
-- DROP CONSTRAINT accounts_client_fk;

-- ADD TABLE accs;

-- ALTER TABLE accs
-- ADD COLUMN accs_id BIGINT GENERATED AS ALWAYS;

-- ALTER TABLE accs
-- ADD CONSTRAINT accs_pk
-- PRIMARY KEY (accs_id);

-- ALTER TABLE accs
-- ADD COLUMN client_id BIGINT;

-- ALTER TABLE accs
-- ADD COLUMN account_id BIGINT;

-- ALTER TABLE accs
-- ADD COLUMN status_id BIGINT;

-- UPDATE account
-- SET status_id = 0
-- WHERE *;

-- ALTER TABLE accs
-- ALTER COLUMN status_id DEFAULT 0;



-- ALTER TABLE accounts
-- DROP COLUMN client_id;

-- ALTER TABLE accs
-- ADD CONSTRAINT accs_clients_fk
-- FOREIGN KEY (client_id)
-- REFERENCES clients(client_id)
-- ON DELETE RESTRICT;

-- ALTER TABLE accounts
-- ADD COLUMN accs_id BIGINT;

-- ALTER TABLE accounts
-- ADD CONSTRAINT accounts_accs_fk
-- FOREIGN KEY (accs_id)
-- REFERENCES accs(accs_id)
-- ON DELETE SET accs.account_id = NULL;

COMMIT;