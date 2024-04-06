USE NBAPLAYERS;
/*
This script is used to practice transactions.
*/

START TRANSACTION;
-- Inserts teams that have moved out of their original city.
INSERT INTO TEAM VALUES
("SON", "Seattle SuperSonics"),
("NJY", "New Jersey Nets"),
("VAN", "Vancouver Grizzlies"),
("WAB", "Washington Bullets"),
("FWP", "Fort Wayne Pistons");
-- This query checks if the new observations have been added.
SELECT * FROM TEAM;
-- Since those teams were re-allocated, we are doing a rollback because we don't need them.
ROLLBACK;
-- The following query shows that the observations have been dropped.
SELECT * FROM TEAM;




START TRANSACTION;
-- Updates the AWARD table, adding an MVP trophy for Joel Embid.
UPDATE AWARD
SET nba_mvp = 1
WHERE ID_player = 20;
-- Savepoint.
SAVEPOINT savepoint_1;
-- This query check is the observation was updated.
SELECT * FROM AWARD WHERE ID_player = 20;

UPDATE PLAYER
SET ID_team = "TOR"
WHERE ID_team = "CLE";
-- This query checks if the observations were updated
SELECT * FROM PLAYER;
-- Suppose we don't to keep this last change, but we want to keep the changes we made to the AWARD table.
-- We do a rollback to the last savepoint.
ROLLBACK TO savepoint_1;
-- This query checks if the rollback was successful
SELECT * FROM PLAYER;

-- We save the updated.
COMMIT;
