-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-03-14 10:09:50.759

-- tables
-- Table: ShelterOnTrail
CREATE TABLE ShelterOnTrail (
    shelter_id integer  NOT NULL,
    trailPoint_trail_id integer  NOT NULL,
    CONSTRAINT ShelterOnTrail_pk PRIMARY KEY (trailPoint_trail_id,shelter_id)
) ;

-- Table: peak
CREATE TABLE peak (
    id integer  NOT NULL,
    name varchar2(50)  NOT NULL,
    absolute_height float(10)  NOT NULL,
    relative_height float(10)  NOT NULL,
    CONSTRAINT peak_pk PRIMARY KEY (id)
) ;

-- Table: peakOnTrail
CREATE TABLE peakOnTrail (
    peak_id integer  NULL,
    trailPoint_trail_id integer  NOT NULL,
    CONSTRAINT peakOnTrail_pk PRIMARY KEY (peak_id,trailPoint_trail_id)
) ;

-- Table: shelter
CREATE TABLE shelter (
    id integer  NOT NULL,
    name varchar2(50)  NOT NULL,
    altitude float(10)  NOT NULL,
    CONSTRAINT shelter_pk PRIMARY KEY (id)
) ;

-- Table: trail
CREATE TABLE trail (
    id integer  NOT NULL,
    name varchar2(50)  NOT NULL,
    color varchar2(30)  NOT NULL,
    trail_number integer  NOT NULL,
    CONSTRAINT trail_pk PRIMARY KEY (id)
) ;

-- Table: trailPoint
CREATE TABLE trailPoint (
    trail_id integer  NOT NULL,
    point_order integer  NOT NULL,
    time_to_next_point_up float(3)  NOT NULL,
    time_to_next_point_down float(3)  NOT NULL,
    CONSTRAINT trailPoint_pk PRIMARY KEY (trail_id)
) ;

-- foreign keys
-- Reference: Table_5_peak (table: peakOnTrail)
ALTER TABLE peakOnTrail ADD CONSTRAINT Table_5_peak
    FOREIGN KEY (peak_id)
    REFERENCES peak (id);

-- Reference: Table_5_trailPoint (table: peakOnTrail)
ALTER TABLE peakOnTrail ADD CONSTRAINT Table_5_trailPoint
    FOREIGN KEY (trailPoint_trail_id)
    REFERENCES trailPoint (trail_id);

-- Reference: Table_6_shelter (table: ShelterOnTrail)
ALTER TABLE ShelterOnTrail ADD CONSTRAINT Table_6_shelter
    FOREIGN KEY (shelter_id)
    REFERENCES shelter (id);

-- Reference: Table_6_trailPoint (table: ShelterOnTrail)
ALTER TABLE ShelterOnTrail ADD CONSTRAINT Table_6_trailPoint
    FOREIGN KEY (trailPoint_trail_id)
    REFERENCES trailPoint (trail_id);

-- Reference: trailPoint_trail (table: trailPoint)
ALTER TABLE trailPoint ADD CONSTRAINT trailPoint_trail
    FOREIGN KEY (trail_id)
    REFERENCES trail (id);

-- End of file.

