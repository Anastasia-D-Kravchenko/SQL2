-- 1. SELECT statement that joins at least two tables and contains WHERE clause
SELECT T.id, T.Amount, C.CurrencyCode
FROM Transaction T
         JOIN Currency C ON T.Currency_CurrencyCode = C.CurrencyCode
WHERE T.Amount > 100000;

-- 2. SELECT statement that joins at least two tables and contains WHERE clause
SELECT U.Name, U.Surname, UR.Role_id
FROM "User" U
         JOIN User_Role_Access UR ON U.id = UR.User_id
WHERE UR.Role_id = 1;

-- 3. SELECT statement that joins at least two tables and contains WHERE clause
SELECT A.Type, EM.Message
FROM Alert A
         JOIN Error_Message EM ON A.Error_Message_Code = EM.Code
WHERE A.Type = 'Security Breach';

-- 4. SELECT statement that joins at least two tables and contains GROUP BY and HAVING clauses
SELECT C.Category, COUNT(T.id) AS NumberOfTransactions, AVG(T.Amount) AS AverageAmount
FROM Transaction T
         JOIN Status S ON T.Status_id = S.id
GROUP BY C.Category
HAVING COUNT(T.id) > 1;

-- 5. SELECT statement that joins at least two tables and contains GROUP BY and HAVING clauses
SELECT U.Name, U.Surname, COUNT(UL.User_Log_id) AS NumberOfLogs
FROM "User" U
         JOIN UserLog UL ON U.id = UL.User_id
GROUP BY U.Name, U.Surname
HAVING COUNT(UL.User_Log_id) > 2;

-- 6. SELECT statement that joins at least two tables and contains GROUP BY and HAVING clauses
SELECT C.CurrencyCode, MAX(C.ExchangeRateToUSD) AS MaxExchangeRate, MIN(C.ExchangeRateToUSD) AS MinExchangeRate
FROM Currency C
         JOIN Transaction T ON C.CurrencyCode = T.Currency_CurrencyCode
GROUP BY C.CurrencyCode
HAVING COUNT(T.id) > 1;

-- 7. SELECT statement with subquery
SELECT T.id, T.Amount
FROM Transaction T
WHERE T.Amount > (SELECT AVG(Amount) FROM Transaction);

-- 8. SELECT statement with subquery
SELECT U.Name, U.Surname
FROM "User" U
WHERE U.id IN (SELECT User_id FROM UserLog WHERE Error_Message_Code IS NOT NULL);

-- 9. SELECT statement with correlated subquery
SELECT T.id, T.Amount
FROM Transaction T
WHERE EXISTS (SELECT 1 FROM TransactionLog TL WHERE T.id = TL.Transaction_id AND TL.Error_Message_Code IS NULL);

-- 10. SELECT statement with correlated subquery
SELECT EM.Code, EM.Message
FROM Error_Message EM
WHERE EXISTS (SELECT 1 FROM Alert A WHERE EM.Code = A.Error_Message_Code AND A.Resolved = 0);