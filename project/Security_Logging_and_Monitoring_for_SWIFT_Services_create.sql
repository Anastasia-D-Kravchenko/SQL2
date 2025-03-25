CREATE TABLE Access_Control_List (
    id integer  NOT NULL,
    "Resource" varchar2(255)  NOT NULL,
    Permission integer  NOT NULL,
    CONSTRAINT Access_Control_List_pk PRIMARY KEY (id)
) ;
CREATE TABLE AccountType (
    id int  NOT NULL,
    AccountType varchar2(50)  NOT NULL,
    CONSTRAINT AccountType_pk PRIMARY KEY (id)
) ;
CREATE TABLE Alert (
    id integer  NOT NULL,
    Type varchar2(255)  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NOT NULL,
    Resolved integer  NOT NULL,
    CONSTRAINT Alert_pk PRIMARY KEY (id)
) ;
CREATE TABLE BIC_Directory (
    BIC varchar2(11)  NOT NULL,
    InstitutionName varchar2(255)  NULL,
    Country varchar2(2)  NULL,
    CONSTRAINT BIC_Directory_pk PRIMARY KEY (BIC)
) ;
CREATE TABLE Category (
    id integer  NOT NULL,
    Category varchar2(18)  NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY (id)
) ;
CREATE TABLE Component (
    id integer  NOT NULL,
    Name varchar2(255)  NOT NULL,
    Type varchar2(255)  NOT NULL,
    Description varchar2(255)  NOT NULL,
    Version varchar2(50)  NOT NULL,
    Vendor varchar2(255)  NOT NULL,
    InstallationDate date  NOT NULL,
    LastUpdated date  NOT NULL,
    Configuration xmltype  NOT NULL,
    CONSTRAINT Component_pk PRIMARY KEY (id)
) ;
CREATE TABLE Currency (
    CurrencyCode varchar2(3)  NOT NULL,
    ExchangeRateToUSD number(18,8)  NOT NULL,
    ExchangeRateLastUpdated timestamp  NOT NULL,
    IsActive integer  NOT NULL,
    CONSTRAINT Currency_pk PRIMARY KEY (CurrencyCode)
) ;
CREATE TABLE Error_Message (
    Code integer  NOT NULL,
    Message varchar2(255)  NOT NULL,
    Severity_id integer  NOT NULL,
    Component_id integer  NOT NULL,
    EventType_id integer  NOT NULL,
    Description varchar2(255)  NOT NULL,
    CONSTRAINT Error_Message_pk PRIMARY KEY (Code)
) ;
CREATE TABLE EventType (
    id integer  NOT NULL,
    Type varchar2(255)  NOT NULL,
    ResourceAccessed varchar2(255)  NOT NULL,
    SourceIP varchar2(46)  NOT NULL,
    CONSTRAINT EventType_pk PRIMARY KEY (id)
) ;
CREATE TABLE IBAN (
    id int  NOT NULL,
    IBAN varchar2(34)  NOT NULL,
    HolderName varchar2(255)  NOT NULL,
    AccountNumber varchar2(50)  NOT NULL,
    Currency_CurrencyCode varchar2(3)  NOT NULL,
    AccountType_id int  NOT NULL,
    Status_id integer  NOT NULL,
    CreationDate date  NOT NULL,
    CONSTRAINT IBAN_pk PRIMARY KEY (id)
) ;
CREATE TABLE IBAN_BIC (
    IBAN_id int  NOT NULL,
    BIC_Directory_BIC varchar2(11)  NOT NULL,
    CONSTRAINT IBAN_BIC_pk PRIMARY KEY (IBAN_id,BIC_Directory_BIC)
) ;
CREATE TABLE Message_Type (
    id integer  NOT NULL,
    MessageType varchar2(10)  NOT NULL,
    Category_id integer  NOT NULL,
    Description varchar2(255)  NOT NULL,
    StandardVersion varchar2(20)  NOT NULL,
    DocumentationLink varchar2(255)  NOT NULL,
    CONSTRAINT Message_Type_pk PRIMARY KEY (id)
) ;
CREATE TABLE Message_Validation_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NOT NULL,
    CONSTRAINT Message_Validation_Log_pk PRIMARY KEY (id)
) ;
CREATE TABLE Message_Validation_Rule (
    id integer  NOT NULL,
    Message_Types_id integer  NOT NULL,
    Rule_id integer  NOT NULL,
    CONSTRAINT Message_Validation_Rule_pk PRIMARY KEY (id)
) ;
CREATE TABLE ReceiverBIC (
    BIC_Directory_BIC varchar2(11)  NOT NULL,
    SWIFT_Transactions_id integer  NOT NULL,
    CONSTRAINT ReceiverBIC_pk PRIMARY KEY (BIC_Directory_BIC,SWIFT_Transactions_id)
) ;
CREATE TABLE Role (
    id int  NOT NULL,
    Role varchar2(255)  NOT NULL,
    CONSTRAINT Role_pk PRIMARY KEY (id)
) ;
CREATE TABLE Rule (
    id integer  NOT NULL,
    Type varchar2(50)  NOT NULL,
    Expression varchar2(255)  NOT NULL,
    Description varchar2(255)  NOT NULL,
    CONSTRAINT Rule_pk PRIMARY KEY (id)
) ;
CREATE TABLE RuleLog (
    Message_Validation_Rule_id integer  NOT NULL,
    Message_Validation_Log_id integer  NOT NULL,
    CONSTRAINT RuleLog_pk PRIMARY KEY (Message_Validation_Rule_id,Message_Validation_Log_id)
) ;
CREATE TABLE SenderBIC (
    BIC_Directory_BIC varchar2(11)  NOT NULL,
    Transactions_id integer  NOT NULL,
    CONSTRAINT SenderBIC_pk PRIMARY KEY (BIC_Directory_BIC,Transactions_id)
) ;
CREATE TABLE Severity (
    id integer  NOT NULL,
    Severity integer  NOT NULL,
    CONSTRAINT Severity_pk PRIMARY KEY (id)
) ;
CREATE TABLE Status (
    id integer  NOT NULL,
    Status varchar2(20)  NOT NULL,
    Category varchar2(50)  NOT NULL,
    CONSTRAINT Status_pk PRIMARY KEY (id)
) ;
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
CREATE TABLE TransactionLog (
    Transaction_id integer  NOT NULL,
    Transaction_Log_id integer  NOT NULL,
    CONSTRAINT TransactionLog_pk PRIMARY KEY (Transaction_id,Transaction_Log_id)
) ;
CREATE TABLE Transaction_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NOT NULL,
    CONSTRAINT Transaction_Log_pk PRIMARY KEY (id)
) ;
CREATE TABLE "User" (
    id int  NOT NULL,
    PESEL char(11)  NOT NULL,
    Username varchar2(255)  NOT NULL,
    Name varchar2(20)  NOT NULL,
    Surname varchar2(20)  NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY (id)
) ;
CREATE TABLE UserLog (
    User_id int  NOT NULL,
    User_Log_id integer  NOT NULL,
    CONSTRAINT UserLog_pk PRIMARY KEY (User_id,User_Log_id)
) ;
CREATE TABLE User_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NOT NULL,
    CONSTRAINT User_Log_pk PRIMARY KEY (id)
) ;
CREATE TABLE User_Role_Access (
    Role_id int  NOT NULL,
    User_id int  NOT NULL,
    Access_Control_List_id integer  NOT NULL,
    IBAN_id int  NOT NULL,
    CONSTRAINT User_Role_Access_pk PRIMARY KEY (Role_id,User_id,Access_Control_List_id,IBAN_id)
) ;



ALTER TABLE Alert ADD CONSTRAINT Alert_Error_Message
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Component
    FOREIGN KEY (Component_id)
    REFERENCES Component (id);
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_EventType
    FOREIGN KEY (EventType_id)
    REFERENCES EventType (id);
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Severity
    FOREIGN KEY (Severity_id)
    REFERENCES Severity (id);
ALTER TABLE IBAN ADD CONSTRAINT IBAN_AccountType
    FOREIGN KEY (AccountType_id)
    REFERENCES AccountType (id);
ALTER TABLE IBAN_BIC ADD CONSTRAINT IBAN_BIC_BIC_Directory
    FOREIGN KEY (BIC_Directory_BIC)
    REFERENCES BIC_Directory (BIC);
ALTER TABLE IBAN ADD CONSTRAINT IBAN_Currency
    FOREIGN KEY (Currency_CurrencyCode)
    REFERENCES Currency (CurrencyCode);
ALTER TABLE IBAN ADD CONSTRAINT IBAN_Status
    FOREIGN KEY (Status_id)
    REFERENCES Status (id);
ALTER TABLE Message_Validation_Log ADD CONSTRAINT Log_Error_Message
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);
ALTER TABLE Message_Type ADD CONSTRAINT Message_Type_Category
    FOREIGN KEY (Category_id)
    REFERENCES Category (id);
ALTER TABLE Message_Validation_Rule ADD CONSTRAINT Message_Validation_Rule_Rule
    FOREIGN KEY (Rule_id)
    REFERENCES Rule (id);
ALTER TABLE ReceiverBIC ADD CONSTRAINT ReceiverBIC_BIC_Directory
    FOREIGN KEY (BIC_Directory_BIC)
    REFERENCES BIC_Directory (BIC);
ALTER TABLE ReceiverBIC ADD CONSTRAINT ReceiverBIC_Transactions
    FOREIGN KEY (SWIFT_Transactions_id)
    REFERENCES Transaction (id);
ALTER TABLE RuleLog ADD CONSTRAINT Rule_Log_Message_Log
    FOREIGN KEY (Message_Validation_Log_id)
    REFERENCES Message_Validation_Log (id);
ALTER TABLE RuleLog ADD CONSTRAINT Rule_Log_Message_Rule
    FOREIGN KEY (Message_Validation_Rule_id)
    REFERENCES Message_Validation_Rule (id);
ALTER TABLE Message_Validation_Rule ADD CONSTRAINT Rule_Message_Type
    FOREIGN KEY (Message_Types_id)
    REFERENCES Message_Type (id);
ALTER TABLE SenderBIC ADD CONSTRAINT SenderBIC_BIC_Directory
    FOREIGN KEY (BIC_Directory_BIC)
    REFERENCES BIC_Directory (BIC);
ALTER TABLE SenderBIC ADD CONSTRAINT SenderBIC_Transaction
    FOREIGN KEY (Transactions_id)
    REFERENCES Transaction (id);
ALTER TABLE User_Log ADD CONSTRAINT System_Log_Error_M
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);
ALTER TABLE Transaction_Log ADD CONSTRAINT System_Log_Error_Message
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);
ALTER TABLE TransactionLog ADD CONSTRAINT TransactionLog_Transaction
    FOREIGN KEY (Transaction_id)
    REFERENCES Transaction (id);
ALTER TABLE TransactionLog ADD CONSTRAINT TransactionLog_Transaction_Log
    FOREIGN KEY (Transaction_Log_id)
    REFERENCES Transaction_Log (id);
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Currency
    FOREIGN KEY (Currency_CurrencyCode)
    REFERENCES Currency (CurrencyCode);
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Message_Type
    FOREIGN KEY (Message_Types_id)
    REFERENCES Message_Type (id);
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Transaction_Status
    FOREIGN KEY (Status_id)
    REFERENCES Status (id);
ALTER TABLE UserLog ADD CONSTRAINT UserLog_User
    FOREIGN KEY (User_id)
    REFERENCES "User" (id);
ALTER TABLE UserLog ADD CONSTRAINT UserLog_User_Log
    FOREIGN KEY (User_Log_id)
    REFERENCES User_Log (id);
ALTER TABLE IBAN_BIC ADD CONSTRAINT User_BIC_IBAN
    FOREIGN KEY (IBAN_id)
    REFERENCES IBAN (id);
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_Access_Control_List
    FOREIGN KEY (Access_Control_List_id)
    REFERENCES Access_Control_List (id);
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_Access_IBAN
    FOREIGN KEY (IBAN_id)
    REFERENCES IBAN (id);
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_Role
    FOREIGN KEY (Role_id)
    REFERENCES Role (id);
ALTER TABLE User_Role_Access ADD CONSTRAINT User_Role_User
    FOREIGN KEY (User_id)
    REFERENCES "User" (id);