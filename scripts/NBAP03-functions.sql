USE NBAPLAYERS;
DROP FUNCTION IF EXISTS `SHOOTING_PERCENTAGE`;
DROP FUNCTION IF EXISTS `AVERAGE_AGE_TEAM`;
/*
	This function is used to calculate a player's shooting percentage. 
	The "shots_made" parameter represents the number of points made, 
	while the "shots_attempted" parameter represents the total number of shots attempted.
*/

DELIMITER $$
USE NBAPLAYERS $$
CREATE FUNCTION `SHOOTING_PERCENTAGE` (shots_made INT, shots_attempted INT)
RETURNS FLOAT
NO SQL
BEGIN
	DECLARE result FLOAT;
	SET result = (shots_made / shots_attempted);
	RETURN result;
END;$$

DELIMITER ;

/*
	This function returns the average age for a team.
*/

DELIMITER $$
USE NBAPLAYERS $$
CREATE FUNCTION `AVERAGE_AGE_TEAM` (team_code VARCHAR(22))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE RESULT INT;
    SET RESULT = (SELECT FLOOR(AVG(P.age)) FROM PLAYER AS P WHERE P.ID_team = team_code);
    RETURN RESULT;
END;$$

DELIMITER ;

SELECT `SHOOTING_PERCENTAGE`(400, 1267) AS "Shooting Percentage";
SELECT `AVERAGE_AGE_TEAM`("MEM") AS "Average Age";
