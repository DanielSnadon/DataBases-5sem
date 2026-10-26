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




