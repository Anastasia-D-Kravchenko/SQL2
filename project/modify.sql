--a. SELECT with JOIN and WHERE (3 Queries):
-- 1. Find transactions that failed validation
SELECT t.id, t.Amount, mvl.Timestamp
FROM Transaction t
         JOIN MESSAGE_VALIDATION_LOG mvl ON t.id = mvl.Transaction_id
WHERE mvl.Error_Message_Code IS NOT NULL;
-- 2. Find user logins from a specific IP
SELECT ul.User_id, ul.Timestamp, a.SourceIP
FROM User_Log ul
         JOIN Activity a ON ul.User_id = a.User_id
WHERE a.SourceIP = '192.168.1.100' AND ul.EventType = 'Login';
-- 3. Retrieve transactions with their currency details
SELECT t.id, t.Amount, c.Currency
FROM Transaction t
         JOIN Currency c ON t.Currency_id = c.id
WHERE t.Amount > 1000;


--b. SELECT with JOIN, GROUP BY, and HAVING (3 Queries):
-- 1. Count validation errors per message type
SELECT mt.MessageType, COUNT(*) AS ErrorCount
FROM MESSAGE_VALIDATION_LOG mvl
         JOIN Message_Validation_Rule mvr ON mvl.Message_Validation_Rule_id = mvr.id
         JOIN All_MessageType mt ON mvr.Message_Types_id = mt.id
GROUP BY mt.MessageType
HAVING COUNT(*) > 2;
-- 2. Find components with more than 1 error
SELECT c.Name, COUNT(*) AS ErrorCount
FROM ERROR_MESSAGE em
         JOIN Component c ON em.Component_id = c.id
GROUP BY c.Name
HAVING COUNT(*) > 1;
-- 3. Find average transaction amount per currency
SELECT c.Currency, AVG(t.Amount) AS AverageAmount
FROM Transaction t
         JOIN Currency c ON t.Currency_id = c.id
GROUP BY c.Currency
HAVING AVG(t.Amount) > 100000;


--c. SELECT with Subquery (2 Queries):
-- 1. Find transactions with amounts greater than the average
SELECT id, Amount
FROM Transaction
WHERE Amount > (SELECT AVG(Amount) FROM Transaction);
-- 2. Find users who have logged in more than once
SELECT User_id
FROM User_Log
WHERE EventType = 'Login'
GROUP BY User_id
HAVING COUNT(*) > 1;


--d. SELECT with Correlated Subquery (2 Queries):
-- 1. Find transactions with amounts greater than the average for their currency
SELECT t.id, t.Amount, c.Currency
FROM Transaction t
         JOIN Currency c ON t.Currency_id = c.id
WHERE t.Amount > (SELECT AVG(Amount) FROM Transaction t2 WHERE t2.Currency_id = t.Currency_id);
-- 2. Find validation logs with errors related to components that also have transaction errors.
SELECT mvl.*
FROM MESSAGE_VALIDATION_LOG mvl
WHERE EXISTS (SELECT 1 FROM ERROR_MESSAGE em WHERE em.Code = mvl.Error_Message_Code AND EXISTS (SELECT 1 FROM TRANSACTION_LOG tl WHERE tl.Error_Message_Code = em.Code));