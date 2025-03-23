-- Table: Access_Control_List
INSERT INTO Access_Control_List (id, "Resource", Permission) VALUES
(1, 'TransactionQueue', 1),
(2, 'SystemSettings', 2),
(3, 'ReportGeneration', 1),
(4, 'UserManagement', 2),
(5, 'MessageValidation', 1),
(6, 'TransactionReports', 1),
(7, 'SystemLogs', 2),
(8, 'UserLogs', 2),
(9, 'Configuration', 2),
(10, 'MessageRepair', 1);

-- Table: Activity
INSERT INTO Activity (id, Timestamp, Type, ResourceAccessed, SourceIP) VALUES
(1, '2025-03-23 10:00:00', 'Login', 'UI', '192.168.1.100'),
(2, '2025-03-23 10:05:00', 'TransactionApproval', 'TransactionQueue', '192.168.1.101'),
(3, '2025-03-23 10:10:00', 'ReportGeneration', 'ReportGenerator', '192.168.1.102'),
(4, '2025-03-23 10:15:00', 'ConfigurationChange', 'SystemSettings', '192.168.1.103'),
(5, '2025-03-23 10:20:00', 'MessageValidation', 'ValidationService', '192.168.1.104'),
(6, '2025-03-23 10:25:00', 'TransactionQuery', 'TransactionReports', '192.168.1.105'),
(7, '2025-03-23 10:30:00', 'SystemLogView', 'SystemLogs', '192.168.1.106'),
(8, '2025-03-23 10:35:00', 'UserLogView', 'UserLogs', '192.168.1.107'),
(9, '2025-03-23 10:40:00', 'ConfigurationView', 'Configuration', '192.168.1.108'),
(10, '2025-03-23 10:45:00', 'MessageRepair', 'MessageRepairTool', '192.168.1.109');

-- Table: All_MessageType
INSERT INTO All_MessageType (id, MessageType, Category_id, Description, StandardVersion, DocumentationLink) VALUES
(1, 'MT103', 1, 'Single Customer Credit Transfer', '2023', 'http://example.com/mt103'),
(2, 'MT202', 2, 'General Financial Institution Transfer', '2023', 'http://example.com/mt202'),
(3, 'MX_pain.001.001.03', 3, 'Customer Credit Transfer Initiation', '2023', 'http://example.com/mx_pain'),
(4, 'MT940', 1, 'Customer Statement Message', '2023', 'http://example.com/mt940'),
(5, 'MT950', 1, 'Statement Message', '2023', 'http://example.com/mt950'),
(6, 'MT101', 1, 'Request for Transfer', '2023', 'http://example.com/mt101'),
(7, 'MT200', 2, 'Financial Institution Transfer for its own account', '2023', 'http://example.com/mt200'),
(8, 'MX_camt.053.001.02', 3, 'Bank to Customer Statement', '2023', 'http://example.com/mx_camt'),
(9, 'MT540', 5, 'Receive Free of Payment', '2023', 'http://example.com/mt540'),
(10, 'MT542', 5, 'Deliver Free of Payment', '2023', 'http://example.com/mt542');

-- Table: BIC_Directory
INSERT INTO BIC_Directory (BIC, InstitutionName, Country) VALUES
('BANKUS33', 'Global Bank USA', 'US'),
('BANKGB2L', 'Global Bank UK', 'GB'),
('BANKFR1A', 'Global Bank France', 'FR'),
('BANKDEFF', 'Global Bank Germany', 'DE'),
('BANKJPJT', 'Global Bank Japan', 'JP'),
('BANKCACT', 'Global Bank Canada', 'CA'),
('BANKAUBB', 'Global Bank Australia', 'AU'),
('BANKCHZZ', 'Global Bank Switzerland', 'CH'),
('BANKCNBJ', 'Global Bank China', 'CN'),
('BANKINBB', 'Global Bank India', 'IN');

-- Table: Category
INSERT INTO Category (id, Category) VALUES
(1, 'Payments'),
(2, 'Treasury'),
(3, 'Cash Management'),
(4, 'Trade Services'),
(5, 'Securities'),
(6, 'Syndication'),
(7, 'Documentary Credits'),
(8, 'Travellers Cheques'),
(9, 'Cash Letters'),
(10, 'General');

-- Table: ColorCode
INSERT INTO ColorCode (id, ColorCode) VALUES
(1, 'Red'),
(2, 'Green'),
(3, 'Yellow'),
(4, 'Blue'),
(5, 'Orange'),
(6, 'Purple'),
(7, 'Gray'),
(8, 'Cyan'),
(9, 'Magenta'),
(10, 'Brown');

-- Table: Component
INSERT INTO Component (id, Name, Type, Description, Version, Vendor, InstallationDate, LastUpdated, Configuration) VALUES
(1, 'Alliance Access', 'Software', 'SWIFT messaging interface', '7.4', 'SWIFT', '2023-01-15', '2023-06-20', '<config><interface>TCP/IP</interface></config>'),
(2, 'HSM', 'Hardware', 'Hardware Security Module', 'v3.2', 'Thales', '2022-12-01', '2023-03-10', '<config><keyLength>2048</keyLength></config>'),
(3, 'Messaging Gateway', 'Software', 'Message routing service', '1.5', 'In-house', '2023-02-28', '2023-07-15', '<config><routing>XML</routing></config>'),
(4, 'Database Server', 'Software', 'Database for SWIFT data', 'MySQL 8.0', 'Oracle', '2022-11-10', '2023-08-01', '<config><database>SWIFT_DB</database></config>'),
(5, 'User Interface', 'Software', 'Web-based UI', '2.0', 'In-house', '2023-03-05', '2023-09-02', '<config><framework>React</framework></config>'),
(6, 'Validation Service', 'Software', 'Message validation service', '1.2', 'In-house', '2023-04-10', '2023-10-10', '<config><rules>MFVR</rules></config>'),
(7, 'Report Generator', 'Software', 'Reporting tool', '1.3', 'In-house', '2023-05-15', '2023-11-15', '<config><format>PDF</format></config>'),
(8, 'Message Repair Tool', 'Software', 'Message editing tool', '1.1', 'In-house', '2023-06-20', '2023-12-20', '<config><features>Edit</features></config>'),
(9, 'Logging Service', 'Software', 'System logging service', '1.4', 'In-house', '2023-07-25', '2024-01-25', '<config><level>Info</level></config>'),
(10, 'Security Module', 'Software', 'Security related services', '2.1', 'In-house', '2023-08-30', '2024-02-28', '<config><authentication>OAuth2</authentication></config>');

-- Table: Correlation_Repository
INSERT INTO Correlation_Repository (id, Transaction_id, Timestamp, MessageDetails, DomainName_id, Direction_id, ColorCode_id, Status_id) VALUES
(1, 1, '2025-03-23 10:00:00', 'MT103 transaction', 1, 1, 2, 2),
(2, 2, '2025-03-23 10:05:00', 'MT202 transaction', 1, 2, 3, 3),
(3, 3, '2025-03-23 10:10:00', 'MX transaction', 2, 1, 1, 1),
(4, 4, '2025-03-23 10:15:00', 'MT940 transaction', 1, 2, 2, 2),
(5, 5, '2025-03-23 10:20:00', 'MT950 transaction', 1, 1, 3, 3),
(6, 6, '2025-03-23 10:25:00', 'MT101 transaction', 1, 2, 1, 1),
(7, 7, '2025-03-23 10:30:00', 'MT200 transaction', 2, 1, 2, 2),
(8, 8, '2025-03-23 10:35:00', 'MX camt transaction', 2, 2, 3, 3),
(9, 9, '2025-03-23 10:40:00', 'MT540 transaction', 3, 1, 1, 1),
(10, 10, '2025-03-23 10:45:00', 'MT542 transaction', 3, 2, 2, 2);

-- Table: Currency
INSERT INTO Currency (id, Currency) VALUES
(1, 'USD'),
(2, 'EUR'),
(3, 'GBP'),
(4, 'JPY'),
(5, 'CAD'),
(6, 'AUD'),
(7, 'CHF'),
(8, 'CNY'),
(9, 'INR'),
(10, 'SGD');

-- Table: Direction
INSERT INTO Direction (id, Direction) VALUES
(1, 'Inbound'),
(2, 'Outbound'),
(3, 'Internal'),
(4, 'External'),
(5, 'Forward'),
(6, 'Backward'),
(7, 'Loopback'),
(8, 'Redirect'),
(9, 'Proxy'),
(10, 'Tunnel');

-- Table: DomainName
INSERT INTO DomainName (id, DomainName) VALUES
(1, 'SWIFT Network'),
(2, 'Internal Network'),
(3, 'External Partner'),
(4, 'Local System'),
(5, 'Test System'),
(6, 'Production System'),
(7, 'Development System'),
(8, 'Staging System'),
(9, 'Backup System'),
(10, 'Recovery System');

-- Table: Error_Message
INSERT INTO Error_Message (Code, Message, Severity_id, Description, Source_Component_id, Component_id) VALUES
(1001, 'Invalid BIC', 1, 'BIC not found in directory', 1, 6),
(1002, 'Invalid Currency', 1, 'Currency code not recognized', 1, 6),
(1003, 'Schema Validation Failed', 1, 'Message does not conform to XSD', 2, 6),
(1004, 'MFVR Validation Failed', 2, 'Message failed MFVR rules', 2, 6),
(1005, 'Database Connection Error', 1, 'Could not connect to database', 3, 4),
(1006, 'User Authentication Failed', 1, 'Invalid username or password', 4, 10),
(1007, 'Configuration Error', 2, 'Invalid configuration parameter', 5, 9),
(1008, 'File Transfer Error', 1, 'Error transferring file', 6, 1),
(1009, 'Message Repair Failed', 2, 'Error repairing message', 7, 8),
(1010, 'Report Generation Failed', 1, 'Error generating report', 8, 7);

-- Table: EventType_Massage
INSERT INTO EventType_Massage (id, EventType) VALUES
(1, 'Validation Start'),
(2, 'Validation End'),
(3, 'Schema Validation'),
(4, 'MFVR Validation'),
(5, 'BIC Validation'),
(6, 'Currency Validation'),
(7, 'Message Received'),
(8, 'Message Sent'),
(9, 'Message Repair'),
(10, 'Message Routing');

-- Table: EventType_Transaction
INSERT INTO EventType_Transaction (id, EventType) VALUES
(1, 'Transaction Start'),
(2, 'Transaction End'),
(3, 'Transaction Approval'),
(4, 'Transaction Rejection'),
(5, 'Transaction Query'),
(6, 'Transaction Update'),
(7, 'Transaction Cancellation'),
(8, 'Transaction Status Change'),
(9, 'Transaction Import'),
(10, 'Transaction Export');

-- Table: EventType_User
INSERT INTO EventType_User (id, EventType) VALUES
(1, 'Login'),
(2, 'Logout'),
(3, 'User Creation'),
(4, 'User Update'),
(5, 'User Deletion'),
(6, 'Password Change'),
(7, 'Access Granted'),
(8, 'Access Denied'),
(9, 'Role Assignment'),
(10, 'Role Removal');

-- Table: Message_Type
INSERT INTO Message_Type (id, MessageType_id, IsMX) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 1),
(4, 4, 0),
(5, 5, 0),
(6, 6, 0),
(7, 7, 0),
(8, 8, 1),
(9, 9, 0),
(10, 10, 0);

-- Table: Message_Validation_Alert
INSERT INTO Message_Validation_Alert (id, Type, Timestamp, Resolved, Message_Validation_Log_id) VALUES
(1, 'Invalid BIC Alert', '2025-03-23 10:05:00', 0, 1),
(2, 'Invalid Currency Alert', '2025-03-23 10:10:00', 0, 2),
(3, 'Schema Validation Alert', '2025-03-23 10:15:00', 1, 3),
(4, 'MFVR Validation Alert', '2025-03-23 10:20:00', 0, 4),
(5, 'BIC Validation Alert', '2025-03-23 10:25:00', 1, 5),
(6, 'Currency Validation Alert', '2025-03-23 10:30:00', 0, 6),
(7, 'Message Received Alert', '2025-03-23 10:35:00', 1, 7),
(8, 'Message Sent Alert', '2025-03-23 10:40:00', 0, 8),
(9, 'Message Repair Alert', '2025-03-23 10:45:00', 1, 9),
(10, 'Message Routing Alert', '2025-03-23 10:50:00', 0, 10);

-- Table: Message_Validation_Log
INSERT INTO Message_Validation_Log (id, Timestamp, Error_Message_Code, Message_Validation_Rule_id, EventType_Massage_id) VALUES
(1, '2025-03-23 10:05:00', 1001, 1, 5),
(2, '2025-03-23 10:10:00', 1002, 2, 6),
(3, '2025-03-23 10:15:00', 1003, 3, 3),
(4, '2025-03-23 10:20:00', 1004, 4, 4),
(5, '2025-03-23 10:25:00', 1001, 5, 5),
(6, '2025-03-23 10:30:00', 1002, 6, 6),
(7, '2025-03-23 10:35:00', 1003, 7, 7),
(8, '2025-03-23 10:40:00', 1004, 8, 8),
(9, '2025-03-23 10:45:00', 1001, 9, 9),
(10, '2025-03-23 10:50:00', 1002, 10, 10);

-- Table: Message_Validation_Rule
INSERT INTO Message_Validation_Rule (id, Message_Types_id, Role_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- Table: ReceiverBIC
INSERT INTO ReceiverBIC (BIC_Directory_BIC, SWIFT_Transactions_id) VALUES
('BANKGB2L', 1),
('BANKFR1A', 2),
('BANKDEFF', 3),
('BANKJPJT', 4),
('BANKCACT', 5),
('BANKAUBB', 6),
('BANKCHZZ', 7),
('BANKCNBJ', 8),
('BANKINBB', 9),
('BANKUS33', 10);

-- Table: Role
INSERT INTO Role (id, RuleType, RuleDescription, RuleExpression) VALUES
(1, 'MFVR', 'Amount must be positive', 'Amount > 0'),
(2, 'MFVR', 'Currency must be in ISO list', 'Currency in (USD, EUR, GBP)'),
(3, 'Schema', 'Message must conform to XSD', 'XSD validation'),
(4, 'BIC', 'BIC must exist in directory', 'BIC in BIC_Directory'),
(5, 'IBAN', 'IBAN must be valid', 'IBAN validation'),
(6, 'Country', 'Country must be in ISO list', 'Country in (US, GB, FR)'),
(7, 'Date', 'Date must be in valid format', 'Date format YYYY-MM-DD'),
(8, 'Time', 'Time must be in valid format', 'Time format HH:MM:SS'),
(9, 'Length', 'Field length must be within limits', 'Length(field) < 255'),
(10, 'Regex', 'Field must match pattern', 'Regex validation');

-- Table: SenderBIC
INSERT INTO SenderBIC (BIC_Directory_BIC, Transactions_id) VALUES
('BANKUS33', 1),
('BANKGB2L', 2),
('BANKFR1A', 3),
('BANKDEFF', 4),
('BANKJPJT', 5),
('BANKCACT', 6),
('BANKAUBB', 7),
('BANKCHZZ', 8),
('BANKCNBJ', 9),
('BANKINBB', 10);

-- Table: Severity
INSERT INTO Severity (id, Severity) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Table: Source_Component
INSERT INTO Source_Component (id, Source_Component) VALUES
(1, 'Validation Service'),
(2, 'Schema Validator'),
(3, 'Database Connector'),
(4, 'Authentication Module'),
(5, 'Configuration Manager'),
(6, 'File Transfer'),
(7, 'Message Repair'),
(8, 'Report Generator'),
(9, 'Log Collector'),
(10, 'Security Module');

-- Table: Status
INSERT INTO Status (id, Status) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Completed'),
(4, 'Failed'),
(5, 'Cancelled'),
(6, 'Rejected'),
(7, 'Approved'),
(8, 'On Hold'),
(9, 'Retried'),
(10, 'Timeout');

-- Table: System_Alert
INSERT INTO System_Alert (id, SWIFT_System_Logs_id, Type, Timestamp, Resolved) VALUES
(1, 1, 'Login Failure', '2025-03-23 10:05:00', 0),
(2, 2, 'Configuration Change', '2025-03-23 10:10:00', 1),
(3, 3, 'Database Error', '2025-03-23 10:15:00', 0),
(4, 4, 'File Transfer Failure', '2025-03-23 10:20:00', 1),
(5, 5, 'Security Alert', '2025-03-23 10:25:00', 0),
(6, 6, 'System Restart', '2025-03-23 10:30:00', 1),
(7, 7, 'Memory Usage High', '2025-03-23 10:35:00', 0),
(8, 8, 'Network Error', '2025-03-23 10:40:00', 1),
(9, 9, 'Disk Space Low', '2025-03-23 10:45:00', 0),
(10, 10, 'Timeout Alert', '2025-03-23 10:50:00', 1);

-- Table: Transaction
INSERT INTO Transaction (id, Timestamp, Amount, Message_Types_id, Currency_id, Transaction_Status_id, Details) VALUES
(1, '2025-03-23 10:00:00', 100000.00, 1, 1, 3, 'MT103 transaction details'),
(2, '2025-03-23 10:05:00', 50000.00, 2, 2, 3, 'MT202 transaction details'),
(3, '2025-03-23 10:10:00', 200000.00, 3, 3, 3, 'MX pain transaction details'),
(4, '2025-03-23 10:15:00', 75000.00, 4, 4, 3, 'MT940 transaction details'),
(5, '2025-03-23 10:20:00', 150000.00, 5, 5, 3, 'MT950 transaction details'),
(6, '2025-03-23 10:25:00', 300000.00, 6, 6, 3, 'MT101 transaction details'),
(7, '2025-03-23 10:30:00', 120000.00, 7, 7, 3, 'MT200 transaction details'),
(8, '2025-03-23 10:35:00', 250000.00, 8, 8, 3, 'MX camt transaction details'),
(9, '2025-03-23 10:40:00', 80000.00, 9, 9, 3, 'MT540 transaction details'),
(10, '2025-03-23 10:45:00', 180000.00, 10, 10, 3, 'MT542 transaction details');

-- Table: Transaction_Alert
INSERT INTO Transaction_Alert (id, Type, Timestamp, Resolved, System_Log_id) VALUES
(1, 'Amount Too High', '2025-03-23 10:05:00', 0, 1),
(2, 'Invalid Currency', '2025-03-23 10:10:00', 0, 2),
(3, 'Message Format Error', '2025-03-23 10:15:00', 1, 3),
(4, 'BIC Not Found', '2025-03-23 10:20:00', 0, 4),
(5, 'IBAN Invalid', '2025-03-23 10:25:00', 1, 5),
(6, 'Country Code Error', '2025-03-23 10:30:00', 0, 6),
(7, 'Date Format Error', '2025-03-23 10:35:00', 1, 7),
(8, 'Time Format Error', '2025-03-23 10:40:00', 0, 8),
(9, 'Length Exceeded', '2025-03-23 10:45:00', 1, 9),
(10, 'Regex Mismatch', '2025-03-23 10:50:00', 0, 10);

-- Table: Transaction_Log
INSERT INTO Transaction_Log (id, Timestamp, Error_Message_Code, Transaction_id, EventType_Transaction_id) VALUES
(1, '2025-03-23 10:05:00', 1001, 1, 1),
(2, '2025-03-23 10:10:00', 1002, 2, 2),
(3, '2025-03-23 10:15:00', 1003, 3, 3),
(4, '2025-03-23 10:20:00', 1004, 4, 4),
(5, '2025-03-23 10:25:00', 1001, 5, 5),
(6, '2025-03-23 10:30:00', 1002, 6, 6),
(7, '2025-03-23 10:35:00', 1003, 7, 7),
(8, '2025-03-23 10:40:00', 1004, 8, 8),
(9, '2025-03-23 10:45:00', 1001, 9, 9),
(10, '2025-03-23 10:50:00', 1002, 10, 10);

-- Table: Transaction_Status
INSERT INTO Transaction_Status (id, TransactionStatus) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Completed'),
(4, 'Failed'),
(5, 'Cancelled'),
(6, 'Rejected'),
(7, 'Approved'),
(8, 'On Hold'),
(9, 'Retried'),
(10, 'Timeout');

-- Table: User
INSERT INTO "User" (id, Username, Role) VALUES
(1, 'alice', 'Admin'),
(2, 'bob', 'User'),
(3, 'charlie', 'Manager'),
(4, 'david', 'User'),
(5, 'eve', 'Admin'),
(6, 'frank', 'User'),
(7, 'grace', 'Manager'),
(8, 'henry', 'User'),
(9, 'irene', 'Admin'),
(10, 'jack', 'User');

-- Table: User_Access
INSERT INTO User_Access (User_id, Access_Control_List_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 1),
(4, 5),
(5, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 10),
(9, 1);

-- Table: User_Activity
INSERT INTO User_Activity (User_id, Activity_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Table: User_BIC
INSERT INTO User_BIC (BIC_Directory_BIC, Users_id) VALUES
('BANKUS33', 1),
('BANKGB2L', 2),
('BANKFR1A', 3),
('BANKDEFF', 4),
('BANKJPJT', 5),
('BANKCACT', 6),
('BANKAUBB', 7),
('BANKCHZZ', 8),
('BANKCNBJ', 9),
('BANKINBB', 10);

-- Table: User_Log
INSERT INTO User_Log (id, Timestamp, EventType, Error_Message_Code, User_id, EventType_User_id) VALUES
(1, '2025-03-23 10:05:00', 'Login', 1006, 1, 1),
(2, '2025-03-23 10:10:00', 'Logout', NULL, 2, 2),
(3, '2025-03-23 10:15:00', 'User Creation', NULL, 3, 3),
(4, '2025-03-23 10:20:00', 'User Update', NULL, 4, 4),
(5, '2025-03-23 10:25:00', 'User Deletion', NULL, 5, 5),
(6, '2025-03-23 10:30:00', 'Password Change', NULL, 6, 6),
(7, '2025-03-23 10:35:00', 'Access Granted', NULL, 7, 7),
(8, '2025-03-23 10:40:00', 'Access Denied', NULL, 8, 8),
(9, '2025-03-23 10:45:00', 'Role Assignment', NULL, 9, 9),
(10, '2025-03-23 10:50:00', 'Role Removal', NULL, 10, 10);

-- Table: XSD_Schemas
INSERT INTO XSD_Schemas (id, SchemaName, TargetNamespace, FilePath, Description, Version, Message_Type_id) VALUES
(1, 'MT103.xsd', 'urn:swift:xsd:mt103', '/path/to/MT103.xsd', 'XSD for MT103', '2023', 1),
(2, 'MT202.xsd', 'urn:swift:xsd:mt202', '/path/to/MT202.xsd', 'XSD for MT202', '2023', 2),
(3, 'pain.001.001.03.xsd', 'urn:swift:xsd:pain.001.001.03', '/path/to/pain.xsd', 'XSD for pain.001.001.03', '2023', 3),
(4, 'MT940.xsd', 'urn:swift:xsd:mt940', '/path/to/MT940.xsd', 'XSD for MT940', '2023', 4),
(5, 'MT950.xsd', 'urn:swift:xsd:mt950', '/path/to/MT950.xsd', 'XSD for MT950', '2023', 5),
(6, 'MT101.xsd', 'urn:swift:xsd:mt101', '/path/to/MT101.xsd', 'XSD for MT101', '2023', 6),
(7, 'MT200.xsd', 'urn:swift:xsd:mt200', '/path/to/MT200.xsd', 'XSD for MT200', '2023', 7),
(8, 'camt.053.001.02.xsd', 'urn:swift:xsd:camt.053.001.02', '/path/to/camt.xsd', 'XSD for camt.053.001.02', '2023', 8),
(9, 'MT540.xsd', 'urn:swift:xsd:mt540', '/path/to/MT540.xsd', 'XSD for MT540', '2023', 9),
(10, 'MT542.xsd', 'urn:swift:xsd:mt542', '/path/to/MT542.xsd', 'XSD for MT542', '2023', 10);
