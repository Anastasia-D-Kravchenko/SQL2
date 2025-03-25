-- 1. SWIFT Transaction Log Database

-- Table: SWIFT_Transactions
CREATE TABLE SWIFT_Transactions (
    TransactionID BIGINT PRIMARY KEY,
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
    AlertID BIGINT PRIMARY KEY,
    TransactionID BIGINT,
    AlertType VARCHAR(255),
    AlertTimestamp DATETIME,
    Resolved BOOLEAN,
    FOREIGN KEY (TransactionID) REFERENCES SWIFT_Transactions(TransactionID)
);

-- 2. SWIFT System Log Analysis

-- Table: SWIFT_System_Logs
CREATE TABLE SWIFT_System_Logs (
    LogID BIGINT PRIMARY KEY,
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
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Role VARCHAR(255)
);

-- Table: System_Alerts
CREATE TABLE System_Alerts (
    AlertID BIGINT PRIMARY KEY,
    LogID BIGINT,
    AlertType VARCHAR(255),
    AlertTimestamp DATETIME,
    Resolved BOOLEAN,
    FOREIGN KEY (LogID) REFERENCES SWIFT_System_Logs(LogID)
);

-- 3. SWIFT User Activity Monitoring

-- Table: SWIFT_User_Activity
CREATE TABLE SWIFT_User_Activity (
    ActivityID BIGINT PRIMARY KEY,
    UserID INT,
    Timestamp DATETIME,
    ActivityType VARCHAR(255),
    ResourceAccessed VARCHAR(255),
    SourceIP VARCHAR(45),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Table: SWIFT_Access_Control_Lists
CREATE TABLE SWIFT_Access_Control_Lists (
    ACL_ID BIGINT PRIMARY KEY,
    Resource VARCHAR(255),
    UserID INT,
    Permission ENUM('Read', 'Write', 'Execute', 'Approve'),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
