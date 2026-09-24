### Запустить схему
psql -h localhost -U bank_user -d bank_system -f schema.sql

### Запуск клиента
psql -h localhost -U bank_user -d bank_system

### Удаление всех таблиц
DROP TABLE IF EXISTS
transactions,
cards,
accounts,
offices,
branches,
clients
CASCADE;


