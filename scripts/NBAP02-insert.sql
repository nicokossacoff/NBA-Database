-- Insert data

USE NBAPLAYERS;

-- POSITIONS table

INSERT INTO POSITIONS (ID_position, position_name) VALUES
("PG", "Point Guard"),
("SG", "Shooting Guard"),
("SF", "Small Forward"),
("PF", "Power Forward"),
("C", "Center");

-- TEAM table

INSERT INTO TEAM (ID_team, team_name) VALUES
("BOS", "Boston Celtics"),
("BKN", "Brooklyn Nets"),
("NYK", "New York Knicks"),
("PHI", "Philadelphia 76ers"),
("TOR", "Toronto Raptors"),
("CHI", "Chicago Bulls"),
("CLE", "Cleaveland Cavaliers"),
("DET", "Detroit Pistons"),
("IND", "Indiana Pacers"),
("ATL", "Atlanta Hawks"),
("CHA", "Charlotte Hornets"),
("MIA", "Miami Heats"),
("ORL", "Orlando Magics"),
("WAS", "Washington Wizards"),
("DEN", "Denver Nuggets"),
("MIN", "Minnesota Timberwolves"),
("OKC", "Oklahoma City Thunders"),
("POR", "Portland Trail Blazers"),
("UTA", "Utah Jazz"),
("GSW", "Golden State Warriors"),
("LAC", "LA Clippers"),
("LAL", "Los Angeles Clippers"),
("PHO", "Phoenix Suns"),
("SAC", "Sacramento Kings"),
("DAL", "Dallas Mavericks"),
("HOU", "Houston Rockets"),
("MEM", "Memphis Grizzlies"),
("NOP", "New Orleans Pelicans"),
("SAS", "San Antonio Spurs"),
("MIL", "Milwaukee Bucks");

-- COUNTRY table

INSERT INTO COUNTRY (ID_country, country_name, continent_name) VALUES
("US", "United States", "North America"),
("GR", "Greece", "Balkans"),
("DK", "Denmark", "Europe"),
("TR", "Turkey", "Middle East"),
("AR", "Argentina", "South America"),
("GE", "Georgia", "Europe"),
("CA", "Canada", "North America"),
("SN", "Senegal", "West Africa"),
("SI", "Slovenia", "Balkans"),
("FR", "France", "Europe"),
("DE", "Germany", "Europe"),
("LT", "Lithuania", "Europe"),
("BR", "Brazil", "South America"),
("CD", "Democratic Republic of Congo", "Central Africa"),
("CM", "Cameroon", "Central Africa"),
("AU", "Australia", "Oceania"),
("HR", "Croatia", "Balkans"),
("AT", "Austria", "Europe"),
("CO", "Colombia", "South America"),
("SD", "Sudan", "North Africa"),
("RS", "Serbia", "Balkans"),
("AO", "Angola", "Central Africa"),
("JP", "Japan", "East Asia"),
("BS", "Bahamas", "Caribbean"),
("UA", "Ukraine", "Europe"),
("DO", "Dominican Republic", "Caribbean"),
("UK", "United Kingdom", "Europe"),
("EG", "Egypt", "Northeast Africa"),
("LV", "Latvia", "Europe"),
("IT", "Italy", "Europe"),
("IL", "Israel", "Middle East"),
("GA", "Gabon", "Central Africa"),
("LC", "Saint Lucia", "Caribbean"),
("ML", "Mali", "West Africa"),
("CH", "Switzerland", "Europe"),
("ES", "Spain", "Europe"),
("RC", "Republic of the Congo", "Central Africa"),
("CZ", "Czech Republic", "Europe"),
("NZ", "New Zealand", "Oceania"),
("SS", "South Sudan", "North Africa"),
("FI", "Finland", "Europe"),
("BA", "Bosnia and Herzegovina", "Balkans"),
("ME", "Montenegro", "Balkans"),
("JM", "Jamaica", "Caribbean"),
("PT", "Portugal", "Europe"),
("GN", "Guinea", "West Africa");
