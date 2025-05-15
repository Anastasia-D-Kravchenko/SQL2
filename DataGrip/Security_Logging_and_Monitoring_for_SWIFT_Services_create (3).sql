-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-04-21 20:33:04.499

-- tables
-- Table: Access_Control_List
CREATE TABLE Access_Control_List (
    id integer  NOT NULL,
    "Resource" varchar2(255)  NOT NULL,
    Permission integer  NOT NULL,
    CONSTRAINT Access_Control_List_pk PRIMARY KEY (id)
) ;

-- Table: AccountType
CREATE TABLE AccountType (
    id integer  NOT NULL,
    AccountType varchar2(50)  NOT NULL,
    CONSTRAINT AccountType_pk PRIMARY KEY (id)
) ;

-- Table: Alert
CREATE TABLE Alert (
    id integer  NOT NULL,
    Type varchar2(255)  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NOT NULL,
    Resolved integer  NOT NULL,
    Status_id integer  NOT NULL,
    CONSTRAINT Alert_pk PRIMARY KEY (id)
) ;

-- Table: BIC_Directory
CREATE TABLE BIC_Directory (
    id integer  NOT NULL,
    BIC varchar2(11)  NOT NULL,
    InstitutionName varchar2(255)  NULL,
    Country varchar2(2)  NULL,
    CONSTRAINT BIC_Directory_pk PRIMARY KEY (id)
) ;

-- Table: Category
CREATE TABLE Category (
    id integer  NOT NULL,
    Category varchar2(18)  NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY (id)
) ;

-- Table: Component
CREATE TABLE Component (
    id integer  NOT NULL,
    Name varchar2(255)  NOT NULL,
    Type varchar2(255)  NOT NULL,
    Description varchar2(255)  NOT NULL,
    Version varchar2(50)  NOT NULL,
    Vendor varchar2(255)  NOT NULL,
    InstallationDate date  NOT NULL,
    LastUpdated date  NOT NULL,
    Configuration xmltype  NOT NULL, -- clob
    CONSTRAINT Component_pk PRIMARY KEY (id)
) ;

-- Table: Currency
CREATE TABLE Currency (
    CurrencyCode varchar2(3)  NOT NULL,
    ExchangeRateToUSD number(18,8)  NOT NULL,
    ExchangeRateLastUpdated timestamp  NOT NULL,
    IsActive integer  NOT NULL,
    CONSTRAINT Currency_pk PRIMARY KEY (CurrencyCode)
) ;

-- Table: Error_Message
CREATE TABLE Error_Message (
    Code integer  NOT NULL,
    Message varchar2(255)  NOT NULL,
    Severity_id integer  NOT NULL,
    Component_id integer  NOT NULL,
    EventType_id integer  NOT NULL,
    Description varchar2(255)  NOT NULL,
    CONSTRAINT Error_Message_pk PRIMARY KEY (Code)
) ;

-- Table: EventType
CREATE TABLE EventType (
    id integer  NOT NULL,
    Type varchar2(255)  NOT NULL,
    ResourceAccessed varchar2(255)  NOT NULL,
    SourceIP varchar2(46)  NOT NULL,
    CONSTRAINT EventType_pk PRIMARY KEY (id)
) ;

-- Table: IBAN
CREATE TABLE IBAN (
    id integer  NOT NULL,
    IBAN varchar2(34)  NOT NULL,
    HolderName varchar2(255)  NOT NULL,
    AccountNumber varchar2(50)  NOT NULL,
    Currency_CurrencyCode varchar2(3)  NOT NULL,
    AccountType_id integer  NOT NULL,
    Status_id integer  NOT NULL,
    CreationDate date  NOT NULL,
    CONSTRAINT IBAN_pk PRIMARY KEY (id)
) ;

-- Table: IBAN_BIC
CREATE TABLE IBAN_BIC (
    IBAN_id integer  NOT NULL,
    BIC_Directory_id integer  NOT NULL,
    CONSTRAINT IBAN_BIC_pk PRIMARY KEY (IBAN_id,BIC_Directory_id)
) ;

-- Table: Message_Type
CREATE TABLE Message_Type (
    id integer  NOT NULL,
    MessageType varchar2(20)  NOT NULL,
    Category_id integer  NOT NULL,
    Description varchar2(255)  NOT NULL,
    StandardVersion varchar2(20)  NOT NULL,
    DocumentationLink varchar2(255)  NOT NULL,
    CONSTRAINT Message_Type_pk PRIMARY KEY (id)
) ;

-- Table: Message_Validation_Log
CREATE TABLE Message_Validation_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NULL,
    CONSTRAINT Message_Validation_Log_pk PRIMARY KEY (id)
) ;

-- Table: Message_Validation_Rule
CREATE TABLE Message_Validation_Rule (
    id integer  NOT NULL,
    Message_Types_id integer  NOT NULL,
    Rule_id integer  NOT NULL,
    CONSTRAINT Message_Validation_Rule_pk PRIMARY KEY (id)
) ;

-- Table: ReceiverBIC
CREATE TABLE ReceiverBIC (
    Transactions_id integer  NOT NULL,
    BIC_Directory_id integer  NOT NULL,
    CONSTRAINT ReceiverBIC_pk PRIMARY KEY (Transactions_id,BIC_Directory_id)
) ;

-- Table: Role
CREATE TABLE Role (
    id integer  NOT NULL,
    Role varchar2(255)  NOT NULL,
    CONSTRAINT Role_pk PRIMARY KEY (id)
) ;

-- Table: Rule
CREATE TABLE Rule (
    id integer  NOT NULL,
    Type varchar2(50)  NOT NULL,
    Expression varchar2(255)  NOT NULL,
    Description varchar2(255)  NOT NULL,
    CONSTRAINT Rule_pk PRIMARY KEY (id)
) ;

-- Table: RuleLog
CREATE TABLE RuleLog (
    Message_Validation_Rule_id integer  NOT NULL,
    Message_Validation_Log_id integer  NOT NULL,
    CONSTRAINT RuleLog_pk PRIMARY KEY (Message_Validation_Rule_id,Message_Validation_Log_id)
) ;

-- Table: SenderBIC
CREATE TABLE SenderBIC (
    Transactions_id integer  NOT NULL,
    BIC_Directory_id integer  NOT NULL,
    CONSTRAINT SenderBIC_pk PRIMARY KEY (Transactions_id,BIC_Directory_id)
) ;

-- Table: Severity
CREATE TABLE Severity (
    id integer  NOT NULL,
    Severity varchar2(50)  NOT NULL,
    CONSTRAINT Severity_pk PRIMARY KEY (id)
) ;

-- Table: Status
CREATE TABLE Status (
    id integer  NOT NULL,
    Status varchar2(20)  NOT NULL,
    Category varchar2(50)  NOT NULL,
    CONSTRAINT Status_pk PRIMARY KEY (id)
) ;

-- Table: Transaction
CREATE TABLE Transaction (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Currency_CurrencyCode varchar2(3)  NOT NULL,
    Amount number(20,2)  NOT NULL,
    Status_id integer  NOT NULL,
    Message_Types_id integer  NOT NULL,
    Details varchar2(255)  NOT NULL,
    CONSTRAINT Transaction_pk PRIMARY KEY (id)
) ;

-- Table: TransactionLog
CREATE TABLE TransactionLog (
    Transaction_id integer  NOT NULL,
    Transaction_Log_id integer  NOT NULL,
    CONSTRAINT TransactionLog_pk PRIMARY KEY (Transaction_id,Transaction_Log_id)
) ;

-- Table: Transaction_Log
CREATE TABLE Transaction_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NULL,
    CONSTRAINT Transaction_Log_pk PRIMARY KEY (id)
) ;

-- Table: User
CREATE TABLE "User" (
    id integer  NOT NULL,
    PESEL char(11)  NOT NULL,
    Username varchar2(255)  NOT NULL,
    Name varchar2(20)  NOT NULL,
    Surname varchar2(20)  NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY (id)
) ;

-- Table: UserLog
CREATE TABLE UserLog (
    User_id integer  NOT NULL,
    User_Log_id integer  NOT NULL,
    CONSTRAINT UserLog_pk PRIMARY KEY (User_id,User_Log_id)
) ;

-- Table: User_Log
CREATE TABLE User_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NULL,
    CONSTRAINT User_Log_pk PRIMARY KEY (id)
) ;

-- Table: User_Role_Access
CREATE TABLE User_Role_Access (
    Role_id integer  NOT NULL,
    User_id integer  NOT NULL,
    Access_Control_List_id integer  NOT NULL,
    IBAN_id integer  NOT NULL,
    CONSTRAINT User_Role_Access_pk PRIMARY KEY (Role_id,User_id,Access_Control_List_id,IBAN_id)
) ;

-- foreign keys
-- Reference: Alert_Error_Message (table: Alert)
ALTER TABLE Alert ADD CONSTRAINT Alert_Error_Message
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);

-- Reference: Alert_Status (table: Alert)
ALTER TABLE Alert ADD CONSTRAINT Alert_Status
    FOREIGN KEY (Status_id)
    REFERENCES Status (id);

-- Reference: Error_Message_Component (table: Error_Message)
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Component
    FOREIGN KEY (Component_id)
    REFERENCES Component (id);

-- Reference: Error_Message_EventType (table: Error_Message)
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_EventType
    FOREIGN KEY (EventType_id)
    REFERENCES EventType (id);

-- Reference: Error_Message_Severity (table: Error_Message)
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Severity
    FOREIGN KEY (Severity_id)
    REFERENCES Severity (id);

-- Reference: IBAN_AccountType (table: IBAN)
ALTER TABLE IBAN ADD CONSTRAINT IBAN_AccountType
    FOREIGN KEY (AccountType_id)
    REFERENCES AccountType (id);

-- Reference: IBAN_BIC_BIC_Directory (table: IBAN_BIC)
ALTER TABLE IBAN_BIC ADD CONSTRAINT IBAN_BIC_BIC_Directory
    FOREIGN KEY (BIC_Directory_id)
    REFERENCES BIC_Directory (id);

-- Reference: IBAN_Currency (table: IBAN)
ALTER TABLE IBAN ADD CONSTRAINT IBAN_Currency
    FOREIGN KEY (Currency_CurrencyCode)
    REFERENCES Currency (CurrencyCode);

-- Reference: IBAN_Status (table: IBAN)
ALTER TABLE IBAN ADD CONSTRAINT IBAN_Status
    FOREIGN KEY (Status_id)
    REFERENCES Status (id);

-- Reference: Log_Error_Message (table: Message_Validation_Log)
ALTER TABLE Message_Validation_Log ADD CONSTRAINT Log_Error_Message
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);

-- Reference: Message_Type_Category (table: Message_Type)
ALTER TABLE Message_Type ADD CONSTRAINT Message_Type_Category
    FOREIGN KEY (Category_id)
    REFERENCES Category (id);

-- Reference: Message_Validation_Rule_Rule (table: Message_Validation_Rule)
ALTER TABLE Message_Validation_Rule ADD CONSTRAINT Message_Validation_Rule_Rule
    FOREIGN KEY (Rule_id)
    REFERENCES Rule (id);

-- Reference: ReceiverBIC_BIC_Directory (table: ReceiverBIC)
ALTER TABLE ReceiverBIC ADD CONSTRAINT ReceiverBIC_BIC_Directory
    FOREIGN KEY (BIC_Directory_id)
    REFERENCES BIC_Directory (id);

-- Reference: ReceiverBIC_Transactions (table: ReceiverBIC)
ALTER TABLE ReceiverBIC ADD CONSTRAINT ReceiverBIC_Transactions
    FOREIGN KEY (Transactions_id)
    REFERENCES Transaction (id);

-- Reference: Rule_Log_Message_Log (table: RuleLog)
ALTER TABLE RuleLog ADD CONSTRAINT Rule_Log_Message_Log
    FOREIGN KEY (Message_Validation_Log_id)
    REFERENCES Message_Validation_Log (id);

-- Reference: Rule_Log_Message_Rule (table: RuleLog)
ALTER TABLE RuleLog ADD CONSTRAINT Rule_Log_Message_Rule
    FOREIGN KEY (Message_Validation_Rule_id)
    REFERENCES Message_Validation_Rule (id);

-- Reference: Rule_Message_Type (table: Message_Validation_Rule)
ALTER TABLE Message_Validation_Rule ADD CONSTRAINT Rule_Message_Type
    FOREIGN KEY (Message_Types_id)
    REFERENCES Message_Type (id);

-- Reference: SenderBIC_BIC_Directory (table: SenderBIC)
ALTER TABLE SenderBIC ADD CONSTRAINT SenderBIC_BIC_Directory
    FOREIGN KEY (BIC_Directory_id)
    REFERENCES BIC_Directory (id);

-- Reference: SenderBIC_Transaction (table: SenderBIC)
ALTER TABLE SenderBIC ADD CONSTRAINT SenderBIC_Transaction
    FOREIGN KEY (Transactions_id)
    REFERENCES Transaction (id);

-- Reference: System_Log_Error_M (table: User_Log)
ALTER TABLE User_Log ADD CONSTRAINT System_Log_Error_M
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);

-- Reference: System_Log_Error_Message (table: Transaction_Log)
ALTER TABLE Transaction_Log ADD CONSTRAINT System_Log_Error_Message
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);

-- Reference: TransactionLog_Transaction (table: TransactionLog)
ALTER TABLE TransactionLog ADD CONSTRAINT TransactionLog_Transaction
    FOREIGN KEY (Transaction_id)
    REFERENCES Transaction (id);

-- Reference: TransactionLog_Transaction_Log (table: TransactionLog)
ALTER TABLE TransactionLog ADD CONSTRAINT TransactionLog_Transaction_Log
    FOREIGN KEY (Transaction_Log_id)
    REFERENCES Transaction_Log (id);

-- Reference: Transaction_Currency (table: Transaction)
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Currency
    FOREIGN KEY (Currency_CurrencyCode)
    REFERENCES Currency (CurrencyCode);

-- Reference: Transaction_Message_Type (table: Transaction)
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Message_Type
    FOREIGN KEY (Message_Types_id)
    REFERENCES Message_Type (id);

-- Reference: Transaction_Transaction_Status (table: Transaction)
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Transaction_Status
    FOREIGN KEY (Status_id)
    REFERENCES Status (id);

-- Reference: UserLog_User (table: UserLog)
ALTER TABLE UserLog ADD CONSTRAINT UserLog_User
    FOREIGN KEY (User_id)
    REFERENCES "User" (id);

-- Reference: UserLog_User_Log (table: UserLog)
ALTER TABLE UserLog ADD CONSTRAINT UserLog_User_Log
    FOREIGN KEY (User_Log_id)
    REFERENCES User_Log (id);

-- Reference: User_BIC_IBAN (table: IBAN_BIC)
ALTER TABLE IBAN_BIC ADD CONSTRAINT User_BIC_IBAN
    FOREIGN KEY (IBAN_id)
    REFERENCES IBAN (id);

-- Reference: User_Role_Access_Control_List (table: User_Role_Access)
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_Access_Control_List
    FOREIGN KEY (Access_Control_List_id)
    REFERENCES Access_Control_List (id);

-- Reference: User_Role_Access_IBAN (table: User_Role_Access)
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_Access_IBAN
    FOREIGN KEY (IBAN_id)
    REFERENCES IBAN (id);

-- Reference: User_Role_Role (table: User_Role_Access)
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_Role
    FOREIGN KEY (Role_id)
    REFERENCES Role (id);

-- Reference: User_Role_User (table: User_Role_Access)
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_User
    FOREIGN KEY (User_id)
    REFERENCES "User" (id);

-- End of file.

