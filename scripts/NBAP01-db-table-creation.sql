-- Creates a new schema (if it does not exists yet)
CREATE SCHEMA IF NOT EXISTS nbaplayers;
USE nbaplayers;

-- Creates tables
CREATE TABLE TEAM (
	ID_team			CHAR(3) NOT NULL,
    team_name		VARCHAR(22) NOT NULL,
	PRIMARY KEY (ID_team)
);

CREATE TABLE POSITIONS (
	ID_position			VARCHAR(3) NOT NULL,
    position_name		VARCHAR(20) NOT NULL,
    PRIMARY KEY (ID_position)
);

CREATE TABLE COUNTRY (
	ID_country			CHAR(2) NOT NULL,
    country_name		VARCHAR(30) NOT NULL,
    continent_name		VARCHAR(30) NOT NULL,
    PRIMARY KEY (ID_country)
);

CREATE TABLE CITY (
	ID_city			VARCHAR(6) NOT NULL,
    ID_country		VARCHAR(6) NOT NULL,
    city_name		VARCHAR(30) NOT NULL,
    state_name		VARCHAR(30) NOT NULL,
    PRIMARY KEY (ID_city),
    FOREIGN KEY (ID_country) REFERENCES COUNTRY(ID_country) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE COLLEGE (
	ID_college			VARCHAR(6) NOT NULL,
    college_name		VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_college)
);

CREATE TABLE PLAYER (
    ID_player			INT NOT NULL AUTO_INCREMENT,
    first_name			VARCHAR(20) NOT NULL,
    last_name			VARCHAR(20) NOT NULL,
    age					TINYINT NOT NULL,
    height				INT NOT NULL,
    weight				INT NOT NULL,
    season				CHAR(7) NOT NULL,
    ID_team				VARCHAR(6) NOT NULL,
    ID_position			VARCHAR(3) NOT NULL,
    ID_city				VARCHAR(6) NOT NULL,
    ID_college			VARCHAR(6) NOT NULL,
    PRIMARY KEY (ID_player),
    FOREIGN KEY (ID_team) REFERENCES TEAM(ID_team) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (ID_position) REFERENCES POSITIONS(ID_position) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (ID_city) REFERENCES CITY(ID_city) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (ID_college) REFERENCES COLLEGE(ID_college) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE DRAFT (
	ID_player		INT NOT NULL,
    draft_year		VARCHAR(10),
    draft_number	VARCHAR(10),
    draft_round		VARCHAR(10),
    PRIMARY KEY (ID_player),
    FOREIGN KEY (ID_player) REFERENCES PLAYER(ID_player) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE PG_STAT (
	ID_player			INT NOT NULL,
	games_played		TINYINT NOT NULL,
    points_pg			DECIMAL(3,1) NOT NULL,
    rebounds_pg			DECIMAL(3,1) NOT NULL,
    assists_pg			DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (ID_player),
    FOREIGN KEY (ID_player) REFERENCES PLAYER(ID_player) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE SHOOTING_STAT (
	ID_player				INT NOT NULL,
	fieldgoals_made			INT NOT NULL,
    fieldgoals_attempted	INT NOT NULL,
    threepoints_made		INT NOT NULL,
    threepoints_attempted	INT NOT NULL,
    freethrows_made			INT NOT NULL,
    freethrows_attempted	INT NOT NULL,
    PRIMARY KEY (ID_player),
    FOREIGN KEY (ID_player) REFERENCES PLAYER(ID_player) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE AWARD (
	ID_player			INT NOT NULL,
	all_nba				TINYINT NOT NULL,
    nba_mvp				TINYINT NOT NULL,
    allstar_mvp			TINYINT NOT NULL,
    nba_champion		BOOLEAN NOT NULL,
    nba_championships	TINYINT NOT NULL,
    PRIMARY KEY (ID_player),
    FOREIGN KEY (ID_player) REFERENCES PLAYER(ID_player) ON UPDATE CASCADE ON DELETE RESTRICT
);
