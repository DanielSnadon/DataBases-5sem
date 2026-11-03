BEGIN;

ALTER TABLE transactions
ADD COLUMN status VARCHAR(15);

UPDATE transactions
SET status = 'completed'
WHERE status IS NULL;

ALTER TABLE transactions
ALTER COLUMN status SET DEFAULT 'pending';

ALTER TABLE transactions
ALTER COLUMN status SET NOT NULL;

ALTER TABLE transactions
ADD CONSTRAINT transactions_status_check
CHECK (status IN ('pending', 'completed', 'cancelled'));

COMMIT;