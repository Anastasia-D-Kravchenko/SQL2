-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-03-14 11:51:00.111

-- tables
-- Table: bus
CREATE TABLE bus (
    id integer  NOT NULL,
    bus_registration varchar2(30)  NOT NULL,
    bus_model varchar2(30)  NOT NULL,
    CONSTRAINT bus_pk PRIMARY KEY (id)
) ;

-- Table: busLine
CREATE TABLE busLine (
    id integer  NOT NULL,
    "number" varchar2(10)  NOT NULL,
    name varchar2(50)  NOT NULL,
    CONSTRAINT busLine_pk PRIMARY KEY (id)
) ;

-- Table: busRoute
CREATE TABLE busRoute (
    bus_id integer  NOT NULL,
    route_id integer  NOT NULL,
    CONSTRAINT busRoute_pk PRIMARY KEY (bus_id,route_id)
) ;

-- Table: busStop
CREATE TABLE busStop (
    id integer  NOT NULL,
    name varchar2(50)  NOT NULL,
    latitude float(5)  NOT NULL,
    longitude float(5)  NOT NULL,
    CONSTRAINT busStop_pk PRIMARY KEY (id)
) ;

-- Table: departureTime
CREATE TABLE departureTime (
    id integer  NOT NULL,
    route_id integer  NOT NULL,
    lineStop_id integer  NOT NULL,
    departure_time timestamp  NOT NULL,
    CONSTRAINT departureTime_pk PRIMARY KEY (id)
) ;

-- Table: lineStop
CREATE TABLE lineStop (
    id integer  NOT NULL,
    busLine_id integer  NOT NULL,
    busStop_id integer  NOT NULL,
    stop_order integer  NOT NULL,
    CONSTRAINT lineStop_pk PRIMARY KEY (id)
) ;

-- Table: route
CREATE TABLE route (
    id integer  NOT NULL,
    schedule_id integer  NOT NULL,
    start_time timestamp  NOT NULL,
    CONSTRAINT route_pk PRIMARY KEY (id)
) ;

-- Table: schedule
CREATE TABLE schedule (
    id integer  NOT NULL,
    busLine_id integer  NOT NULL,
    valid_from date  NOT NULL,
    valid_to date  NULL,
    CONSTRAINT schedule_pk PRIMARY KEY (id)
) ;

-- foreign keys
-- Reference: busOnRoute_bus (table: busRoute)
ALTER TABLE busRoute ADD CONSTRAINT busOnRoute_bus
    FOREIGN KEY (bus_id)
    REFERENCES bus (id);

-- Reference: busOnRoute_route (table: busRoute)
ALTER TABLE busRoute ADD CONSTRAINT busOnRoute_route
    FOREIGN KEY (route_id)
    REFERENCES route (id);

-- Reference: departureTime_lineStop (table: departureTime)
ALTER TABLE departureTime ADD CONSTRAINT departureTime_lineStop
    FOREIGN KEY (lineStop_id)
    REFERENCES lineStop (id);

-- Reference: departureTime_route (table: departureTime)
ALTER TABLE departureTime ADD CONSTRAINT departureTime_route
    FOREIGN KEY (route_id)
    REFERENCES route (id);

-- Reference: lineStop_busLine (table: lineStop)
ALTER TABLE lineStop ADD CONSTRAINT lineStop_busLine
    FOREIGN KEY (busLine_id)
    REFERENCES busLine (id);

-- Reference: lineStop_busStop (table: lineStop)
ALTER TABLE lineStop ADD CONSTRAINT lineStop_busStop
    FOREIGN KEY (busStop_id)
    REFERENCES busStop (id);

-- Reference: route_schedule (table: route)
ALTER TABLE route ADD CONSTRAINT route_schedule
    FOREIGN KEY (schedule_id)
    REFERENCES schedule (id);

-- Reference: schedule_busLine (table: schedule)
ALTER TABLE schedule ADD CONSTRAINT schedule_busLine
    FOREIGN KEY (busLine_id)
    REFERENCES busLine (id);

-- End of file.

