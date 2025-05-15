-- Category
INSERT INTO Category (id, Category) VALUES (1, 'MT1xx');
INSERT INTO Category (id, Category) VALUES (2, 'MT2xx');
INSERT INTO Category (id, Category) VALUES (3, 'MT3xx');
INSERT INTO Category (id, Category) VALUES (4, 'MT4xx');
INSERT INTO Category (id, Category) VALUES (5, 'MT5xx');

-- AccountType
INSERT INTO AccountType (id, AccountType) VALUES (1, 'Savings');
INSERT INTO AccountType (id, AccountType) VALUES (2, 'Checking');
INSERT INTO AccountType (id, AccountType) VALUES (3, 'Credit Card');
INSERT INTO AccountType (id, AccountType) VALUES (4, 'Investment');
INSERT INTO AccountType (id, AccountType) VALUES (5, 'Loan');

-- Severity
INSERT INTO Severity (id, Severity) VALUES (1, 'Low');
INSERT INTO Severity (id, Severity) VALUES (2, 'Medium');
INSERT INTO Severity (id, Severity) VALUES (3, 'High');
INSERT INTO Severity (id, Severity) VALUES (4, 'Critical');
INSERT INTO Severity (id, Severity) VALUES (5, 'Info');

-- Status
INSERT INTO Status (id, Status, Category) VALUES (1, 'Pending', 'Transaction');
INSERT INTO Status (id, Status, Category) VALUES (2, 'Completed', 'Transaction');
INSERT INTO Status (id, Status, Category) VALUES (3, 'Failed', 'Transaction');
INSERT INTO Status (id, Status, Category) VALUES (4, 'Authorized', 'Transaction');
INSERT INTO Status (id, Status, Category) VALUES (5, 'Cancelled', 'Transaction');

-- Role
INSERT INTO Role (id, Role) VALUES (1, 'Administrator');
INSERT INTO Role (id, Role) VALUES (2, 'Operator');
INSERT INTO Role (id, Role) VALUES (3, 'Auditor');
INSERT INTO Role (id, Role) VALUES (4, 'Manager');
INSERT INTO Role (id, Role) VALUES (5, 'Client');

-- Currency
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('USD', 1.00000000, TO_TIMESTAMP('2025-03-30 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('EUR', 1.08000000, TO_TIMESTAMP('2025-03-30 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('GBP', 1.25000000, TO_TIMESTAMP('2025-03-30 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('JPY', 0.00750000, TO_TIMESTAMP('2025-03-30 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('CAD', 0.74000000, TO_TIMESTAMP('2025-03-30 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);

-- BIC_Directory
INSERT INTO BIC_Directory (id, BIC, InstitutionName, Country) VALUES (1, 'ABCDUSNYXXX', 'Bank of America', 'US');
INSERT INTO BIC_Directory (id, BIC, InstitutionName, Country) VALUES (2, 'BBBBGB2LXXX', 'Barclays Bank', 'GB');
INSERT INTO BIC_Directory (id, BIC, InstitutionName, Country) VALUES (3, 'CCCCFR21XXX', 'Credit Agricole', 'FR');
INSERT INTO BIC_Directory (id, BIC, InstitutionName, Country) VALUES (4, 'DDDEUTG2XXX', 'Deutsche Bank', 'DE');
INSERT INTO BIC_Directory (id, BIC, InstitutionName, Country) VALUES (5, 'EEEEJPJTXXX', 'Mizuho Bank', 'JP');

-- Component
INSERT INTO Component (id, Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) VALUES (1, 'Alliance Access', 'Software', 'SWIFT messaging interface', '7.4', 'SWIFT', TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'), XMLType('<config><interface>TCP/IP</interface></config>'));
INSERT INTO Component (id, Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) VALUES (2, 'HSM', 'Hardware', 'Hardware Security Module', 'v3.2', 'Thales', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), XMLType('<config><keyLength>2048</keyLength></config>'));
INSERT INTO Component (id, Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) VALUES (3, 'Messaging Gateway', 'Software', 'Message routing service', '1.5', 'In-house', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), XMLType('<config><routing>XML</routing></config>'));
INSERT INTO Component (id, Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) VALUES (4, 'Database Server', 'Hardware', 'Oracle Database Server', '19c', 'Oracle', TO_DATE('2023-10-10', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), XMLType('<config><backup>weekly</backup></config>'));
INSERT INTO Component (id, Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) VALUES (5, 'Firewall', 'Hardware', 'Network Firewall', '6.0', 'Cisco', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2024-03-28', 'YYYY-MM-DD'), XMLType('<config><rules>strict</rules></config>'));

-- EventType
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (1, 'System', 'Message Processing', '127.0.0.1');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (2, 'Security', 'Account Data', '192.168.1.100');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (3, 'Transaction', 'Transaction Queue', '10.0.0.5');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (4, 'User Login', 'Authentication', '192.168.1.101');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (5, 'Configuration Change', 'System Settings', '10.0.0.10');

-- Error_Message
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (101, 'System Error Encountered', 3, 1, 1, 'An unexpected system error occurred during message parsing.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (205, 'Unauthorized Access Attempt', 4, 5, 2, 'An attempt to access a protected resource was made without proper authorization.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (310, 'High Transaction Volume Detected', 2, 10, 3, 'The transaction volume exceeded predefined thresholds.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (404, 'Invalid User Credentials', 4, 5, 4, 'User login failed due to incorrect username or password.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (500, 'Configuration Update Failed', 3, 4, 5, 'Failed to update system configuration settings.');

-- Rule
INSERT INTO Rule (id, Type, Expression, Description) VALUES (1, 'Regex', '^MT103.*', 'Message type must start with MT103');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (2, 'Length', '11', 'Sender BIC length must be 11 characters');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (3, 'Presence', 'NOT NULL', 'Receiver BIC must be present');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (4, 'Range', '>0', 'Transaction amount must be greater than zero');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (5, 'CurrencyCode', 'USD,EUR,GBP', 'Currency code must be one of the allowed values');

-- Message_Type
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (1, 'MT103', 1, 'Single Customer Credit Transfer', '2023', 'https://www.swift.com/mt103');
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (2, 'MT202', 2, 'General Financial Institution Transfer', '2023', 'https://www.swift.com/mt202');
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (3, 'MT300', 3, 'Foreign Exchange Confirmation', '2023', 'https://www.swift.com/mt300');
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (4, 'MT940', 1, 'Customer Statement Message', '2023', 'https://www.swift.com/mt940');
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (5, 'MT548', 5, 'Settlement Status Advice', '2023', 'https://www.swift.com/mt548');

-- IBAN
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (1, 'GB82WEST12345698765432', 'John Smith', 'ACC123456', 'GBP', 2, 1, TO_DATE('2024-03-15', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (2, 'DE89370400440532013000', 'Maria Müller', 'DE532013000', 'EUR', 1, 1, TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (3, 'FR7630004000061234567890189', 'Jean Dupont', 'FR1234567890', 'EUR', 2, 1, TO_DATE('2024-03-22', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (4, 'US64WFBK1234567890', 'Robert Williams', 'US12345678', 'USD', 1, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (5, 'JP2900050123456789', 'Akira Tanaka', 'JP1234567', 'JPY', 2, 1, TO_DATE('2024-04-05', 'YYYY-MM-DD'));

-- Access_Control_List
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (1, 'User Management', 7);
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (2, 'Account Access', 5);
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (3, 'Transaction History', 3);
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (4, 'Reporting', 1);
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (5, 'System Configuration', 7);

-- Transaction
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (1, TO_TIMESTAMP('2025-03-30 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'USD', 150000.00, 2, 1, 'Payment for services');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (2, TO_TIMESTAMP('2025-03-30 12:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'EUR', 75000.50, 2, 2, 'Interbank transfer');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (3, TO_TIMESTAMP('2025-03-30 12:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'GBP', 200000.00, 2, 3, 'FX trade confirmation');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (4, TO_TIMESTAMP('2025-03-30 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'USD', 10000.00, 2, 1, 'Salary payment');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (5, TO_TIMESTAMP('2025-03-30 12:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'JPY', 500000.00, 2, 5, 'Securities settlement');

-- Message_Validation_Log
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (1, TO_TIMESTAMP('2025-03-30 12:50:00', 'YYYY-MM-DD HH24:MI:SS'), 603);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (2, TO_TIMESTAMP('2025-03-30 12:55:00', 'YYYY-MM-DD HH24:MI:SS'), 402);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (3, TO_TIMESTAMP('2025-03-30 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 603);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (4, TO_TIMESTAMP('2025-03-30 13:05:00', 'YYYY-MM-DD HH24:MI:SS'), 501);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (5, TO_TIMESTAMP('2025-03-30 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 404);

-- Transaction_Log
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (1, TO_TIMESTAMP('2025-03-30 12:00:10', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (2, TO_TIMESTAMP('2025-03-30 12:05:15', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (3, TO_TIMESTAMP('2025-03-30 12:10:20', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (4, TO_TIMESTAMP('2025-03-30 12:15:25', 'YYYY-MM-DD HH24:MI:SS'), 101);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (5, TO_TIMESTAMP('2025-03-30 12:20:30', 'YYYY-MM-DD HH24:MI:SS'), NULL);

-- User_Log
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (1, TO_TIMESTAMP('2025-03-30 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (2, TO_TIMESTAMP('2025-03-30 12:20:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (3, TO_TIMESTAMP('2025-03-30 12:25:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (4, TO_TIMESTAMP('2025-03-30 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 404);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (5, TO_TIMESTAMP('2025-03-30 12:35:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);

-- User
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (1, '8001011234', 'jsmith', 'John', 'Smith');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (2, '8502025678', 'mmuller', 'Maria', 'Müller');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (3, '9003039876', 'bjohnson', 'Bob', 'Johnson');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (4, '9504041234', 'awilson', 'Alice', 'Wilson');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (5, '0005055678', 'davis', 'David', 'Davis');

-- Message_Validation_Rule
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (1, 1, 1);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (2, 1, 2);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (3, 2, 3);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (4, 4, 4);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (5, 5, 5);

-- RuleLog
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (1, 1);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (2, 1);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (3, 2);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (4, 4);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (5, 5);

-- IBAN_BIC
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (1, 2);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (2, 4);  -- There is no BIC_Directory id 4.  This will cause an error.
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (3, 3);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (4, 1);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (5, 5);

-- User_Role_Access
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (1, 1, 1, 1);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (2, 2, 2, 2);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (3, 3, 3, 3);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (4, 4, 4, 4);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (5, 5, 5, 5);

-- TransactionLog
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (1, 1);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (2, 2);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (3, 3);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (4, 4);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (5, 5);

-- SenderBIC
INSERT INTO SenderBIC (Transactions_id, BIC_Directory_id) VALUES (1, 1);
INSERT INTO SenderBIC (Transactions_id, BIC_Directory_id) VALUES (2, 2);
INSERT INTO SenderBIC (Transactions_id, BIC_Directory_id) VALUES (3, 3);
INSERT INTO SenderBIC (Transactions_id, BIC_Directory_id) VALUES (4, 4);
INSERT INTO SenderBIC (Transactions_id, BIC_Directory_id) VALUES (5, 5);

-- ReceiverBIC
INSERT INTO ReceiverBIC (Transactions_id, BIC_Directory_id) VALUES (1, 2);
INSERT INTO ReceiverBIC (Transactions_id, BIC_Directory_id) VALUES (2, 1);
INSERT INTO ReceiverBIC (Transactions_id, BIC_Directory_id) VALUES (3, 4);
INSERT INTO ReceiverBIC (Transactions_id, BIC_Directory_id) VALUES (4, 3);
INSERT INTO ReceiverBIC (Transactions_id, BIC_Directory_id) VALUES (5, 5);

-- Alert
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (1, 'System', TO_TIMESTAMP('2025-03-30 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 101, 0, 1);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (2, 'Security', TO_TIMESTAMP('2025-03-30 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), 205, 0, 1);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (3, 'Transaction', TO_TIMESTAMP('2025-03-30 13:25:00', 'YYYY-MM-DD HH24:MI:SS'), 310, 0, 1);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (4, 'User', TO_TIMESTAMP('2025-03-30 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 404, 0, 1);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (5, 'Configuration', TO_TIMESTAMP('2025-03-30 13:35:00', 'YYYY-MM-DD HH24:MI:SS'), 500, 0, 1);