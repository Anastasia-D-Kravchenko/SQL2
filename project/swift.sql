-- 1. SWIFT Transaction Log Database

-- Table: SWIFT_Transactions
CREATE TABLE SWIFT_Transactions (
    TransactionID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Timestamp DATETIME,
    MessageType VARCHAR(10),
    SenderBIC VARCHAR(11),
    ReceiverBIC VARCHAR(11),
    Amount DECIMAL(20, 2),
    Currency VARCHAR(3),
    TransactionStatus VARCHAR(20),
    Details TEXT
);

-- Table: BIC_Directory
CREATE TABLE BIC_Directory (
    BIC VARCHAR(11) PRIMARY KEY,
    InstitutionName VARCHAR(255),
    Country VARCHAR(2)
);

-- Table: SWIFT_Alerts
CREATE TABLE SWIFT_Alerts (
    AlertID BIGINT PRIMARY KEY AUTO_INCREMENT,
    TransactionID BIGINT,
    AlertType VARCHAR(255),
    AlertTimestamp DATETIME,
    Resolved BOOLEAN,
    FOREIGN KEY (TransactionID) REFERENCES SWIFT_Transactions(TransactionID)
);

-- Queries:

-- Retrieve transactions by time range, BIC, amount, currency.
SELECT *
FROM SWIFT_Transactions
WHERE Timestamp BETWEEN '2023-01-01 00:00:00' AND '2023-12-31 23:59:59'
  AND (SenderBIC = 'BANKABCDEF' OR ReceiverBIC = 'BANKABCDEF')
  AND Amount > 1000000
  AND Currency = 'USD';

-- Identify large or unusual transactions.
SELECT *
FROM SWIFT_Transactions
WHERE Amount > 10000000;

-- Detect failed transactions and investigate causes.
SELECT *
FROM SWIFT_Transactions
WHERE TransactionStatus = 'Failed';

-- Generate alerts based on predefined rules related to financial fraud.
-- Example: Large transaction alert
INSERT INTO SWIFT_Alerts (TransactionID, AlertType, AlertTimestamp, Resolved)
SELECT TransactionID, 'Large Transaction', NOW(), FALSE
FROM SWIFT_Transactions
WHERE Amount > 5000000;

-- 2. SWIFT System Log Analysis

-- Table: SWIFT_System_Logs
CREATE TABLE SWIFT_System_Logs (
    LogID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Timestamp DATETIME,
    Component VARCHAR(255),
    EventType VARCHAR(255),
    Severity ENUM('Info', 'Warning', 'Error', 'Critical'),
    Message TEXT,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Table: Users
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(255),
    Role VARCHAR(255)
);

-- Table: System_Alerts
CREATE TABLE System_Alerts (
    AlertID BIGINT PRIMARY KEY AUTO_INCREMENT,
    LogID BIGINT,
    AlertType VARCHAR(255),
    AlertTimestamp DATETIME,
    Resolved BOOLEAN,
    FOREIGN KEY (LogID) REFERENCES SWIFT_System_Logs(LogID)
);

-- Queries:

-- Identify unauthorized login attempts.
SELECT *
FROM SWIFT_System_Logs
WHERE EventType = 'Login' AND Severity = 'Error';

-- Track configuration changes to SWIFT systems.
SELECT *
FROM SWIFT_System_Logs
WHERE EventType = 'Configuration Change';

-- Generate reports on system errors and performance.
SELECT Component, Severity, COUNT(*)
FROM SWIFT_System_Logs
WHERE Timestamp BETWEEN '2023-01-01 00:00:00' AND '2023-12-31 23:59:59'
GROUP BY Component, Severity;

-- Correlate system events with transaction logs.
SELECT *
FROM SWIFT_System_Logs sl
JOIN SWIFT_Transactions st ON sl.Timestamp BETWEEN st.Timestamp - INTERVAL 1 HOUR AND st.Timestamp + INTERVAL 1 HOUR
WHERE sl.EventType = 'Error';

-- 3. SWIFT User Activity Monitoring

-- Table: SWIFT_User_Activity
CREATE TABLE SWIFT_User_Activity (
    ActivityID BIGINT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Timestamp DATETIME,
    ActivityType VARCHAR(255),
    ResourceAccessed VARCHAR(255),
    SourceIP VARCHAR(45),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Table: SWIFT_Access_Control_Lists
CREATE TABLE SWIFT_Access_Control_Lists (
    ACL_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Resource VARCHAR(255),
    UserID INT,
    Permission ENUM('Read', 'Write', 'Execute', 'Approve'),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Queries:

-- Track user activity related to SWIFT transactions and system administration.
SELECT *
FROM SWIFT_User_Activity;

-- Identify anomalous user behavior (e.g., approving large transactions outside of normal hours).
SELECT *
FROM SWIFT_User_Activity ua
JOIN SWIFT_Transactions st ON ua.ActivityType = 'Transaction Approval'
WHERE st.Amount > 1000000 AND HOUR(ua.Timestamp) NOT BETWEEN 9 AND 17;

-- Enforce access control policies.
SELECT *
FROM SWIFT_Access_Control_Lists
WHERE UserID = 123 AND Resource = 'Transaction Queue' AND Permission = 'Approve';

-- Generate audit trails.
SELECT *
FROM SWIFT_User_Activity
ORDER BY Timestamp DESC;
