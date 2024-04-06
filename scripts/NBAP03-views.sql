USE NBAPLAYERS;

CREATE OR REPLACE VIEW vw_COUNTRY_STATS AS (
	SELECT COU.ID_country AS 'Abbreviation',
		   COU.country_name AS 'Country',
		   COUNT(PL.first_name) AS 'Number of Players',
           FLOOR(AVG(DR.draft_number)) AS 'Average Draft Pick'
	FROM PLAYER AS PL
	INNER JOIN CITY AS CIT ON (PL.ID_city = CIT.ID_city)
	INNER JOIN COUNTRY AS COU ON (COU.ID_country = CIT.ID_country)
    INNER JOIN DRAFT AS DR ON (PL.ID_player = DR.ID_player)
	GROUP BY COU.ID_country, COU.country_name
);

CREATE OR REPLACE VIEW vw_TEAM_STATS AS (
	SELECT TE.ID_team AS 'Abbreviation',
		   TE.team_name AS 'Team',
           FLOOR(AVG(DR.draft_number)) AS 'Average Draft Pick',
           FLOOR(AVG(PL.age)) AS 'Average Age',
           FLOOR(AVG(PL.height)) AS 'Average Height',
           FLOOR(AVG(PL.weight)) AS 'Average Weight'
	FROM TEAM AS TE
    INNER JOIN PLAYER AS PL ON (PL.ID_team = TE.ID_team)
    INNER JOIN DRAFT AS DR ON (DR.ID_player = PL.ID_player)
    GROUP BY TE.ID_team, TE.team_name
);

CREATE OR REPLACE VIEW vw_TOP_PLAYERS AS (
	SELECT CONCAT(PL.first_name, ' ', PL.last_name) AS 'Player',
		   PG.points_pg AS 'Points per Game',
		   PG.rebounds_pg AS 'Rebounds per Game',
           PG.assists_pg AS 'Assists per Game'
	FROM PLAYER AS PL
    INNER JOIN PG_STAT AS PG ON (PL.ID_player = PG.ID_player)
    ORDER BY PG.points_pg DESC, PG.rebounds_pg DESC, PG.assists_pg DESC
    LIMIT 10
);

CREATE OR REPLACE VIEW vw_TOP_SHOOTING_PERFORMANCE AS (
	SELECT CONCAT(PL.first_name, ' ', PL.last_name) AS 'Player',
		   SH.fieldgoals_made AS 'Fieldgoals Made',
           SH.threepoints_made AS 'Three-pointers Made',
           SH.freethrows_made AS 'Freethrows Made'
	FROM PLAYER AS PL
	INNER JOIN SHOOTING_STAT AS SH ON (PL.ID_player = SH.ID_player)
	ORDER BY SH.fieldgoals_made DESC, SH.threepoints_made DESC, SH.freethrows_made DESC
	LIMIT 20
);

CREATE OR REPLACE VIEW vw_POSITION_PERFORMANCE AS (
	SELECT PS.position_name AS 'Position',
		   FLOOR(AVG(SH.fieldgoals_made)) AS 'Average Fieldgoals Made by Position',
           FLOOR(AVG(SH.threepoints_made)) AS 'Average Three-pointers Made by Position',
           FLOOR(AVG(SH.freethrows_made)) AS 'Average Freetrhows Made by Position'
	FROM PLAYER AS PL
	INNER JOIN SHOOTING_STAT AS SH ON (PL.ID_player = SH.ID_player)
    INNER JOIN POSITIONS AS PS ON (PL.ID_position = PS.ID_position)
    GROUP BY PS.position_name
	ORDER BY FLOOR(AVG(SH.fieldgoals_made)) DESC, FLOOR(AVG(SH.threepoints_made)) DESC, FLOOR(AVG(SH.freethrows_made)) DESC
);

SELECT * FROM vw_TOP_SHOOTING_PERFORMANCE;
