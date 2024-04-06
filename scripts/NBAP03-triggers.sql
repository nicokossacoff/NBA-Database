USE NBAPLAYERS;

-- Creates LOG tables

DROP TABLE IF EXISTS PLAYERS_LOG;
DROP TABLE IF EXISTS PLAYERS_BACKUP;
DROP TABLE IF EXISTS SHOOTING_STAT_LOG;
DROP TABLE IF EXISTS SHOOTING_STAT_BACKUP;


CREATE TABLE PLAYERS_LOG (
	ID_log					INT AUTO_INCREMENT,
	ID_player				INT,
    user					VARCHAR(100),
    date					DATE,
    time					VARCHAR(20),
    action					VARCHAR(50),
    PRIMARY KEY(ID_log)
);

CREATE TABLE PLAYERS_BACKUP (
	ID_log						INT AUTO_INCREMENT,
    ID_player					INT,
    first_name					VARCHAR(20),
    last_name					VARCHAR(20),
    age							TINYINT,
    height						INT,
    weight						INT,
    season						CHAR(7),
    ID_team						VARCHAR(6),
	ID_position					VARCHAR(3),
    ID_city						VARCHAR(6),
    ID_college					Varchar(6),
    action						VARCHAR(10),
    PRIMARY KEY(ID_log)
);

CREATE TABLE SHOOTING_STAT_LOG (
	ID_log						INT AUTO_INCREMENT,
	ID_player					INT,
    user						VARCHAR(100),
    date						DATE,
    time						VARCHAR(20),
    action						VARCHAR(50),
    PRIMARY KEY(ID_log)
);

CREATE TABLE SHOOTING_STAT_BACKUP (
	ID_log							INT AUTO_INCREMENT,
	ID_player						INT,
    fieldgoals_made					INT,
    fieldgoals_attempted			INT,
    threepoints_made				INT,
    threepoints_attempted			INT,
    freethrows_made					INT,
    freethrows_attempted		 	INT,
    action							VARCHAR(10),
    PRIMARY KEY(ID_log)
);

-- Creates triggers

DROP TRIGGER IF EXISTS `TR_PLAYERS_LOG`;
DROP TRIGGER IF EXISTS `TR_PLAYERS_BACKUP_UPDATE`;
DROP TRIGGER IF EXISTS `TR_SHOOTING_STAT_LOG`;
DROP TRIGGER IF EXISTS `TR_SHOOTING_STAT_BACKUP_UPDATE`;

/*
    This trigger stores the time, date, and the user who has updated the PLAYER table.
*/

DELIMITER $$
CREATE TRIGGER `TR_PLAYERS_LOG` AFTER UPDATE ON `PLAYER`
FOR EACH ROW
	BEGIN
		INSERT INTO `PLAYERS_LOG` (ID_log, ID_player, user, date, time, action) VALUES (null, OLD.ID_player, USER(), CURDATE(), CURTIME(), 'Update');
	END $$
DELIMITER ;

/*
    This trigger stores the observation before it is updated (PLAYER table).
*/
DELIMITER $$
CREATE TRIGGER `TR_PLAYERS_BACKUP_UPDATE` AFTER UPDATE ON `PLAYER`
FOR EACH ROW
	BEGIN
		INSERT INTO `PLAYERS_BACKUP` (ID_log, ID_player, first_name, last_name, age, height, weight, season, ID_team, ID_position, ID_city, ID_college, action) VALUES (null, OLD.ID_player, OLD.first_name, OLD.last_name, OLD.age, OLD.height, OLD.weight, OLD.season, OLD.ID_team, OLD.ID_position, OLD.ID_city, OLD.ID_college, 'Update');
	END $$
DELIMITER ;

/*
    This trigger stores the time, date, and the user who has updated the SHOOTING_STAT table.
*/

DELIMITER $$
CREATE TRIGGER `TR_SHOOTING_STAT_LOG` AFTER UPDATE ON `SHOOTING_STAT`
FOR EACH ROW
	BEGIN
		INSERT INTO `SHOOTING_STAT_LOG` (ID_log, ID_player, user, date, time, action) VALUES (null, OLD.ID_player, USER(), CURDATE(), CURTIME(), 'Update');
	END $$
DELIMITER ;

/*
    This trigger stores the observation before it is updated (SHOOTING_STAT table).
*/
DELIMITER $$
CREATE TRIGGER `TR_SHOOTING_STAT_BACKUP_UPDATE` AFTER UPDATE ON `SHOOTING_STAT`
FOR EACH ROW
	BEGIN
		INSERT INTO `SHOOTING_STAT_BACKUP` (ID_log, ID_player, fieldgoals_made, fieldgoals_attempted, threepoints_made, threepoints_attempted, freethrows_made, freethrows_attempted, action) VALUES (null, OLD.ID_player, OLD.fieldgoals_made, OLD.fieldgoals_attempted, OLD.threepoints_made, OLD.threepoints_attempted, OLD.freethrows_made, OLD.freethrows_attempted, 'Update');
	END $$
DELIMITER ;
