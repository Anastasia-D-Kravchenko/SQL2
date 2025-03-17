-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-03-17 12:30:39.289

-- tables
-- Table: animal
CREATE TABLE animal (
    id integer  NOT NULL,
    name varchar2(30)  NOT NULL,
    date_of_birth date  NOT NULL,
    caretaker_id integer  NOT NULL,
    CONSTRAINT animal_pk PRIMARY KEY (id)
) ;

-- Table: animalCage
CREATE TABLE animalCage (
    cage_id integer  NOT NULL,
    animal_id integer  NOT NULL,
    start_date date  NOT NULL,
    end_date date  NOT NULL,
    CONSTRAINT animalCage_pk PRIMARY KEY (cage_id,animal_id)
) ;

-- Table: cage
CREATE TABLE cage (
    id integer  NOT NULL,
    location_number varchar2(10)  NOT NULL,
    description varchar2(100)  NOT NULL,
    CONSTRAINT cage_pk PRIMARY KEY (id)
) ;

-- Table: caretaker
CREATE TABLE caretaker (
    id integer  NOT NULL,
    pesel varchar2(11)  NOT NULL,
    name varchar2(30)  NOT NULL,
    surname varchar2(30)  NOT NULL,
    CONSTRAINT caretaker_pk PRIMARY KEY (id)
) ;

-- Table: category
CREATE TABLE category (
    id integer  NOT NULL,
    category varchar2(20)  NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY (id)
) ;

-- Table: examination
CREATE TABLE examination (
    id integer  NOT NULL,
    animal_id integer  NOT NULL,
    examinationRecord_id integer  NOT NULL,
    is_sick integer  NOT NULL,
    CONSTRAINT examination_pk PRIMARY KEY (id)
) ;

-- Table: examinationRecord
CREATE TABLE examinationRecord (
    id integer  NOT NULL,
    veterinarian_id integer  NOT NULL,
    "date" date  NOT NULL,
    description varchar2(100)  NOT NULL,
    CONSTRAINT examinationRecord_pk PRIMARY KEY (id)
) ;

-- Table: feeding
CREATE TABLE feeding (
    id integer  NOT NULL,
    food_id integer  NOT NULL,
    animal_id integer  NOT NULL,
    feeding_time timestamp  NOT NULL,
    amount number(10,2)  NOT NULL,
    CONSTRAINT feeding_pk PRIMARY KEY (id)
) ;

-- Table: food
CREATE TABLE food (
    id integer  NOT NULL,
    code varchar2(10)  NOT NULL,
    name varchar2(30)  NOT NULL,
    category_id integer  NOT NULL,
    unit_of_measure_id integer  NOT NULL,
    CONSTRAINT food_pk PRIMARY KEY (id)
) ;

-- Table: unit_of_measure
CREATE TABLE unit_of_measure (
    id integer  NOT NULL,
    unit_of_measure varchar2(10)  NOT NULL,
    CONSTRAINT unit_of_measure_pk PRIMARY KEY (id)
) ;

-- Table: veterinarian
CREATE TABLE veterinarian (
    id integer  NOT NULL,
    pesel varchar2(11)  NOT NULL,
    name varchar2(30)  NOT NULL,
    surname varchar2(30)  NOT NULL,
    career_start_year date  NOT NULL,
    CONSTRAINT veterinarian_pk PRIMARY KEY (id)
) ;

-- foreign keys
-- Reference: animalCage_animal (table: animalCage)
ALTER TABLE animalCage ADD CONSTRAINT animalCage_animal
    FOREIGN KEY (animal_id)
    REFERENCES animal (id);

-- Reference: animalCage_cage (table: animalCage)
ALTER TABLE animalCage ADD CONSTRAINT animalCage_cage
    FOREIGN KEY (cage_id)
    REFERENCES cage (id);

-- Reference: animal_caretaker (table: animal)
ALTER TABLE animal ADD CONSTRAINT animal_caretaker
    FOREIGN KEY (caretaker_id)
    REFERENCES caretaker (id);

-- Reference: examinationRecord_veterinarian (table: examinationRecord)
ALTER TABLE examinationRecord ADD CONSTRAINT examinationRecord_veterinarian
    FOREIGN KEY (veterinarian_id)
    REFERENCES veterinarian (id);

-- Reference: examination_animal (table: examination)
ALTER TABLE examination ADD CONSTRAINT examination_animal
    FOREIGN KEY (animal_id)
    REFERENCES animal (id);

-- Reference: examination_examinationRecord (table: examination)
ALTER TABLE examination ADD CONSTRAINT examination_examinationRecord
    FOREIGN KEY (examinationRecord_id)
    REFERENCES examinationRecord (id);

-- Reference: feeding_animal (table: feeding)
ALTER TABLE feeding ADD CONSTRAINT feeding_animal
    FOREIGN KEY (animal_id)
    REFERENCES animal (id);

-- Reference: feeding_food (table: feeding)
ALTER TABLE feeding ADD CONSTRAINT feeding_food
    FOREIGN KEY (food_id)
    REFERENCES food (id);

-- Reference: food_category (table: food)
ALTER TABLE food ADD CONSTRAINT food_category
    FOREIGN KEY (category_id)
    REFERENCES category (id);

-- Reference: food_unit_of_measure (table: food)
ALTER TABLE food ADD CONSTRAINT food_unit_of_measure
    FOREIGN KEY (unit_of_measure_id)
    REFERENCES unit_of_measure (id);

-- End of file.

