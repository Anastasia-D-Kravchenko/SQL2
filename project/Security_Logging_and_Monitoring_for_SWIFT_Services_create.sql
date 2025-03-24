CREATE TABLE Access_Control_List (
    id integer  NOT NULL,
    "Resource" varchar2(255)  NOT NULL,
    Permission integer  NOT NULL,
    CONSTRAINT Access_Control_List_pk PRIMARY KEY (id)
) ;
CREATE TABLE Activity (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Type varchar2(255)  NOT NULL,
    ResourceAccessed varchar2(255)  NOT NULL,
    SourceIP varchar2(46)  NOT NULL,
    CONSTRAINT Activity_pk PRIMARY KEY (id)
) ;
CREATE TABLE All_MessageType (
    id integer  NOT NULL,
    MessageType varchar2(20)  NOT NULL,
    Category_id integer  NOT NULL,
    Description varchar2(255)  NOT NULL,
    StandardVersion varchar2(20)  NOT NULL,
    DocumentationLink varchar2(255)  NOT NULL,
    CONSTRAINT All_MessageType_pk PRIMARY KEY (id)
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
CREATE TABLE ColorCode (
    id integer  NOT NULL,
    ColorCode varchar2(10)  NOT NULL,
    CONSTRAINT ColorCode_pk PRIMARY KEY (id)
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
CREATE TABLE Correlation_Repository (
    id integer  NOT NULL,
    Transaction_id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    MessageDetails varchar2(255)  NOT NULL,
    DomainName_id integer  NOT NULL,
    Direction_id integer  NOT NULL,
    ColorCode_id integer  NOT NULL,
    Status_id integer  NOT NULL,
    CONSTRAINT Correlation_Repository_pk PRIMARY KEY (id)
) ;
CREATE TABLE Currency (
    id integer  NOT NULL,
    Currency varchar2(3)  NOT NULL,
    CONSTRAINT Currency_pk PRIMARY KEY (id)
) ;
CREATE TABLE Direction (
    id integer  NOT NULL,
    Direction varchar2(8)  NOT NULL,
    CONSTRAINT Direction_pk PRIMARY KEY (id)
) ;
CREATE TABLE DomainName (
    id integer  NOT NULL,
    DomainName varchar2(255)  NOT NULL,
    CONSTRAINT DomainName_pk PRIMARY KEY (id)
) ;
CREATE TABLE Error_Message (
    Code integer  NOT NULL,
    Message varchar2(255)  NOT NULL,
    Severity_id integer  NOT NULL,
    Description varchar2(255)  NOT NULL,
    Source_Component_id integer  NOT NULL,
    Component_id integer  NOT NULL,
    CONSTRAINT Error_Message_pk PRIMARY KEY (Code)
) ;
CREATE TABLE EventType_Massage (
    id integer  NOT NULL,
    EventType varchar2(255)  NOT NULL,
    CONSTRAINT EventType_Massage_pk PRIMARY KEY (id)
) ;
CREATE TABLE EventType_Transaction (
    id integer  NOT NULL,
    EventType varchar2(255)  NOT NULL,
    CONSTRAINT EventType_Transaction_pk PRIMARY KEY (id)
) ;
CREATE TABLE EventType_User (
    id integer  NOT NULL,
    EventType varchar2(255)  NOT NULL,
    CONSTRAINT EventType_User_pk PRIMARY KEY (id)
) ;
CREATE TABLE Message_Type (
    id integer  NOT NULL,
    MessageType_id integer  NOT NULL,
    IsMX integer  NOT NULL,
    CONSTRAINT Message_Type_pk PRIMARY KEY (id)
) ;
CREATE TABLE Message_Validation_Alert (
    id integer  NOT NULL,
    Type varchar2(255)  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Resolved integer  NOT NULL,
    Message_Validation_Log_id integer  NOT NULL,
    CONSTRAINT Message_Validation_Alert_pk PRIMARY KEY (id)
) ;
CREATE TABLE Message_Validation_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NOT NULL,
    Message_Validation_Rule_id integer  NOT NULL,
    EventType_Massage_id integer  NOT NULL,
    CONSTRAINT Message_Validation_Log_pk PRIMARY KEY (id)
) ;
CREATE TABLE Message_Validation_Rule (
    id integer  NOT NULL,
    Message_Types_id integer  NOT NULL,
    Role_id integer  NOT NULL,
    CONSTRAINT Message_Validation_Rule_pk PRIMARY KEY (id)
) ;
CREATE TABLE ReceiverBIC (
    BIC_Directory_BIC varchar2(11)  NOT NULL,
    SWIFT_Transactions_id integer  NOT NULL,
    CONSTRAINT ReceiverBIC_pk PRIMARY KEY (BIC_Directory_BIC,SWIFT_Transactions_id)
) ;
CREATE TABLE Role (
    id integer  NOT NULL,
    RuleType varchar2(50)  NOT NULL,
    RuleDescription varchar2(255)  NOT NULL,
    RuleExpression varchar2(255)  NOT NULL,
    CONSTRAINT Role_pk PRIMARY KEY (id)
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
CREATE TABLE Source_Component (
    id integer  NOT NULL,
    Source_Component varchar2(255)  NOT NULL,
    CONSTRAINT Source_Component_pk PRIMARY KEY (id)
) ;
CREATE TABLE Status (
    id integer  NOT NULL,
    Status varchar2(20)  NOT NULL,
    CONSTRAINT Status_pk PRIMARY KEY (id)
) ;
CREATE TABLE System_Alert (
    id integer  NOT NULL,
    SWIFT_System_Logs_id integer  NOT NULL,
    Type varchar2(255)  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Resolved integer  NOT NULL,
    CONSTRAINT System_Alert_pk PRIMARY KEY (id)
) ;
CREATE TABLE Transaction (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Amount number(20,2)  NOT NULL,
    Message_Types_id integer  NOT NULL,
    Currency_id integer  NOT NULL,
    Transaction_Status_id integer  NOT NULL,
    Details varchar2(255)  NOT NULL,
    CONSTRAINT Transaction_pk PRIMARY KEY (id)
) ;
CREATE TABLE Transaction_Alert (
    id integer  NOT NULL,
    Type varchar2(255)  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Resolved integer  NOT NULL,
    System_Log_id integer  NOT NULL,
    CONSTRAINT Transaction_Alert_pk PRIMARY KEY (id)
) ;
CREATE TABLE Transaction_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NOT NULL,
    Transaction_id integer  NOT NULL,
    EventType_Transaction_id integer  NOT NULL,
    CONSTRAINT Transaction_Log_pk PRIMARY KEY (id)
) ;
CREATE TABLE Transaction_Status (
    id integer  NOT NULL,
    TransactionStatus varchar2(20)  NOT NULL,
    CONSTRAINT Transaction_Status_pk PRIMARY KEY (id)
) ;
CREATE TABLE "User" (
    id int  NOT NULL,
    Username varchar2(255)  NULL,
    Role varchar2(255)  NULL,
    CONSTRAINT Users_pk PRIMARY KEY (id)
) ;
CREATE TABLE User_Access (
    User_id int  NOT NULL,
    Access_Control_List_id integer  NOT NULL,
    CONSTRAINT User_Access_pk PRIMARY KEY (User_id,Access_Control_List_id)
) ;
CREATE TABLE User_Activity (
    User_id int  NOT NULL,
    Activity_id integer  NOT NULL,
    CONSTRAINT User_Activity_pk PRIMARY KEY (User_id,Activity_id)
) ;
CREATE TABLE User_BIC (
    BIC_Directory_BIC varchar2(11)  NOT NULL,
    Users_id int  NOT NULL,
    CONSTRAINT User_BIC_pk PRIMARY KEY (BIC_Directory_BIC,Users_id)
) ;
CREATE TABLE User_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    EventType varchar2(255)  NOT NULL,
    Error_Message_Code integer  NOT NULL,
    User_id int  NOT NULL,
    EventType_User_id integer  NOT NULL,
    CONSTRAINT User_Log_pk PRIMARY KEY (id)
) ;
CREATE TABLE XSD_Schemas (
    id integer  NOT NULL,
    SchemaName varchar2(255)  NOT NULL,
    TargetNamespace varchar2(255)  NOT NULL,
    FilePath varchar2(255)  NOT NULL,
    Description varchar2(255)  NOT NULL,
    Version varchar2(20)  NOT NULL,
    Message_Type_id integer  NOT NULL,
    CONSTRAINT XSD_Schemas_pk PRIMARY KEY (id)
) ;


ALTER TABLE Transaction_Alert ADD CONSTRAINT Alert_System_Log
    FOREIGN KEY (System_Log_id)
    REFERENCES Transaction_Log (id);
ALTER TABLE All_MessageType ADD CONSTRAINT All_MessageType_Category
    FOREIGN KEY (Category_id)
    REFERENCES Category (id);
ALTER TABLE Correlation_Repository ADD CONSTRAINT Correlation_ColorCode
    FOREIGN KEY (ColorCode_id)
    REFERENCES ColorCode (id);
ALTER TABLE Correlation_Repository ADD CONSTRAINT Correlation_Direction
    FOREIGN KEY (Direction_id)
    REFERENCES Direction (id);
ALTER TABLE Correlation_Repository ADD CONSTRAINT Correlation_DomainName
    FOREIGN KEY (DomainName_id)
    REFERENCES DomainName (id);
ALTER TABLE Correlation_Repository ADD CONSTRAINT Correlation_Repository_Status
    FOREIGN KEY (Status_id)
    REFERENCES Status (id);
ALTER TABLE Correlation_Repository ADD CONSTRAINT Correlation_Transaction
    FOREIGN KEY (Transaction_id)
    REFERENCES Transaction (id);
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Component
    FOREIGN KEY (Component_id)
    REFERENCES Component (id);
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Severity
    FOREIGN KEY (Severity_id)
    REFERENCES Severity (id);
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Source_Component
    FOREIGN KEY (Source_Component_id)
    REFERENCES Source_Component (id);
ALTER TABLE Message_Validation_Log ADD CONSTRAINT Log_Error_Message
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);
ALTER TABLE Message_Validation_Log ADD CONSTRAINT Log_EventType_Massage
    FOREIGN KEY (EventType_Massage_id)
    REFERENCES EventType_Massage (id);
ALTER TABLE Transaction_Log ADD CONSTRAINT Log_EventType_Transaction
    FOREIGN KEY (EventType_Transaction_id)
    REFERENCES EventType_Transaction (id);
ALTER TABLE Message_Validation_Log ADD CONSTRAINT Log_Message_Validation_Rule
    FOREIGN KEY (Message_Validation_Rule_id)
    REFERENCES Message_Validation_Rule (id);
ALTER TABLE Message_Type ADD CONSTRAINT Message_Type_MessageType
    FOREIGN KEY (MessageType_id)
    REFERENCES All_MessageType (id);
ALTER TABLE Message_Validation_Alert ADD CONSTRAINT Message_Validation_Log_Alert
    FOREIGN KEY (Message_Validation_Log_id)
    REFERENCES Message_Validation_Log (id);
ALTER TABLE Message_Validation_Rule ADD CONSTRAINT Message_Validation_Rules_Role
    FOREIGN KEY (Role_id)
    REFERENCES Role (id);
ALTER TABLE ReceiverBIC ADD CONSTRAINT ReceiverBIC_BIC_Directory
    FOREIGN KEY (BIC_Directory_BIC)
    REFERENCES BIC_Directory (BIC);
ALTER TABLE ReceiverBIC ADD CONSTRAINT ReceiverBIC_Transactions
    FOREIGN KEY (SWIFT_Transactions_id)
    REFERENCES Transaction (id);
ALTER TABLE Message_Validation_Rule ADD CONSTRAINT Rules_Message_Types
    FOREIGN KEY (Message_Types_id)
    REFERENCES Message_Type (id);
ALTER TABLE SenderBIC ADD CONSTRAINT SenderBIC_BIC_Directory
    FOREIGN KEY (BIC_Directory_BIC)
    REFERENCES BIC_Directory (BIC);
ALTER TABLE SenderBIC ADD CONSTRAINT SenderBIC_Transactions
    FOREIGN KEY (Transactions_id)
    REFERENCES Transaction (id);
ALTER TABLE System_Alert ADD CONSTRAINT System_Alerts_System_Logs
    FOREIGN KEY (SWIFT_System_Logs_id)
    REFERENCES User_Log (id);
ALTER TABLE User_Log ADD CONSTRAINT System_Log_Error_M
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);
ALTER TABLE Transaction_Log ADD CONSTRAINT System_Log_Error_Message
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);
ALTER TABLE Transaction_Log ADD CONSTRAINT System_Log_SWIFT_Transaction
    FOREIGN KEY (Transaction_id)
    REFERENCES Transaction (id);
ALTER TABLE User_Log ADD CONSTRAINT System_Log_User
    FOREIGN KEY (User_id)
    REFERENCES "User" (id);
ALTER TABLE User_BIC ADD CONSTRAINT Table_12_BIC_Directory
    FOREIGN KEY (BIC_Directory_BIC)
    REFERENCES BIC_Directory (BIC);
ALTER TABLE User_BIC ADD CONSTRAINT Table_12_User
    FOREIGN KEY (Users_id)
    REFERENCES "User" (id);
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Currency
    FOREIGN KEY (Currency_id)
    REFERENCES Currency (id);
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Message_Type
    FOREIGN KEY (Message_Types_id)
    REFERENCES Message_Type (id);
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Transaction_Status
    FOREIGN KEY (Transaction_Status_id)
    REFERENCES Transaction_Status (id);
ALTER TABLE User_Access ADD CONSTRAINT User_Access_Control_List
    FOREIGN KEY (Access_Control_List_id)
    REFERENCES Access_Control_List (id);
ALTER TABLE User_Access ADD CONSTRAINT User_Access_User
    FOREIGN KEY (User_id)
    REFERENCES "User" (id);
ALTER TABLE User_Activity ADD CONSTRAINT User_Activity_Activity
    FOREIGN KEY (Activity_id)
    REFERENCES Activity (id);
ALTER TABLE User_Activity ADD CONSTRAINT User_Activity_User
    FOREIGN KEY (User_id)
    REFERENCES "User" (id);
ALTER TABLE User_Log ADD CONSTRAINT User_Log_EventType_User
    FOREIGN KEY (EventType_User_id)
    REFERENCES EventType_User (id);
ALTER TABLE XSD_Schemas ADD CONSTRAINT XSD_Schemas_Message_Type
    FOREIGN KEY (Message_Type_id)
    REFERENCES Message_Type (id);