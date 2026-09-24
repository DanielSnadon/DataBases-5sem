### Запуск клиента
psql -h localhost -U bank_user -d bank_system

### Запустить схему
psql -h localhost -U bank_user -d bank_system -f schema.sql

### Заполнение данными
psql -h localhost -U bank_user -d bank_system -f data.sql

### Запуск нерабочих тестов
psql -h localhost -U bank_user -d bank_system -f constraints_test.sql

### Удаление всех таблиц
DROP TABLE IF EXISTS
transactions,
cards,
accounts,
offices,
clients
CASCADE;

### Проверка связей
SELECT
c.client_id,
c.first_name,
c.last_name,
a.account_id,
a.account_number,
a.account_type,
a.balance,
a.currency
FROM clients AS c
JOIN accounts AS a
ON a.client_id = c.client_id
ORDER BY c.client_id, a.account_id;



