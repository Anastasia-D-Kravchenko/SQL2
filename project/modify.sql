-- 1. SELECT statement that joins at least two tables and contains WHERE clause
-- Find all transactions with an amount greater than 100000 USD.
SELECT
    t.id,
    t.Timestamp,
    t.Amount,
    c.CurrencyCode
FROM
    Transaction t
        JOIN
    Currency c ON t.Currency_CurrencyCode = c.CurrencyCode
WHERE
    t.Amount > 100000 AND c.CurrencyCode = 'USD';

-- 2. SELECT statement that joins at least two tables and contains WHERE clause
-- Find the names of users who have the 'Administrator' role.
SELECT
    u.Name,
    u.Surname
FROM
    "User" u
        JOIN
    User_Role_Access ura ON u.id = ura.User_id
        JOIN
    Role r ON ura.Role_id = r.id
WHERE
    r.Role = 'Administrator';

-- 3. SELECT statement that joins at least two tables and contains WHERE clause
-- List all alerts that are related to 'Security Breach' and are not yet resolved.
SELECT
    a.id,
    a.Timestamp,
    em.Message
FROM
    Alert a
        JOIN
    Error_Message em ON a.Error_Message_Code = em.Code
WHERE
    a.Type = 'Security Breach' AND a.Resolved = 0;





-- 4. SELECT statement that joins at least two tables and contains GROUP BY and HAVING clauses
-- Find the number of transactions for each currency where the count is greater than 1.
SELECT
    c.CurrencyCode,
    COUNT(t.id) AS NumberOfTransactions
FROM
    Transaction t
        JOIN
    Currency c ON t.Currency_CurrencyCode = c.CurrencyCode
GROUP BY
    c.CurrencyCode
HAVING
    COUNT(t.id) > 1;

-- 5. SELECT statement that joins at least two tables and contains GROUP BY and HAVING clauses
-- Find the average transaction amount for each message type, only for averages greater than 90000.
SELECT
    mt.MessageType,
    AVG(t.Amount) AS AverageTransactionAmount
FROM
    Transaction t
        JOIN
    Message_Type mt ON t.Message_Types_id = mt.id
GROUP BY
    mt.MessageType
HAVING
    AVG(t.Amount) > 90000;

-- 6. SELECT statement that joins at least two tables and contains GROUP BY and HAVING clauses
-- Find the number of message validation logs for each error message code, only showing codes with more than one log.
SELECT
    em.Message,
    COUNT(mvl.id) AS NumberOfValidationLogs
FROM
    Message_Validation_Log mvl
        JOIN
    Error_Message em ON mvl.Error_Message_Code = em.Code
GROUP BY
    em.Message
HAVING
    COUNT(mvl.id) > 1;





-- 7. SELECT statement with subquery
-- Find all IBANs that are associated with the 'Barclays Bank'.
SELECT
    i.IBAN
FROM
    IBAN i
WHERE
    i.id IN (SELECT IBAN_id FROM IBAN_BIC WHERE BIC_Directory_BIC = (SELECT BIC FROM BIC_Directory WHERE InstitutionName = 'Barclays Bank'));

-- 8. SELECT statement with subquery
-- Find all users who have access to the 'Account Access' resource.
SELECT
    u.Name,
    u.Surname
FROM
    "User" u
WHERE
    u.id IN (SELECT User_id FROM User_Role_Access WHERE Access_Control_List_id = (SELECT id FROM Access_Control_List WHERE "Resource" = 'Account Access'));





-- 9. SELECT statement with correlated subquery
-- Find all transactions that have an amount greater than the average amount for their currency.
SELECT
    t.id,
    t.Amount,
    c.CurrencyCode
FROM
    Transaction t
        JOIN
    Currency c ON t.Currency_CurrencyCode = c.CurrencyCode
WHERE
    t.Amount > (SELECT AVG(Amount) FROM Transaction WHERE Currency_CurrencyCode = t.Currency_CurrencyCode);

-- 10. SELECT statement with correlated subquery
-- Find all message validation logs that occurred after the timestamp of their corresponding alert.
SELECT
    mvl.id,
    mvl.Timestamp AS ValidationLogTimestamp,
    a.Timestamp AS AlertTimestamp
FROM
    Message_Validation_Log mvl
        JOIN
    Alert a ON mvl.Error_Message_Code = a.Error_Message_Code
WHERE
    mvl.Timestamp > a.Timestamp;