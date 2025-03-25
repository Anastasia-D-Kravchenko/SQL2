-- USER ---------------------------------------------
CREATE TABLE "User" (
id INTEGER NOT NULL,
PESEL CHAR(11) NOT NULL,
Username VARCHAR2(255) NOT NULL,
Name VARCHAR2(20) NOT NULL,
Surname VARCHAR2(20) NOT NULL,
CONSTRAINT Users_pk PRIMARY KEY (id)
);

CREATE TABLE User_Log (
id INTEGER NOT NULL,
Timestamp TIMESTAMP NOT NULL,
Error_Message_Code INTEGER NULL,
CONSTRAINT User_Log_pk PRIMARY KEY (id)
);

CREATE TABLE UserLog (
User_id INTEGER NOT NULL,
User_Log_id INTEGER NOT NULL,
CONSTRAINT UserLog_pk PRIMARY KEY (User_id, User_Log_id)
);

CREATE TABLE Role (
id INTEGER NOT NULL,
Role VARCHAR2(255) NOT NULL,
CONSTRAINT Role_pk PRIMARY KEY (id)
);

CREATE TABLE Access_Control_List (
id INTEGER NOT NULL,
"Resource" VARCHAR2(255) NOT NULL,
Permission INTEGER NOT NULL,
CONSTRAINT Access_Control_List_pk PRIMARY KEY (id)
);

CREATE TABLE User_Role_Access (
Role_id INTEGER NOT NULL,
User_id INTEGER NOT NULL,
Access_Control_List_id INTEGER NOT NULL,
IBAN_id INTEGER NOT NULL,
CONSTRAINT User_Role_Access_pk PRIMARY KEY (Role_id, User_id, Access_Control_List_id, IBAN_id)
);

-- BIC ---------------------------------------------
CREATE TABLE BIC_Directory (
id INTEGER NOT NULL,
BIC VARCHAR2(11) NOT NULL,
InstitutionName VARCHAR2(255) NULL,
Country VARCHAR2(2) NULL,
CONSTRAINT BIC_Directory_pk PRIMARY KEY (ID),
CONSTRAINT BIC_Directory_uk UNIQUE (BIC)
);

CREATE TABLE IBAN (
id INTEGER NOT NULL,
IBAN VARCHAR2(34) NOT NULL,
HolderName VARCHAR2(255) NOT NULL,
AccountNumber VARCHAR2(50) NOT NULL,
Currency_CurrencyCode VARCHAR2(3) NOT NULL,
AccountType_id INTEGER NOT NULL,
Status_id INTEGER NOT NULL,
CreationDate DATE NOT NULL,
CONSTRAINT IBAN_pk PRIMARY KEY (id),
CONSTRAINT IBAN_uk UNIQUE (IBAN)
);

CREATE TABLE IBAN_BIC (
IBAN_id INTEGER NOT NULL,
BIC_Directory_id INTEGER NOT NULL,
CONSTRAINT IBAN_BIC_pk PRIMARY KEY (IBAN_id, BIC_Directory_id)
);

CREATE TABLE AccountType (
id INTEGER NOT NULL,
AccountType VARCHAR2(50) NOT NULL,
CONSTRAINT AccountType_pk PRIMARY KEY (id)
);

CREATE TABLE Status (
id INTEGER NOT NULL,
Status VARCHAR2(20) NOT NULL,
Category VARCHAR2(50) NOT NULL,
CONSTRAINT Status_pk PRIMARY KEY (id)
);

-- TRANSACTION ---------------------------------------------
CREATE TABLE Currency (
CurrencyCode VARCHAR2(3) NOT NULL,
ExchangeRateToUSD NUMBER(18,8) NOT NULL,
ExchangeRateLastUpdated TIMESTAMP NOT NULL,
IsActive INTEGER NOT NULL,
CONSTRAINT Currency_pk PRIMARY KEY (CurrencyCode)
);

CREATE TABLE Message_Type (
id INTEGER NOT NULL,
MessageType VARCHAR2(20) NOT NULL,
Category_id INTEGER NOT NULL,
Description VARCHAR2(255) NOT NULL,
StandardVersion VARCHAR2(20) NOT NULL,
DocumentationLink VARCHAR2(255) NOT NULL,
CONSTRAINT Message_Type_pk PRIMARY KEY (id)
);

CREATE TABLE Category (
id INTEGER NOT NULL,
Category VARCHAR2(18) NOT NULL,
CONSTRAINT Category_pk PRIMARY KEY (id)
);

CREATE TABLE Transaction (
id INTEGER NOT NULL,
Timestamp TIMESTAMP NOT NULL,
Currency_CurrencyCode VARCHAR2(3) NOT NULL,
Amount NUMBER(20,2) NOT NULL,
Status_id INTEGER NOT NULL,
Message_Types_id INTEGER NOT NULL,
Details VARCHAR2(255) NOT NULL,
CONSTRAINT Transaction_pk PRIMARY KEY (id)
);

CREATE TABLE SenderBIC (
BIC_Directory_id INTEGER NOT NULL,
Transactions_id INTEGER NOT NULL,
CONSTRAINT SenderBIC_pk PRIMARY KEY (BIC_Directory_id, Transactions_id)
);

CREATE TABLE ReceiverBIC (
BIC_Directory_id INTEGER NOT NULL,
Transactions_id INTEGER NOT NULL,
CONSTRAINT ReceiverBIC_pk PRIMARY KEY (BIC_Directory_id, Transactions_id)
);

CREATE TABLE Transaction_Log (
id INTEGER NOT NULL,
Timestamp TIMESTAMP NOT NULL,
Error_Message_Code INTEGER NULL,
CONSTRAINT Transaction_Log_pk PRIMARY KEY (id)
);

CREATE TABLE TransactionLog (
Transaction_id INTEGER NOT NULL,
Transaction_Log_id INTEGER NOT NULL,
CONSTRAINT TransactionLog_pk PRIMARY KEY (Transaction_id, Transaction_Log_id)
);

-- ERROR ---------------------------------------------
CREATE TABLE Error_Message (
Code INTEGER NOT NULL,
Message VARCHAR2(255) NOT NULL,
Severity_id INTEGER NOT NULL,
Component_id INTEGER NOT NULL,
EventType_id INTEGER NOT NULL,
Description VARCHAR2(255) NOT NULL,
CONSTRAINT Error_Message_pk PRIMARY KEY (Code)
);

CREATE TABLE Severity (
id INTEGER NOT NULL,
Severity VARCHAR2(50) NOT NULL,
CONSTRAINT Severity_pk PRIMARY KEY (id)
);

CREATE TABLE Component (
id INTEGER NOT NULL,
Name VARCHAR2(255) NOT NULL,
Type VARCHAR2(255) NOT NULL,
Description VARCHAR2(255) NOT NULL,
Version VARCHAR2(50) NOT NULL,
Vendor VARCHAR2(255) NOT NULL,
InstallationDate DATE NOT NULL,
LastUpdated DATE NOT NULL,
Configuration XMLTYPE NOT NULL,
CONSTRAINT Component_pk PRIMARY KEY (id)
);

CREATE TABLE EventType (
id INTEGER NOT NULL,
Type VARCHAR2(255) NOT NULL,
ResourceAccessed VARCHAR2(255) NOT NULL,
SourceIP VARCHAR2(46) NOT NULL,
CONSTRAINT EventType_pk PRIMARY KEY (id)
);

CREATE TABLE Alert (
id INTEGER NOT NULL,
Type VARCHAR2(255) NOT NULL,
Timestamp TIMESTAMP NOT NULL,
Error_Message_Code INTEGER NOT NULL,
Status_id INTEGER NOT NULL,
Resolved INTEGER NOT NULL,
CONSTRAINT Alert_pk PRIMARY KEY (id)
);

CREATE TABLE Message_Validation_Log (
id INTEGER NOT NULL,
Timestamp TIMESTAMP NOT NULL,
Error_Message_Code INTEGER NULL,
CONSTRAINT Message_Validation_Log_pk PRIMARY KEY (id)
);

CREATE TABLE Message_Validation_Rule (
id INTEGER NOT NULL,
Message_Types_id INTEGER NOT NULL,
Rule_id INTEGER NOT NULL,
CONSTRAINT Message_Validation_Rule_pk PRIMARY KEY (id)
);

CREATE TABLE Rule (
id INTEGER NOT NULL,
Type VARCHAR2(50) NOT NULL,
Expression VARCHAR2(255) NOT NULL,
Description VARCHAR2(255) NOT NULL,
CONSTRAINT Rule_pk PRIMARY KEY (id)
);

CREATE TABLE RuleLog (
Message_Validation_Rule_id INTEGER NOT NULL,
Message_Validation_Log_id INTEGER NOT NULL,
CONSTRAINT RuleLog_pk PRIMARY KEY (Message_Validation_Rule_id, Message_Validation_Log_id)
);


-- Foreign key ---------------------------------------------
ALTER TABLE Alert ADD CONSTRAINT Alert_Error_Message FOREIGN KEY (Error_Message_Code) REFERENCES Error_Message (Code);
ALTER TABLE Alert ADD CONSTRAINT Alert_Status FOREIGN KEY (Status_id) REFERENCES Status (id);
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Component FOREIGN KEY (Component_id) REFERENCES Component (id);
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_EventType FOREIGN KEY (EventType_id) REFERENCES EventType (id);
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Severity FOREIGN KEY (Severity_id) REFERENCES Severity (id);
ALTER TABLE IBAN ADD CONSTRAINT IBAN_AccountType FOREIGN KEY (AccountType_id) REFERENCES AccountType (id);
ALTER TABLE IBAN_BIC ADD CONSTRAINT IBAN_BIC_BIC_Directory FOREIGN KEY (BIC_Directory_id) REFERENCES BIC_Directory (id);
ALTER TABLE IBAN ADD CONSTRAINT IBAN_Currency FOREIGN KEY (Currency_CurrencyCode) REFERENCES Currency (CurrencyCode);
ALTER TABLE IBAN ADD CONSTRAINT IBAN_Status FOREIGN KEY (Status_id) REFERENCES Status (id);
ALTER TABLE Message_Validation_Log ADD CONSTRAINT Log_Error_Message FOREIGN KEY (Error_Message_Code) REFERENCES Error_Message (Code);
ALTER TABLE Message_Type ADD CONSTRAINT Message_Type_Category FOREIGN KEY (Category_id) REFERENCES Category (id);
ALTER TABLE Message_Validation_Rule ADD CONSTRAINT Message_Validation_Rule_Rule FOREIGN KEY (Rule_id) REFERENCES Rule (id);
ALTER TABLE ReceiverBIC ADD CONSTRAINT ReceiverBIC_BIC_Directory FOREIGN KEY (BIC_Directory_id) REFERENCES BIC_Directory (id);
ALTER TABLE ReceiverBIC ADD CONSTRAINT ReceiverBIC_Transactions FOREIGN KEY (Transactions_id) REFERENCES Transaction (id);
ALTER TABLE RuleLog ADD CONSTRAINT Rule_Log_Message_Log FOREIGN KEY (Message_Validation_Log_id) REFERENCES Message_Validation_Log (id);
ALTER TABLE RuleLog ADD CONSTRAINT Rule_Log_Message_Rule FOREIGN KEY (Message_Validation_Rule_id) REFERENCES Message_Validation_Rule (id);
ALTER TABLE Message_Validation_Rule ADD CONSTRAINT Rule_Message_Type FOREIGN KEY (Message_Types_id) REFERENCES Message_Type (id);
ALTER TABLE SenderBIC ADD CONSTRAINT SenderBIC_BIC_Directory FOREIGN KEY (BIC_Directory_id) REFERENCES BIC_Directory (id);
ALTER TABLE SenderBIC ADD CONSTRAINT SenderBIC_Transaction FOREIGN KEY (Transactions_id) REFERENCES Transaction (id);
ALTER TABLE User_Log ADD CONSTRAINT System_Log_Error_M FOREIGN KEY (Error_Message_Code) REFERENCES Error_Message (Code);
ALTER TABLE Transaction_Log ADD CONSTRAINT System_Log_Error_Message FOREIGN KEY (Error_Message_Code) REFERENCES Error_Message (Code);
ALTER TABLE TransactionLog ADD CONSTRAINT TransactionLog_Transaction FOREIGN KEY (Transaction_id) REFERENCES Transaction (id);
ALTER TABLE TransactionLog ADD CONSTRAINT TransactionLog_Transaction_Log FOREIGN KEY (Transaction_Log_id) REFERENCES Transaction_Log (id);
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Currency FOREIGN KEY (Currency_CurrencyCode) REFERENCES Currency (CurrencyCode);
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Message_Type FOREIGN KEY (Message_Types_id) REFERENCES Message_Type (id);
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Transaction_Status FOREIGN KEY (Status_id) REFERENCES Status (id);
ALTER TABLE UserLog ADD CONSTRAINT UserLog_User FOREIGN KEY (User_id) REFERENCES "User" (id);
ALTER TABLE UserLog ADD CONSTRAINT UserLog_User_Log FOREIGN KEY (User_Log_id) REFERENCES User_Log (id);
ALTER TABLE IBAN_BIC ADD CONSTRAINT User_BIC_IBAN FOREIGN KEY (IBAN_id) REFERENCES IBAN (id);
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_Access_Control_List FOREIGN KEY (Access_Control_List_id) REFERENCES Access_Control_List (id);
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_Access_IBAN FOREIGN KEY (IBAN_id) REFERENCES IBAN (id);
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_Role FOREIGN KEY (Role_id) REFERENCES Role (id);
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_User FOREIGN KEY (User_id) REFERENCES "User" (id);
