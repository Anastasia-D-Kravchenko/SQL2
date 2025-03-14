-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-03-14 08:48:16.96

-- tables
-- Table: match
CREATE TABLE match (
    id integer  NOT NULL,
    "date" date  NOT NULL,
    time timestamp  NOT NULL,
    location varchar2(100)  NOT NULL,
    CONSTRAINT match_pk PRIMARY KEY (id)
) ;

-- Table: player
CREATE TABLE player (
    id integer  NOT NULL,
    name varchar2(100)  NOT NULL,
    date_of_birth date  NOT NULL,
    position varchar2(30)  NOT NULL,
    CONSTRAINT player_pk PRIMARY KEY (id)
) ;

-- Table: playerOfMatch
CREATE TABLE playerOfMatch (
    player_id integer  NOT NULL,
    match_id integer  NOT NULL,
    CONSTRAINT playerOfMatch_pk PRIMARY KEY (player_id,match_id)
) ;

-- Table: playerOfTeam
CREATE TABLE playerOfTeam (
    player_id integer  NOT NULL,
    team_id integer  NOT NULL,
    CONSTRAINT playerOfTeam_pk PRIMARY KEY (player_id,team_id)
) ;

-- Table: redCard
CREATE TABLE redCard (
    id integer  NOT NULL,
    "date" date  NOT NULL,
    time timestamp  NOT NULL,
    reason varchar2(30)  NOT NULL,
    CONSTRAINT redCard_pk PRIMARY KEY (id)
) ;

-- Table: redCardOfPlayer
CREATE TABLE redCardOfPlayer (
    redCard_id integer  NOT NULL,
    player_id integer  NOT NULL,
    match_id integer  NOT NULL,
    CONSTRAINT redCardOfPlayer_pk PRIMARY KEY (redCard_id,player_id,match_id)
) ;

-- Table: team
CREATE TABLE team (
    id integer  NOT NULL,
    name varchar2(100)  NOT NULL,
    city varchar2(30)  NOT NULL,
    coach varchar2(100)  NOT NULL,
    CONSTRAINT team_pk PRIMARY KEY (id)
) ;

-- Table: teamOfMatch
CREATE TABLE teamOfMatch (
    match_id integer  NOT NULL,
    team_id integer  NOT NULL,
    team_2_id integer  NOT NULL,
    CONSTRAINT teamOfMatch_pk PRIMARY KEY (match_id,team_id,team_2_id)
) ;

-- foreign keys
-- Reference: playerOfMatch_match (table: playerOfMatch)
ALTER TABLE playerOfMatch ADD CONSTRAINT playerOfMatch_match
    FOREIGN KEY (match_id)
    REFERENCES match (id);

-- Reference: playerOfMatch_player (table: playerOfMatch)
ALTER TABLE playerOfMatch ADD CONSTRAINT playerOfMatch_player
    FOREIGN KEY (player_id)
    REFERENCES player (id);

-- Reference: playerOfTeam_player (table: playerOfTeam)
ALTER TABLE playerOfTeam ADD CONSTRAINT playerOfTeam_player
    FOREIGN KEY (player_id)
    REFERENCES player (id);

-- Reference: playerOfTeam_team (table: playerOfTeam)
ALTER TABLE playerOfTeam ADD CONSTRAINT playerOfTeam_team
    FOREIGN KEY (team_id)
    REFERENCES team (id);

-- Reference: redCardOfPlayer_playerOfMatch (table: redCardOfPlayer)
ALTER TABLE redCardOfPlayer ADD CONSTRAINT redCardOfPlayer_playerOfMatch
    FOREIGN KEY (player_id,match_id)
    REFERENCES playerOfMatch (player_id,match_id);

-- Reference: redCardOfPlayer_redCard (table: redCardOfPlayer)
ALTER TABLE redCardOfPlayer ADD CONSTRAINT redCardOfPlayer_redCard
    FOREIGN KEY (redCard_id)
    REFERENCES redCard (id);

-- Reference: teamOfMatch2_team (table: teamOfMatch)
ALTER TABLE teamOfMatch ADD CONSTRAINT teamOfMatch2_team
    FOREIGN KEY (team_2_id)
    REFERENCES team (id);

-- Reference: teamOfMatch_match (table: teamOfMatch)
ALTER TABLE teamOfMatch ADD CONSTRAINT teamOfMatch_match
    FOREIGN KEY (match_id)
    REFERENCES match (id);

-- Reference: teamOfMatch_team (table: teamOfMatch)
ALTER TABLE teamOfMatch ADD CONSTRAINT teamOfMatch_team
    FOREIGN KEY (team_id)
    REFERENCES team (id);

-- End of file.

