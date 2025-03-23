-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-03-23 17:36:05.758

-- tables
-- Table: Access_Control_List
CREATE TABLE Access_Control_List (
    id integer  NOT NULL,
    "Resource" varchar2(255)  NOT NULL,
    Permission integer  NOT NULL,
    CONSTRAINT Access_Control_List_pk PRIMARY KEY (id)
) ;

-- Table: Activity
CREATE TABLE Activity (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Type varchar2(255)  NOT NULL,
    ResourceAccessed varchar2(255)  NOT NULL,
    SourceIP varchar2(46)  NOT NULL,
    CONSTRAINT Activity_pk PRIMARY KEY (id)
) ;

-- Table: All_MessageType
CREATE TABLE All_MessageType (
    id integer  NOT NULL,
    MessageType varchar2(20)  NOT NULL,
    Category_id integer  NOT NULL,
    Description varchar2(255)  NOT NULL,
    StandardVersion varchar2(20)  NOT NULL,
    DocumentationLink varchar2(255)  NOT NULL,
    CONSTRAINT All_MessageType_pk PRIMARY KEY (id)
) ;

-- Table: BIC_Directory
CREATE TABLE BIC_Directory (
    BIC varchar2(11)  NOT NULL,
    InstitutionName varchar2(255)  NULL,
    Country varchar2(2)  NULL,
    CONSTRAINT BIC_Directory_pk PRIMARY KEY (BIC)
) ;

-- Table: Category
CREATE TABLE Category (
    id integer  NOT NULL,
    Category varchar2(18)  NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY (id)
) ;

-- Table: ColorCode
CREATE TABLE ColorCode (
    id integer  NOT NULL,
    ColorCode varchar2(10)  NOT NULL,
    CONSTRAINT ColorCode_pk PRIMARY KEY (id)
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
    Configuration xmltype  NOT NULL,
    CONSTRAINT Component_pk PRIMARY KEY (id)
) ;

-- Table: Correlation_Repository
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

-- Table: Currency
CREATE TABLE Currency (
    id integer  NOT NULL,
    Currency varchar2(3)  NOT NULL,
    CONSTRAINT Currency_pk PRIMARY KEY (id)
) ;

-- Table: Direction
CREATE TABLE Direction (
    id integer  NOT NULL,
    Direction varchar2(8)  NOT NULL,
    CONSTRAINT Direction_pk PRIMARY KEY (id)
) ;

-- Table: DomainName
CREATE TABLE DomainName (
    id integer  NOT NULL,
    DomainName varchar2(255)  NOT NULL,
    CONSTRAINT DomainName_pk PRIMARY KEY (id)
) ;

-- Table: Error_Message
CREATE TABLE Error_Message (
    Code integer  NOT NULL,
    Message varchar2(255)  NOT NULL,
    Severity_id integer  NOT NULL,
    Description varchar2(255)  NOT NULL,
    Source_Component_id integer  NOT NULL,
    Component_id integer  NOT NULL,
    CONSTRAINT Error_Message_pk PRIMARY KEY (Code)
) ;

-- Table: EventType_Massage
CREATE TABLE EventType_Massage (
    id integer  NOT NULL,
    EventType varchar2(255)  NOT NULL,
    CONSTRAINT EventType_Massage_pk PRIMARY KEY (id)
) ;

-- Table: EventType_Transaction
CREATE TABLE EventType_Transaction (
    id integer  NOT NULL,
    EventType varchar2(255)  NOT NULL,
    CONSTRAINT EventType_Transaction_pk PRIMARY KEY (id)
) ;

-- Table: EventType_User
CREATE TABLE EventType_User (
    id integer  NOT NULL,
    EventType varchar2(255)  NOT NULL,
    CONSTRAINT EventType_User_pk PRIMARY KEY (id)
) ;

-- Table: Message_Type
CREATE TABLE Message_Type (
    id integer  NOT NULL,
    MessageType_id integer  NOT NULL,
    IsMX integer  NOT NULL,
    CONSTRAINT Message_Type_pk PRIMARY KEY (id)
) ;

-- Table: Message_Validation_Alert
CREATE TABLE Message_Validation_Alert (
    id integer  NOT NULL,
    Type varchar2(255)  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Resolved integer  NOT NULL,
    Message_Validation_Log_id integer  NOT NULL,
    CONSTRAINT Message_Validation_Alert_pk PRIMARY KEY (id)
) ;

-- Table: Message_Validation_Log
CREATE TABLE Message_Validation_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NOT NULL,
    Message_Validation_Rule_id integer  NOT NULL,
    EventType_Massage_id integer  NOT NULL,
    CONSTRAINT Message_Validation_Log_pk PRIMARY KEY (id)
) ;

-- Table: Message_Validation_Rule
CREATE TABLE Message_Validation_Rule (
    id integer  NOT NULL,
    Message_Types_id integer  NOT NULL,
    Role_id integer  NOT NULL,
    CONSTRAINT Message_Validation_Rule_pk PRIMARY KEY (id)
) ;

-- Table: ReceiverBIC
CREATE TABLE ReceiverBIC (
    BIC_Directory_BIC varchar2(11)  NOT NULL,
    SWIFT_Transactions_id integer  NOT NULL,
    CONSTRAINT ReceiverBIC_pk PRIMARY KEY (BIC_Directory_BIC,SWIFT_Transactions_id)
) ;

-- Table: Role
CREATE TABLE Role (
    id integer  NOT NULL,
    RuleType varchar2(50)  NOT NULL,
    RuleDescription varchar2(255)  NOT NULL,
    RuleExpression varchar2(255)  NOT NULL,
    CONSTRAINT Role_pk PRIMARY KEY (id)
) ;

-- Table: SenderBIC
CREATE TABLE SenderBIC (
    BIC_Directory_BIC varchar2(11)  NOT NULL,
    Transactions_id integer  NOT NULL,
    CONSTRAINT SenderBIC_pk PRIMARY KEY (BIC_Directory_BIC,Transactions_id)
) ;

-- Table: Severity
CREATE TABLE Severity (
    id integer  NOT NULL,
    Severity integer  NOT NULL,
    CONSTRAINT Severity_pk PRIMARY KEY (id)
) ;

-- Table: Source_Component
CREATE TABLE Source_Component (
    id integer  NOT NULL,
    Source_Component varchar2(255)  NOT NULL,
    CONSTRAINT Source_Component_pk PRIMARY KEY (id)
) ;

-- Table: Status
CREATE TABLE Status (
    id integer  NOT NULL,
    Status varchar2(20)  NOT NULL,
    CONSTRAINT Status_pk PRIMARY KEY (id)
) ;

-- Table: System_Alert
CREATE TABLE System_Alert (
    id integer  NOT NULL,
    SWIFT_System_Logs_id integer  NOT NULL,
    Type varchar2(255)  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Resolved integer  NOT NULL,
    CONSTRAINT System_Alert_pk PRIMARY KEY (id)
) ;

-- Table: Transaction
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

-- Table: Transaction_Alert
CREATE TABLE Transaction_Alert (
    id integer  NOT NULL,
    Type varchar2(255)  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Resolved integer  NOT NULL,
    System_Log_id integer  NOT NULL,
    CONSTRAINT Transaction_Alert_pk PRIMARY KEY (id)
) ;

-- Table: Transaction_Log
CREATE TABLE Transaction_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    Error_Message_Code integer  NOT NULL,
    Transaction_id integer  NOT NULL,
    EventType_Transaction_id integer  NOT NULL,
    CONSTRAINT Transaction_Log_pk PRIMARY KEY (id)
) ;

-- Table: Transaction_Status
CREATE TABLE Transaction_Status (
    id integer  NOT NULL,
    TransactionStatus varchar2(20)  NOT NULL,
    CONSTRAINT Transaction_Status_pk PRIMARY KEY (id)
) ;

-- Table: User
CREATE TABLE "User" (
    id int  NOT NULL,
    Username varchar2(255)  NULL,
    Role varchar2(255)  NULL,
    CONSTRAINT Users_pk PRIMARY KEY (id)
) ;

-- Table: User_Access
CREATE TABLE User_Access (
    User_id int  NOT NULL,
    Access_Control_List_id integer  NOT NULL,
    CONSTRAINT User_Access_pk PRIMARY KEY (User_id,Access_Control_List_id)
) ;

-- Table: User_Activity
CREATE TABLE User_Activity (
    User_id int  NOT NULL,
    Activity_id integer  NOT NULL,
    CONSTRAINT User_Activity_pk PRIMARY KEY (User_id,Activity_id)
) ;

-- Table: User_BIC
CREATE TABLE User_BIC (
    BIC_Directory_BIC varchar2(11)  NOT NULL,
    Users_id int  NOT NULL,
    CONSTRAINT User_BIC_pk PRIMARY KEY (BIC_Directory_BIC,Users_id)
) ;

-- Table: User_Log
CREATE TABLE User_Log (
    id integer  NOT NULL,
    Timestamp timestamp  NOT NULL,
    EventType varchar2(255)  NOT NULL,
    Error_Message_Code integer  NOT NULL,
    User_id int  NOT NULL,
    EventType_User_id integer  NOT NULL,
    CONSTRAINT User_Log_pk PRIMARY KEY (id)
) ;

-- Table: XSD_Schemas
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

-- foreign keys
-- Reference: Alert_System_Log (table: Transaction_Alert)
ALTER TABLE Transaction_Alert ADD CONSTRAINT Alert_System_Log
    FOREIGN KEY (System_Log_id)
    REFERENCES Transaction_Log (id);

-- Reference: All_MessageType_Category (table: All_MessageType)
ALTER TABLE All_MessageType ADD CONSTRAINT All_MessageType_Category
    FOREIGN KEY (Category_id)
    REFERENCES Category (id);

-- Reference: Correlation_ColorCode (table: Correlation_Repository)
ALTER TABLE Correlation_Repository ADD CONSTRAINT Correlation_ColorCode
    FOREIGN KEY (ColorCode_id)
    REFERENCES ColorCode (id);

-- Reference: Correlation_Direction (table: Correlation_Repository)
ALTER TABLE Correlation_Repository ADD CONSTRAINT Correlation_Direction
    FOREIGN KEY (Direction_id)
    REFERENCES Direction (id);

-- Reference: Correlation_DomainName (table: Correlation_Repository)
ALTER TABLE Correlation_Repository ADD CONSTRAINT Correlation_DomainName
    FOREIGN KEY (DomainName_id)
    REFERENCES DomainName (id);

-- Reference: Correlation_Repository_Status (table: Correlation_Repository)
ALTER TABLE Correlation_Repository ADD CONSTRAINT Correlation_Repository_Status
    FOREIGN KEY (Status_id)
    REFERENCES Status (id);

-- Reference: Correlation_Transaction (table: Correlation_Repository)
ALTER TABLE Correlation_Repository ADD CONSTRAINT Correlation_Transaction
    FOREIGN KEY (Transaction_id)
    REFERENCES Transaction (id);

-- Reference: Error_Message_Component (table: Error_Message)
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Component
    FOREIGN KEY (Component_id)
    REFERENCES Component (id);

-- Reference: Error_Message_Severity (table: Error_Message)
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Severity
    FOREIGN KEY (Severity_id)
    REFERENCES Severity (id);

-- Reference: Error_Message_Source_Component (table: Error_Message)
ALTER TABLE Error_Message ADD CONSTRAINT Error_Message_Source_Component
    FOREIGN KEY (Source_Component_id)
    REFERENCES Source_Component (id);

-- Reference: Log_Error_Message (table: Message_Validation_Log)
ALTER TABLE Message_Validation_Log ADD CONSTRAINT Log_Error_Message
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);

-- Reference: Log_EventType_Massage (table: Message_Validation_Log)
ALTER TABLE Message_Validation_Log ADD CONSTRAINT Log_EventType_Massage
    FOREIGN KEY (EventType_Massage_id)
    REFERENCES EventType_Massage (id);

-- Reference: Log_EventType_Transaction (table: Transaction_Log)
ALTER TABLE Transaction_Log ADD CONSTRAINT Log_EventType_Transaction
    FOREIGN KEY (EventType_Transaction_id)
    REFERENCES EventType_Transaction (id);

-- Reference: Log_Message_Validation_Rule (table: Message_Validation_Log)
ALTER TABLE Message_Validation_Log ADD CONSTRAINT Log_Message_Validation_Rule
    FOREIGN KEY (Message_Validation_Rule_id)
    REFERENCES Message_Validation_Rule (id);

-- Reference: Message_Type_MessageType (table: Message_Type)
ALTER TABLE Message_Type ADD CONSTRAINT Message_Type_MessageType
    FOREIGN KEY (MessageType_id)
    REFERENCES All_MessageType (id);

-- Reference: Message_Validation_Log_Alert (table: Message_Validation_Alert)
ALTER TABLE Message_Validation_Alert ADD CONSTRAINT Message_Validation_Log_Alert
    FOREIGN KEY (Message_Validation_Log_id)
    REFERENCES Message_Validation_Log (id);

-- Reference: Message_Validation_Rules_Role (table: Message_Validation_Rule)
ALTER TABLE Message_Validation_Rule ADD CONSTRAINT Message_Validation_Rules_Role
    FOREIGN KEY (Role_id)
    REFERENCES Role (id);

-- Reference: ReceiverBIC_BIC_Directory (table: ReceiverBIC)
ALTER TABLE ReceiverBIC ADD CONSTRAINT ReceiverBIC_BIC_Directory
    FOREIGN KEY (BIC_Directory_BIC)
    REFERENCES BIC_Directory (BIC);

-- Reference: ReceiverBIC_Transactions (table: ReceiverBIC)
ALTER TABLE ReceiverBIC ADD CONSTRAINT ReceiverBIC_Transactions
    FOREIGN KEY (SWIFT_Transactions_id)
    REFERENCES Transaction (id);

-- Reference: Rules_Message_Types (table: Message_Validation_Rule)
ALTER TABLE Message_Validation_Rule ADD CONSTRAINT Rules_Message_Types
    FOREIGN KEY (Message_Types_id)
    REFERENCES Message_Type (id);

-- Reference: SenderBIC_BIC_Directory (table: SenderBIC)
ALTER TABLE SenderBIC ADD CONSTRAINT SenderBIC_BIC_Directory
    FOREIGN KEY (BIC_Directory_BIC)
    REFERENCES BIC_Directory (BIC);

-- Reference: SenderBIC_Transactions (table: SenderBIC)
ALTER TABLE SenderBIC ADD CONSTRAINT SenderBIC_Transactions
    FOREIGN KEY (Transactions_id)
    REFERENCES Transaction (id);

-- Reference: System_Alerts_System_Logs (table: System_Alert)
ALTER TABLE System_Alert ADD CONSTRAINT System_Alerts_System_Logs
    FOREIGN KEY (SWIFT_System_Logs_id)
    REFERENCES User_Log (id);

-- Reference: System_Log_Error_M (table: User_Log)
ALTER TABLE User_Log ADD CONSTRAINT System_Log_Error_M
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);

-- Reference: System_Log_Error_Message (table: Transaction_Log)
ALTER TABLE Transaction_Log ADD CONSTRAINT System_Log_Error_Message
    FOREIGN KEY (Error_Message_Code)
    REFERENCES Error_Message (Code);

-- Reference: System_Log_SWIFT_Transaction (table: Transaction_Log)
ALTER TABLE Transaction_Log ADD CONSTRAINT System_Log_SWIFT_Transaction
    FOREIGN KEY (Transaction_id)
    REFERENCES Transaction (id);

-- Reference: System_Log_User (table: User_Log)
ALTER TABLE User_Log ADD CONSTRAINT System_Log_User
    FOREIGN KEY (User_id)
    REFERENCES "User" (id);

-- Reference: Table_12_BIC_Directory (table: User_BIC)
ALTER TABLE User_BIC ADD CONSTRAINT Table_12_BIC_Directory
    FOREIGN KEY (BIC_Directory_BIC)
    REFERENCES BIC_Directory (BIC);

-- Reference: Table_12_User (table: User_BIC)
ALTER TABLE User_BIC ADD CONSTRAINT Table_12_User
    FOREIGN KEY (Users_id)
    REFERENCES "User" (id);

-- Reference: Transaction_Currency (table: Transaction)
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Currency
    FOREIGN KEY (Currency_id)
    REFERENCES Currency (id);

-- Reference: Transaction_Message_Type (table: Transaction)
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Message_Type
    FOREIGN KEY (Message_Types_id)
    REFERENCES Message_Type (id);

-- Reference: Transaction_Transaction_Status (table: Transaction)
ALTER TABLE Transaction ADD CONSTRAINT Transaction_Transaction_Status
    FOREIGN KEY (Transaction_Status_id)
    REFERENCES Transaction_Status (id);

-- Reference: User_Access_Control_List (table: User_Access)
ALTER TABLE User_Access ADD CONSTRAINT User_Access_Control_List
    FOREIGN KEY (Access_Control_List_id)
    REFERENCES Access_Control_List (id);

-- Reference: User_Access_User (table: User_Access)
ALTER TABLE User_Access ADD CONSTRAINT User_Access_User
    FOREIGN KEY (User_id)
    REFERENCES "User" (id);

-- Reference: User_Activity_Activity (table: User_Activity)
ALTER TABLE User_Activity ADD CONSTRAINT User_Activity_Activity
    FOREIGN KEY (Activity_id)
    REFERENCES Activity (id);

-- Reference: User_Activity_User (table: User_Activity)
ALTER TABLE User_Activity ADD CONSTRAINT User_Activity_User
    FOREIGN KEY (User_id)
    REFERENCES "User" (id);

-- Reference: User_Log_EventType_User (table: User_Log)
ALTER TABLE User_Log ADD CONSTRAINT User_Log_EventType_User
    FOREIGN KEY (EventType_User_id)
    REFERENCES EventType_User (id);

-- Reference: XSD_Schemas_Message_Type (table: XSD_Schemas)
ALTER TABLE XSD_Schemas ADD CONSTRAINT XSD_Schemas_Message_Type
    FOREIGN KEY (Message_Type_id)
    REFERENCES Message_Type (id);

-- End of file.

