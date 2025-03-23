-- Access_Control_List Table Modifications
ALTER TABLE Access_Control_List ADD LastUpdated TIMESTAMP;
UPDATE Access_Control_List SET LastUpdated = CURRENT_TIMESTAMP;
ALTER TABLE Access_Control_List ADD CONSTRAINT PermissionRange CHECK (Permission BETWEEN 1 AND 3);

-- Activity Table Modifications
ALTER TABLE Activity ADD User_id INTEGER;
SELECT * FROM Activity WHERE User_id is null;

-- Category Table Modifications
ALTER TABLE Category ADD Description VARCHAR2(255);
UPDATE Category SET Description = 'Financial transactions' WHERE Category = 'Payments';

-- All_MessageType Table Modifications
ALTER TABLE All_MessageType ADD VersionDate DATE;
UPDATE All_MessageType SET VersionDate = TO_DATE('2023-12-31', 'YYYY-MM-DD') WHERE MessageType = 'MT103';

-- BIC_Directory Table Modifications
ALTER TABLE BIC_Directory ADD City VARCHAR2(255);
SELECT BIC FROM BIC_Directory WHERE NOT REGEXP_LIKE(BIC, '^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$';

-- ColorCode Table Modifications
ALTER TABLE ColorCode ADD RGB VARCHAR2(10);
UPDATE ColorCode SET RGB = '#FF0000' WHERE ColorCode = 'Red';

-- Component Table Modifications
ALTER TABLE Component ADD Status VARCHAR2(20);
UPDATE Component SET Status = 'Active' WHERE Name = 'Alliance Access';

-- Message_Type Table Modifications
ALTER TABLE Message_Type ADD Format VARCHAR2(10);
UPDATE Message_Type SET Format = 'XML' WHERE MessageType_id = 1;

-- Currency Table Modifications
ALTER TABLE Currency ADD Symbol VARCHAR2(5);
SELECT * FROM Currency WHERE Symbol is null;

-- Transaction_Status Table Modifications
ALTER TABLE Transaction_Status ADD Description VARCHAR2(255);
UPDATE Transaction_Status SET Description = 'Transaction successfully completed' WHERE TransactionStatus = 'Completed';

-- Transaction Table Modifications
ALTER TABLE Transaction ADD ReferenceNumber VARCHAR2(50);
ALTER TABLE Transaction ADD CONSTRAINT PositiveAmount CHECK (Amount > 0);

-- Direction Table Modifications
ALTER TABLE Direction ADD Description VARCHAR2(255);

-- DomainName Table Modifications
ALTER TABLE DomainName ADD IPRange VARCHAR2(50);

-- Status Table Modifications
ALTER TABLE Status ADD StatusCode VARCHAR2(10);

-- Correlation_Repository Table Modifications
ALTER TABLE Correlation_Repository ADD CorrelationID VARCHAR2(50);

-- Source_Component Table Modifications
ALTER TABLE Source_Component ADD Version VARCHAR2(20);

-- Severity Table Modifications
ALTER TABLE Severity ADD Description VARCHAR2(255);

-- Error_Message Table Modifications
ALTER TABLE Error_Message ADD Resolution VARCHAR2(255);

-- EventType_Massage Table Modifications
ALTER TABLE EventType_Massage ADD Description VARCHAR2(255);

-- EventType_Transaction Table Modifications
ALTER TABLE EventType_Transaction ADD Description VARCHAR2(255);

-- EventType_User Table Modifications
ALTER TABLE EventType_User ADD Description VARCHAR2(255);

-- Role Table Modifications
ALTER TABLE Role ADD CreationDate DATE;

-- Message_Validation_Rule Table Modifications
ALTER TABLE Message_Validation_Rule ADD RuleStatus VARCHAR2(20);

-- Message_Validation_Log Table Modifications
ALTER TABLE Message_Validation_Log ADD ResolutionStatus VARCHAR2(20);

-- Message_Validation_Alert Table Modifications
ALTER TABLE Message_Validation_Alert ADD Description VARCHAR2(255);

-- Transaction_Log Table Modifications
ALTER TABLE Transaction_Log ADD ResolutionStatus VARCHAR2(20);
