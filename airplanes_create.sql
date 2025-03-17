-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-03-17 21:01:11.349

-- tables
-- Table: airplane
CREATE TABLE airplane (
    id integer  NOT NULL,
    model varchar2(40)  NOT NULL,
    passenger_capacity integer  NOT NULL,
    range integer  NOT NULL,
    airplaneType_id integer  NOT NULL,
    CONSTRAINT airplane_pk PRIMARY KEY (id)
) ;

-- Table: airplaneType
CREATE TABLE airplaneType (
    id integer  NOT NULL,
    type varchar2(20)  NOT NULL,
    CONSTRAINT airplaneType_pk PRIMARY KEY (id)
) ;

-- Table: custommer
CREATE TABLE custommer (
    id integer  NOT NULL,
    name varchar2(50)  NOT NULL,
    personal_data varchar2(100)  NOT NULL,
    bonus_points integer  NOT NULL,
    CONSTRAINT custommer_pk PRIMARY KEY (id)
) ;

-- Table: day
CREATE TABLE day (
    id integer  NOT NULL,
    name varchar2(10)  NOT NULL,
    CONSTRAINT day_pk PRIMARY KEY (id)
) ;

-- Table: daysForRoute
CREATE TABLE daysForRoute (
    day_id integer  NOT NULL,
    route_id integer  NOT NULL,
    CONSTRAINT daysForRoute_pk PRIMARY KEY (day_id,route_id)
) ;

-- Table: employee
CREATE TABLE employee (
    id integer  NOT NULL,
    name varchar2(50)  NOT NULL,
    date_of_birth date  NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY (id)
) ;

-- Table: flight
CREATE TABLE flight (
    id integer  NOT NULL,
    route_id integer  NOT NULL,
    "date" date  NOT NULL,
    flight_number varchar2(10)  NOT NULL,
    status varchar2(10)  NOT NULL,
    airplane_id integer  NOT NULL,
    CONSTRAINT flight_pk PRIMARY KEY (id)
) ;

-- Table: language
CREATE TABLE language (
    id integer  NOT NULL,
    languages varchar2(30)  NOT NULL,
    CONSTRAINT language_pk PRIMARY KEY (id)
) ;

-- Table: languageOfEmployee
CREATE TABLE languageOfEmployee (
    language_id integer  NOT NULL,
    steward_id integer  NOT NULL,
    CONSTRAINT languageOfEmployee_pk PRIMARY KEY (language_id,steward_id)
) ;

-- Table: pilot
CREATE TABLE pilot (
    id integer  NOT NULL,
    salary float(10)  NOT NULL,
    pilot_license_number varchar2(10)  NOT NULL,
    employee_id integer  NOT NULL,
    CONSTRAINT pilot_pk PRIMARY KEY (id)
) ;

-- Table: pilotOfFlight
CREATE TABLE pilotOfFlight (
    pilot_id integer  NOT NULL,
    flight_id integer  NOT NULL,
    CONSTRAINT pilotOfFlight_pk PRIMARY KEY (pilot_id,flight_id)
) ;

-- Table: route
CREATE TABLE route (
    id integer  NOT NULL,
    departure_city varchar2(30)  NOT NULL,
    destination_city varchar2(30)  NOT NULL,
    departure_time timestamp  NOT NULL,
    landing_time timestamp  NOT NULL,
    bonus_points integer  NOT NULL,
    CONSTRAINT route_pk PRIMARY KEY (id)
) ;

-- Table: steward
CREATE TABLE steward (
    id integer  NOT NULL,
    salary float(10)  NOT NULL,
    employee_id integer  NOT NULL,
    CONSTRAINT steward_pk PRIMARY KEY (id)
) ;

-- Table: stewardOfFlight
CREATE TABLE stewardOfFlight (
    steward_id integer  NOT NULL,
    flight_id integer  NOT NULL,
    CONSTRAINT stewardOfFlight_pk PRIMARY KEY (steward_id,flight_id)
) ;

-- Table: ticket
CREATE TABLE ticket (
    id integer  NOT NULL,
    flight_id integer  NOT NULL,
    seat_number varchar2(5)  NOT NULL,
    custommer_id integer  NOT NULL,
    CONSTRAINT ticket_pk PRIMARY KEY (id)
) ;

-- foreign keys
-- Reference: airplane_airplaneType (table: airplane)
ALTER TABLE airplane ADD CONSTRAINT airplane_airplaneType
    FOREIGN KEY (airplaneType_id)
    REFERENCES airplaneType (id);

-- Reference: daysForRoute_day (table: daysForRoute)
ALTER TABLE daysForRoute ADD CONSTRAINT daysForRoute_day
    FOREIGN KEY (day_id)
    REFERENCES day (id);

-- Reference: daysForRoute_route (table: daysForRoute)
ALTER TABLE daysForRoute ADD CONSTRAINT daysForRoute_route
    FOREIGN KEY (route_id)
    REFERENCES route (id);

-- Reference: flight_airplane (table: flight)
ALTER TABLE flight ADD CONSTRAINT flight_airplane
    FOREIGN KEY (airplane_id)
    REFERENCES airplane (id);

-- Reference: flight_route (table: flight)
ALTER TABLE flight ADD CONSTRAINT flight_route
    FOREIGN KEY (route_id)
    REFERENCES route (id);

-- Reference: languageOfEmployee_language (table: languageOfEmployee)
ALTER TABLE languageOfEmployee ADD CONSTRAINT languageOfEmployee_language
    FOREIGN KEY (language_id)
    REFERENCES language (id);

-- Reference: languageOfEmployee_steward (table: languageOfEmployee)
ALTER TABLE languageOfEmployee ADD CONSTRAINT languageOfEmployee_steward
    FOREIGN KEY (steward_id)
    REFERENCES steward (id);

-- Reference: pilotOfFlight_flight (table: pilotOfFlight)
ALTER TABLE pilotOfFlight ADD CONSTRAINT pilotOfFlight_flight
    FOREIGN KEY (flight_id)
    REFERENCES flight (id);

-- Reference: pilotOfFlight_pilot (table: pilotOfFlight)
ALTER TABLE pilotOfFlight ADD CONSTRAINT pilotOfFlight_pilot
    FOREIGN KEY (pilot_id)
    REFERENCES pilot (id);

-- Reference: pilot_employee (table: pilot)
ALTER TABLE pilot ADD CONSTRAINT pilot_employee
    FOREIGN KEY (employee_id)
    REFERENCES employee (id);

-- Reference: stewardOfFlight_flight (table: stewardOfFlight)
ALTER TABLE stewardOfFlight ADD CONSTRAINT stewardOfFlight_flight
    FOREIGN KEY (flight_id)
    REFERENCES flight (id);

-- Reference: stewardOfFlight_steward (table: stewardOfFlight)
ALTER TABLE stewardOfFlight ADD CONSTRAINT stewardOfFlight_steward
    FOREIGN KEY (steward_id)
    REFERENCES steward (id);

-- Reference: steward_employee (table: steward)
ALTER TABLE steward ADD CONSTRAINT steward_employee
    FOREIGN KEY (employee_id)
    REFERENCES employee (id);

-- Reference: ticket_custommer (table: ticket)
ALTER TABLE ticket ADD CONSTRAINT ticket_custommer
    FOREIGN KEY (custommer_id)
    REFERENCES custommer (id);

-- Reference: ticket_flight (table: ticket)
ALTER TABLE ticket ADD CONSTRAINT ticket_flight
    FOREIGN KEY (flight_id)
    REFERENCES flight (id);

-- End of file.

