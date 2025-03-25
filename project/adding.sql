-- USER ---------------------------------------------
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (1, '8001011234', 'akrava', 'Anastasiia', 'Kravchenko');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (2, '8502025678', 'mmuller', 'Maria', 'Müller');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (3, '9003039012', 'jbeam', 'Jean', 'Beam');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (4, '7804043456', 'rjonny', 'Robert', 'Jonny');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (5, '8205057890', 'stimberlain', 'Sophie', 'Timberlain');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (6, '9506061234', 'hmeier', 'Hans', 'Meier');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (7, '7907075678', 'dlee', 'David', 'Lee');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (8, '8808089012', 'asvensson', 'Anna', 'Svensson');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (9, '9209093456', 'lwatson', 'Lars', 'Watson');
INSERT INTO "User" (id, PESEL, Username, Name, Surname) VALUES (10, '8110107890', 'knowak', 'Katarzyna', 'Nowak');

INSERT INTO Role (id, Role) VALUES (1, 'Administrator');
INSERT INTO Role (id, Role) VALUES (2, 'Operator');
INSERT INTO Role (id, Role) VALUES (3, 'Auditor');
INSERT INTO Role (id, Role) VALUES (4, 'Support');
INSERT INTO Role (id, Role) VALUES (5, 'Read Only');
INSERT INTO Role (id, Role) VALUES (6, 'System Admin');
INSERT INTO Role (id, Role) VALUES (7, 'Security Officer');
INSERT INTO Role (id, Role) VALUES (8, 'Costumer'); -- to infinity ;> ∞
INSERT INTO Role (id, Role) VALUES (9, 'Report Viewer');
INSERT INTO Role (id, Role) VALUES (10, 'Data Analyst');

-- Permission mapping:
-- Read: 4
-- Write: 2
-- Execute: 1
-- AllIn: 7

INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (1, 'User Management', 7); -- Read + Write + Execute
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (2, 'Account Access', 6); -- Read + Write
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (3, 'Transaction History', 4); -- Read
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (4, 'Alert Monitoring', 4); -- Read
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (5, 'Rule Configuration', 7); -- Read + Write + Execute
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (6, 'Message Validation', 4); -- Read
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (7, 'Component Management', 7); -- Read + Write + Execute
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (8, 'Currency Exchange', 6); -- Read + Write
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (9, 'BIC Directory Access', 4); -- Read
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES (10, 'Report Generation', 4); -- Read

INSERT INTO AccountType (id, AccountType) VALUES (1, 'Savings');
INSERT INTO AccountType (id, AccountType) VALUES (2, 'Checking');
INSERT INTO AccountType (id, AccountType) VALUES (3, 'Credit Card');
INSERT INTO AccountType (id, AccountType) VALUES (4, 'Loan');
INSERT INTO AccountType (id, AccountType) VALUES (5, 'Investment');
INSERT INTO AccountType (id, AccountType) VALUES (6, 'Mortgage');
INSERT INTO AccountType (id, AccountType) VALUES (7, 'Business Savings');
INSERT INTO AccountType (id, AccountType) VALUES (8, 'Business Checking');
INSERT INTO AccountType (id, AccountType) VALUES (9, 'Money Market');
INSERT INTO AccountType (id, AccountType) VALUES (10, 'Certificate of Deposit');

INSERT INTO Status (id, Status, Category) VALUES (1, 'Pending', 'Transaction');
INSERT INTO Status (id, Status, Category) VALUES (2, 'Completed', 'Transaction');
INSERT INTO Status (id, Status, Category) VALUES (3, 'Failed', 'Transaction');
INSERT INTO Status (id, Status, Category) VALUES (4, 'Open', 'IBAN');
INSERT INTO Status (id, Status, Category) VALUES (5, 'Closed', 'IBAN');
INSERT INTO Status (id, Status, Category) VALUES (6, 'Active', 'IBAN');
INSERT INTO Status (id, Status, Category) VALUES (7, 'Inactive', 'IBAN');
INSERT INTO Status (id, Status, Category) VALUES (8, 'New', 'Alert');
INSERT INTO Status (id, Status, Category) VALUES (9, 'InProgress', 'Alert');
INSERT INTO Status (id, Status, Category) VALUES (10, 'Resolved', 'Alert');

INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('USD', 1.00000000, TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('EUR', 1.08000000, TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('GBP', 1.25000000, TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('JPY', 0.00680000, TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('CAD', 0.73000000, TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('CHF', 1.10000000, TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('AUD', 0.65000000, TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('SEK', 0.09500000, TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('NOK', 0.09800000, TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Currency (CurrencyCode, ExchangeRateToUSD, ExchangeRateLastUpdated, IsActive) VALUES ('PLN', 0.25000000, TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);

INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (1, 'GB82WEST12345698765432', 'John Smith', 'ACC123456', 'GBP', 2, 6, TO_DATE('2024-01-10', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (2, 'DE89370400440532013000', 'Maria Müller', 'DE532013000', 'EUR', 1, 6, TO_DATE('2024-02-15', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (3, 'FR7630004000061234567890189', 'Jean Dupont', 'FR1234567890', 'EUR', 2, 6, TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (4, 'US64SWBK0000000000000000000', 'Robert Jones', 'US12345678', 'USD', 2, 6, TO_DATE('2023-12-01', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (5, 'CA16ROYC0000001234567', 'Sophie Tremblay', 'CA567890', 'CAD', 1, 6, TO_DATE('2024-01-25', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (6, 'CH5604835012345678009', 'Hans Meier', 'CH987654', 'CHF', 1, 6, TO_DATE('2024-02-28', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (7, 'AU140010101234567890', 'David Lee', 'AU1234567890', 'AUD', 2, 6, TO_DATE('2024-03-15', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (8, 'SE585000000001234567890', 'Anna Svensson', 'SE67890123', 'SEK', 1, 6, TO_DATE('2024-03-20', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (9, 'NO93900000000000000', 'Lars Olsen', 'NO01234567', 'NOK', 2, 6, TO_DATE('2024-03-22', 'YYYY-MM-DD'));
INSERT INTO IBAN (id, IBAN, HolderName, AccountNumber, Currency_CurrencyCode, AccountType_id, Status_id, CreationDate) VALUES (10, 'PL61109010140000071219812861', 'Katarzyna Nowak', 'PL7121981286', 'PLN', 1, 6, TO_DATE('2024-03-23', 'YYYY-MM-DD'));

INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (1, 1, 1, 1);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (2, 2, 2, 2);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (3, 3, 3, 3);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (4, 4, 4, 4);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (5, 5, 5, 5);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (6, 6, 6, 6);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (7, 7, 7, 7);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (8, 8, 8, 8);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (9, 9, 9, 9);
INSERT INTO User_Role_Access (Role_id, User_id, Access_Control_List_id, IBAN_id) VALUES (10, 10, 10, 10);

-- BIC ---------------------------------------------
INSERT INTO BIC_Directory (ID, BIC, InstitutionName, Country) VALUES (1, 'ABCDUSNYXXX', 'Bank of America', 'US');
INSERT INTO BIC_Directory (ID, BIC, InstitutionName, Country) VALUES (2, 'BBBBGB2LXXX', 'Barclays Bank', 'GB');
INSERT INTO BIC_Directory (ID, BIC, InstitutionName, Country) VALUES (3, 'CCCCFR21XXX', 'Credit Agricole', 'FR');
INSERT INTO BIC_Directory (ID, BIC, InstitutionName, Country) VALUES (4, 'DDDDDEFFXXX', 'Deutsche Bank', 'DE');
INSERT INTO BIC_Directory (ID, BIC, InstitutionName, Country) VALUES (5, 'EEEEITRRXXX', 'Intesa Sanpaolo', 'IT');
INSERT INTO BIC_Directory (ID, BIC, InstitutionName, Country) VALUES (6, 'FFFFJPJTXXX', 'MUFG Bank', 'JP');
INSERT INTO BIC_Directory (ID, BIC, InstitutionName, Country) VALUES (7, 'PBANUA2XXXX', 'PrivatBank', 'UA');
INSERT INTO BIC_Directory (ID, BIC, InstitutionName, Country) VALUES (8, 'HHHHPLPWXXX', 'PKO Bank Polski', 'PL');
INSERT INTO BIC_Directory (ID, BIC, InstitutionName, Country) VALUES (9, 'IIIIESMMXXX', 'Banco Santander', 'ES');
INSERT INTO BIC_Directory (ID, BIC, InstitutionName, Country) VALUES (10, 'JJJJCNAEXXX', 'Royal Bank of Canada', 'CA');

INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (1, 2);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (2, 4);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (3, 3);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (4, 1);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (5, 10);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (6, 6);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (7, 7);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (8, 5);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (9, 9);
INSERT INTO IBAN_BIC (IBAN_id, BIC_Directory_id) VALUES (10, 8);

-- TRANSACTION ---------------------------------------------
INSERT INTO Category (id, Category) VALUES (1, 'MT1xx');
INSERT INTO Category (id, Category) VALUES (2, 'MT2xx');
INSERT INTO Category (id, Category) VALUES (3, 'MT3xx');
INSERT INTO Category (id, Category) VALUES (4, 'MT5xx');
INSERT INTO Category (id, Category) VALUES (5, 'MT9xx');
INSERT INTO Category (id, Category) VALUES (6, 'ISO 20022');
INSERT INTO Category (id, Category) VALUES (7, 'XML');
INSERT INTO Category (id, Category) VALUES (8, 'Proprietary');
INSERT INTO Category (id, Category) VALUES (9, 'Testing');
INSERT INTO Category (id, Category) VALUES (10, 'Repair');

INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (1, 'MT103', 1, 'Single Customer Credit Transfer', '2023', 'https://www.swift.com/mt103'); -- imaginary, cuz real looks: http://swift.com/myswift/services/training/swift-training-catalogue/browse-swift-training-catalogue/mastering-single-customer-credit-transfer-mt-103
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (2, 'MT202', 2, 'General Financial Institution Transfer', '2023', 'https://www.swift.com/mt202');
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (3, 'MT300', 3, 'Foreign Exchange Confirmation', '2023', 'https://www.swift.com/mt300');
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (4, 'MT540', 4, 'Receive Free of Payment', '2023', 'https://www.swift.com/mt540');
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (5, 'MT940', 5, 'Customer Statement Message', '2023', 'https://www.swift.com/mt940');
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (6, 'camt.053', 6, 'Bank to Customer Statement', '2019', 'https://www.iso20022.org/camt.053'); -- same goes here: https://www.iso20022.org/iso-20022-message-definitions?search=camt.053
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (7, 'camt.054', 6, 'Bank to Customer Debit Credit Notification', '2019', 'https://www.iso20022.org/camt.054');
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (8, 'custom.payment', 8, 'Proprietary Payment Message', '1.0', 'https://localhost/docs/custom_payment');
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (9, 'test.message', 9, 'Test Message for System Verification', '1.0', 'https://localhost/docs/test_message');
INSERT INTO Message_Type (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES (10, 'MT199', 5, 'Free Format Message', '2023', 'https://www.swift.com/mt199');

INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (1, TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'USD', 150000.00, 2, 1, 'Payment for services');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (2, TO_TIMESTAMP('2025-03-24 12:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'EUR', 75000.50, 2, 2, 'Interbank transfer');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (3, TO_TIMESTAMP('2025-03-24 12:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'GBP', 200000.00, 2, 3, 'FX trade confirmation');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (4, TO_TIMESTAMP('2025-03-24 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'JPY', 10000000.00, 2, 4, 'Securities settlement');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (5, TO_TIMESTAMP('2025-03-24 12:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'CAD', 80000.00, 2, 5, 'Customer statement');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (6, TO_TIMESTAMP('2025-03-24 12:25:00', 'YYYY-MM-DD HH24:MI:SS'), 'CHF', 120000.00, 2, 1, 'Payment for goods');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (7, TO_TIMESTAMP('2025-03-24 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'AUD', 90000.00, 2, 2, 'Interbank transfer');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (8, TO_TIMESTAMP('2025-03-24 12:35:00', 'YYYY-MM-DD HH24:MI:SS'), 'SEK', 1500000.00, 2, 3, 'FX trade confirmation');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (9, TO_TIMESTAMP('2025-03-24 12:40:00', 'YYYY-MM-DD HH24:MI:SS'), 'NOK', 1100000.00, 2, 4, 'Securities settlement');
INSERT INTO Transaction (id, Timestamp, Currency_CurrencyCode, Amount, Status_id, Message_Types_id, Details) VALUES (10, TO_TIMESTAMP('2025-03-24 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'PLN', 300000.00, 2, 5, 'Customer statement');

INSERT INTO SenderBIC (BIC_Directory_id, Transactions_id) VALUES (1, 1);
INSERT INTO SenderBIC (BIC_Directory_id, Transactions_id) VALUES (2, 2);
INSERT INTO SenderBIC (BIC_Directory_id, Transactions_id) VALUES (3, 3);
INSERT INTO SenderBIC (BIC_Directory_id, Transactions_id) VALUES (4, 4);
INSERT INTO SenderBIC (BIC_Directory_id, Transactions_id) VALUES (5, 5);
INSERT INTO SenderBIC (BIC_Directory_id, Transactions_id) VALUES (6, 6);
INSERT INTO SenderBIC (BIC_Directory_id, Transactions_id) VALUES (7, 7);
INSERT INTO SenderBIC (BIC_Directory_id, Transactions_id) VALUES (8, 8);
INSERT INTO SenderBIC (BIC_Directory_id, Transactions_id) VALUES (9, 9);
INSERT INTO SenderBIC (BIC_Directory_id, Transactions_id) VALUES (10, 10);

INSERT INTO ReceiverBIC (BIC_Directory_id, Transactions_id) VALUES (2, 1);
INSERT INTO ReceiverBIC (BIC_Directory_id, Transactions_id) VALUES (4, 2);
INSERT INTO ReceiverBIC (BIC_Directory_id, Transactions_id) VALUES (3, 3);
INSERT INTO ReceiverBIC (BIC_Directory_id, Transactions_id) VALUES (7, 4);
INSERT INTO ReceiverBIC (BIC_Directory_id, Transactions_id) VALUES (10, 5);
INSERT INTO ReceiverBIC (BIC_Directory_id, Transactions_id) VALUES (2, 6);
INSERT INTO ReceiverBIC (BIC_Directory_id, Transactions_id) VALUES (4, 7);
INSERT INTO ReceiverBIC (BIC_Directory_id, Transactions_id) VALUES (3, 8);
INSERT INTO ReceiverBIC (BIC_Directory_id, Transactions_id) VALUES (1, 9);
INSERT INTO ReceiverBIC (BIC_Directory_id, Transactions_id) VALUES (10, 10);

-- ERROR ---------------------------------------------
INSERT INTO Severity (id, Severity) VALUES (1, 'Informational');
INSERT INTO Severity (id, Severity) VALUES (2, 'Low');
INSERT INTO Severity (id, Severity) VALUES (3, 'Minor');
INSERT INTO Severity (id, Severity) VALUES (4, 'Medium');
INSERT INTO Severity (id, Severity) VALUES (5, 'Major');
INSERT INTO Severity (id, Severity) VALUES (6, 'High');
INSERT INTO Severity (id, Severity) VALUES (7, 'Critical');
INSERT INTO Severity (id, Severity) VALUES (8, 'Severe');
INSERT INTO Severity (id, Severity) VALUES (9, 'Urgent');
INSERT INTO Severity (id, Severity) VALUES (10, 'Emergency');

ALTER TABLE Component MODIFY (Configuration DEFAULT XMLType('<config><interface/></config>'));

INSERT INTO Component (id, Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) VALUES (1, 'Alliance Access', 'Software', 'SWIFT messaging interface', '7.4', 'SWIFT', TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-06-20', 'YYYY-MM-DD'), XMLType('<config><interface>TCP/IP</interface></config>'));
INSERT INTO Component(id,Name,Type,Description,Version,Vendor,InstallationDate,LastUpdated,Configuration)VALUES(2,'HSM','Hardware','Hardware Security Module','v3.2','Thales',TO_DATE('2022-12-01','YYYY-MM-DD'),TO_DATE('2023-03-10','YYYY-MM-DD'),XMLType('<config><keyLength>2048</keyLength></config>'));
INSERT INTO Component(id,Name,Type,Description,Version,Vendor,InstallationDate,LastUpdated,Configuration)VALUES(3,'Messaging Gateway','Software','Message routing service','1.5','In-house',TO_DATE('2023-02-28','YYYY-MM-DD'),TO_DATE('2023-07-15','YYYY-MM-DD'),XMLType('<config><routing>XML</routing></config>'));
INSERT INTO Component(id,Name,Type,Description,Version,Vendor,InstallationDate,LastUpdated,Configuration)VALUES(4,'Database Server','Software','Database for SWIFT data','MySQL 8.0','Oracle',TO_DATE('2022-11-10','YYYY-MM-DD'),TO_DATE('2023-08-01','YYYY-MM-DD'),XMLType('<config><database>SWIFT_DB</database></config>'));
INSERT INTO Component(id,Name,Type,Description,Version,Vendor,InstallationDate,LastUpdated,Configuration)VALUES(5,'User Interface','Software','Web-based UI','2.0','In-house',TO_DATE('2023-03-05','YYYY-MM-DD'),TO_DATE('2023-09-02','YYYY-MM-DD'),XMLType('<config><framework>React</framework></config>'));
INSERT INTO Component(id,Name,Type,Description,Version,Vendor,InstallationDate,LastUpdated,Configuration)VALUES(6,'Validation Service','Software','Message validation service','1.2','In-house',TO_DATE('2023-04-10','YYYY-MM-DD'),TO_DATE('2023-10-10','YYYY-MM-DD'),XMLType('<config><rules>MFVR</rules></config>'));
INSERT INTO Component(id,Name,Type,Description,Version,Vendor,InstallationDate,LastUpdated,Configuration)VALUES(7,'Report Generator','Software','Reporting tool','1.3','In-house',TO_DATE('2023-05-15','YYYY-MM-DD'),TO_DATE('2023-11-15','YYYY-MM-DD'),XMLType('<config><format>PDF</format></config>'));
INSERT INTO Component(id,Name,Type,Description,Version,Vendor,InstallationDate,LastUpdated,Configuration)VALUES(8,'Message Repair Tool','Software','Message editing tool','1.1','In-house',TO_DATE('2023-06-20','YYYY-MM-DD'),TO_DATE('2023-12-20','YYYY-MM-DD'),XMLType('<config><features>Edit</features></config>'));
INSERT INTO Component(id,Name,Type,Description,Version,Vendor,InstallationDate,LastUpdated,Configuration)VALUES(9,'Logging Service','Software','System logging service','1.4','In-house',TO_DATE('2023-07-25','YYYY-MM-DD'),TO_DATE('2024-01-25','YYYY-MM-DD'),XMLType('<config><level>Info</level></config>'));
INSERT INTO Component(id,Name,Type,Description,Version,Vendor,InstallationDate,LastUpdated,Configuration)VALUES(10,'Security Module','Software','Security related services','2.1','In-house',TO_DATE('2023-08-30','YYYY-MM-DD'),TO_DATE('2024-02-28','YYYY-MM-DD'),XMLType('<config><authentication>OAuth2</authentication></config>'));

INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (1, 'System', 'Message Processing', '127.0.0.1');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (2, 'Security', 'Account Data', '192.168.1.100');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (3, 'Transaction', 'Transaction Queue', '10.0.0.5');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (4, 'Authentication', 'User Session', '192.168.1.150');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (5, 'Configuration', 'System Settings', '127.0.0.1');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (6, 'Validation', 'Incoming Message', '10.0.0.10');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (7, 'Component', 'Database Connection', '127.0.0.1');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (8, 'Integration', 'External API', '203.0.113.45');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (9, 'Service', 'BIC Directory', '203.0.113.50');
INSERT INTO EventType (id, Type, ResourceAccessed, SourceIP) VALUES (10, 'Reporting', 'Report Generation', '127.0.0.1');

INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (101, 'System Error Encountered', 3, 1, 1, 'An unexpected system error occurred during message parsing.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (205, 'Unauthorized Access Attempt', 4, 5, 2, 'An attempt to access a protected resource was made without proper authorization.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (310, 'High Transaction Volume Detected', 2, 10, 3, 'The transaction volume exceeded predefined thresholds.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (402, 'Invalid Account Number', 3, 2, 4, 'The provided account number is not valid.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (501, 'Configuration Update Failed', 3, 6, 5, 'An attempt to update the system configuration failed.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (603, 'Message Validation Failed', 4, 2, 6, 'An incoming message failed validation against defined rules.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (701, 'Component Failure - Database Connection', 4, 3, 7, 'The database connector component failed to establish a connection to the database.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (804, 'Currency Exchange Rate Retrieval Error', 3, 7, 8, 'An error occurred while retrieving the latest currency exchange rates.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (901, 'BIC Directory Service Unavailable', 4, 8, 9, 'The external BIC directory service is currently unavailable.');
INSERT INTO Error_Message (Code, Message, Severity_id, Component_id, EventType_id, Description) VALUES (1005, 'Report Generation Failed - Invalid Parameters', 3, 4, 10, 'The report generation process failed due to invalid input parameters.');

INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (1, 'System Error', TO_TIMESTAMP('2025-03-24 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 101, 0, 10);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (2, 'Security Breach', TO_TIMESTAMP('2025-03-24 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 205, 1, 9);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (3, 'High Transaction Volume', TO_TIMESTAMP('2025-03-24 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 310, 1, 9);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (4, 'Invalid Account Access', TO_TIMESTAMP('2025-03-24 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 402, 1, 8);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (5, 'Configuration Change', TO_TIMESTAMP('2025-03-24 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 501, 1, 9);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (6, 'Message Validation Failure', TO_TIMESTAMP('2025-03-24 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), 603, 1, 8);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (7, 'Component Failure', TO_TIMESTAMP('2025-03-24 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 701, 1, 9);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (8, 'Currency Rate Update Failed', TO_TIMESTAMP('2025-03-24 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), 804, 1, 8);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (9, 'BIC Directory Unavailable', TO_TIMESTAMP('2025-03-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 901, 1, 9);
INSERT INTO Alert (id, Type, Timestamp, Error_Message_Code, Resolved, Status_id) VALUES (10, 'Report Generation Error', TO_TIMESTAMP('2025-03-24 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 1005, 1, 8);

INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (1, TO_TIMESTAMP('2025-03-24 12:00:10', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (2, TO_TIMESTAMP('2025-03-24 12:05:15', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (3, TO_TIMESTAMP('2025-03-24 12:10:20', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (4, TO_TIMESTAMP('2025-03-24 12:15:25', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (5, TO_TIMESTAMP('2025-03-24 12:20:30', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (6, TO_TIMESTAMP('2025-03-24 12:25:35', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (7, TO_TIMESTAMP('2025-03-24 12:30:40', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (8, TO_TIMESTAMP('2025-03-24 12:35:45', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (9, TO_TIMESTAMP('2025-03-24 12:40:50', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code) VALUES (10, TO_TIMESTAMP('2025-03-24 12:45:55', 'YYYY-MM-DD HH24:MI:SS'), NULL);

INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (1, 1);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (2, 2);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (3, 3);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (4, 4);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (5, 5);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (6, 6);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (7, 7);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (8, 8);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (9, 9);
INSERT INTO TransactionLog (Transaction_id, Transaction_Log_id) VALUES (10, 10);

INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (1, TO_TIMESTAMP('2025-03-24 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (2, TO_TIMESTAMP('2025-03-24 09:05:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (3, TO_TIMESTAMP('2025-03-24 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (4, TO_TIMESTAMP('2025-03-24 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (5, TO_TIMESTAMP('2025-03-24 09:20:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (6, TO_TIMESTAMP('2025-03-24 09:25:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (7, TO_TIMESTAMP('2025-03-24 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (8, TO_TIMESTAMP('2025-03-24 09:35:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (9, TO_TIMESTAMP('2025-03-24 09:40:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO User_Log (id, Timestamp, Error_Message_Code) VALUES (10, TO_TIMESTAMP('2025-03-24 09:45:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);

INSERT INTO UserLog (User_id, User_Log_id) VALUES (1, 1);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (2, 2);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (3, 3);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (4, 4);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (5, 5);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (6, 6);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (7, 7);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (8, 8);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (9, 9);
INSERT INTO UserLog (User_id, User_Log_id) VALUES (10, 10);

INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (1, TO_TIMESTAMP('2025-03-24 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 603);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (2, TO_TIMESTAMP('2025-03-24 12:35:00', 'YYYY-MM-DD HH24:MI:SS'), 402);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (3, TO_TIMESTAMP('2025-03-24 12:40:00', 'YYYY-MM-DD HH24:MI:SS'), 603);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (4, TO_TIMESTAMP('2025-03-24 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 603);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (5, TO_TIMESTAMP('2025-03-24 12:50:00', 'YYYY-MM-DD HH24:MI:SS'), 402);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (6, TO_TIMESTAMP('2025-03-24 12:55:00', 'YYYY-MM-DD HH24:MI:SS'), 603);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (7, TO_TIMESTAMP('2025-03-24 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 603);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (8, TO_TIMESTAMP('2025-03-24 13:05:00', 'YYYY-MM-DD HH24:MI:SS'), 402);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (9, TO_TIMESTAMP('2025-03-24 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 603);
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code) VALUES (10, TO_TIMESTAMP('2025-03-24 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 603);

INSERT INTO Rule (id, Type, Expression, Description) VALUES (1, 'Regex', '^MT103.*', 'Message type must start with MT103');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (2, 'Length', '11', 'Sender BIC length must be 11 characters');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (3, 'Presence', 'NOT NULL', 'Receiver BIC must be present');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (4, 'Numeric Range', '> 0', 'Amount must be greater than 0');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (5, 'Date Format', 'YYYY-MM-DD HH24:MI:SS', 'Transaction timestamp must be in YYYY-MM-DD HH24:MI:SS format');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (6, 'BIC Validation', 'EXISTS (SELECT 1 FROM BIC_Directory WHERE BIC = :receiver_bic)', 'Receiver BIC must exist in BIC Directory');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (7, 'Currency Check', 'EXISTS (SELECT 1 FROM Currency WHERE CurrencyCode = :currency_code AND IsActive = 1)', 'Transaction currency must be active');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (8, 'Mandatory Field', 'NOT NULL', 'Details field cannot be empty');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (9, 'Account Format', '^[A-Z]{2}[0-9]{2}[A-Z0-9]{4}[0-9]{7}([A-Z0-9]{1,1,16})?$', 'Account number must match specific format');
INSERT INTO Rule (id, Type, Expression, Description) VALUES (10, 'Status Check', 'EXISTS (SELECT 1 FROM Status WHERE id = :status_id AND Category = ''Transaction'')', 'Transaction status must be valid');

INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (1, 1, 1);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (2, 1, 2);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (3, 2, 3);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (4, 3, 4);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (5, 4, 5);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (6, 5, 6);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (7, 6, 7);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (8, 7, 8);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (9, 8, 9);
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Rule_id) VALUES (10, 9, 10);

INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (1, 1);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (2, 1);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (3, 2);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (4, 3);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (5, 4);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (6, 5);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (7, 6);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (8, 7);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (9, 8);
INSERT INTO RuleLog (Message_Validation_Rule_id, Message_Validation_Log_id) VALUES (10, 9);
