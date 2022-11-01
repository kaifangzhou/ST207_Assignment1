/*(C) - Create all tables with their respective attributes, data types, primary and foreign keys. Remember to properly map all relationships.*/

CREATE TABLE Teams (
	Team_ID INTEGER PRIMARY KEY NOT NULL UNIQUE,
	Team_name CHAR(60) NOT NULL, 
	Division CHAR(60),
	City CHAR(60),
	League CHAR(60)
);

CREATE TABLE Coaches (
	MLB_ID INTEGER PRIMARY KEY NOT NULL UNIQUE,
	Team_ID INTEGER NOT NULL, 
	First_name CHAR(60) NOT NULL,
	Last_name CHAR(60) NOT NULL,
	DoB TEXT,
	PoB TEXT,
	FOREIGN KEY (TEAM_ID) References Teams(Team_ID)
);

CREATE TABLE Managers (
	MLB_ID INTEGER PRIMARY KEY NOT NULL UNIQUE,
	Team_ID INTEGER NOT NULL, 
	First_name CHAR(60) NOT NULL,
	Last_name CHAR(60) NOT NULL,
	DoB TEXT,
	PoB TEXT,
	FOREIGN KEY (TEAM_ID) References Teams(Team_ID)
);

CREATE TABLE Players (
	MLB_ID INTEGER PRIMARY KEY NOT NULL UNIQUE,
	Team_ID INTEGER NOT NULL, 
	First_name TEXT NOT NULL,
	Last_name TEXT NOT NULL,
	DoB TEXT,
	PoB TEXT,
	Hits_with CHAR(10), 
	BA REAL(10),
	FOREIGN KEY (TEAM_ID) References Teams(Team_ID)
);

CREATE TABLE Pitchers (
	MLB_ID INTEGER PRIMARY KEY NOT NULL UNIQUE,
	ERA REAL(10),
	FOREIGN KEY (MLB_ID) REFERENCES Players(MLB_ID)
);

CREATE TABLE Umpires (
	MLB_ID INTEGER PRIMARY KEY NOT NULL UNIQUE,
	First_name TEXT NOT NULL,
	Last_name TEXT NOT NULL,
	DoB TEXT,
	PoB TEXT
);

CREATE TABLE Games (
	Game_ID INTEGER PRIMARY KEY NOT NULL,
	Home_ID INTEGER NOT NULL, 
	Away_ID INTEGER NOT NULL,
	Umpire1_ID INTEGER NOT NULL,
	Umpire2_ID INTEGER NOT NULL,
	Game_date TEXT,
	FOREIGN KEY (Home_ID) References Teams(Team_ID),
	FOREIGN KEY (Away_ID) References Teams(Team_ID),
	FOREIGN KEY (Umpire1_ID) References Umpires(MLB_ID),
	FOREIGN KEY (Umpire2_ID) References Umpires(MLB_ID)
);

CREATE TABLE Home_Score (
	Game_ID INTEGER PRIMARY KEY NOT NULL,
	Team_ID INTEGER NOT NULL,
	Runs INTEGER,
	Errors INTEGER,
	FOREIGN KEY (Team_ID) REFERENCES Teams(Team_ID),
	FOREIGN KEY (Game_ID) REFERENCES Games(Game_ID)
);

CREATE TABLE Away_Score (
	Game_ID INTEGER PRIMARY KEY NOT NULL,
	Team_ID INTEGER NOT NULL,
	Runs INTEGER,
	Errors INTEGER,
	FOREIGN KEY (Team_ID) REFERENCES Teams(Team_ID),
	FOREIGN KEY (Game_ID) REFERENCES Games(Game_ID)
);

CREATE TABLE Hits (
	Hit_ID INTEGER PRIMARY KEY NOT NULL, 
	Game_ID INTEGER NOT NULL,
	Player_ID INTEGER NOT NULL,
	Hit_type CHAR(60),
	FOREIGN KEY (Game_ID) REFERENCES Games(Game_ID),
	FOREIGN KEY (Player_ID) REFERENCES Players(MLB_ID)
);

CREATE TABLE Results (
	Game_ID INTEGER PRIMARY KEY NOT NULL,
	W_Team_ID INTEGER NOT NULL, 
	L_Team_ID INTEGER NOT NULL,
	W_Pitcher_ID INTEGER NOT NULL,
	L_Pitcher_ID INTEGER NOT NULL,
	S_Pitcher_ID INTEGER,
	FOREIGN KEY (Game_ID) References Games(Game_ID),
	FOREIGN KEY (W_Team_ID) References Teams(Team_ID),
	FOREIGN KEY (L_Team_ID) References Teams(Team_ID),
	FOREIGN KEY (W_Pitcher_ID) References Players(MLB_ID),
	FOREIGN KEY (L_Pitcher_ID) References Players(MLB_ID),
	FOREIGN KEY (S_Pitcher_ID) References Players(MLB_ID)
);

/*(D) - Insert (populate) some data into your tables. Don't worry about the number of rows - you can play with a few teams and games.*/

INSERT INTO Teams ('Team_ID', 'Team_name', 'Division', 'City', 'League') VALUES
(100, 'Yankees', 'East', 'New_York', 'American');
INSERT INTO Teams ('Team_ID', 'Team_name', 'Division', 'City', 'League') VALUES
(101, 'Dodgers', 'West', 'Los_Angeles', 'National'),
(102, 'Twins', 'Central', 'Minneapolis',  'American');

INSERT INTO Coaches ('MLB_ID', 'Team_ID', 'First_name', 'Last_name', 'DoB', 'PoB') VALUES
(200, 100, 'Sergei', 'Rachmaninoff', '01-01-1940', 'Russia'),
(201, 101, 'Pjotr', 'Tschaikowsky', '01-02-1940', 'Russia'),
(202, 102, 'Nikolaj', 'Kapustin', '01-03-1940', 'Ukraine');

INSERT INTO Managers ('MLB_ID', 'Team_ID', 'First_name', 'Last_name', 'DoB', 'PoB') VALUES
(300, 100, 'Franz', 'Liszt', '01-04-1940', 'Hungary'),
(301, 101, 'Johannes', 'Brahms', '01-05-1940', 'Germany'),
(302, 102, 'Antonin', 'Dvorak', '01-06-1940', 'Czechia');

INSERT INTO Players ('MLB_ID', 'Team_ID', 'First_name', 'Last_name', 'DoB', 'PoB', 'Hits_with', 'BA') VALUES
(400, 100, 'George', 'Washington', '01-07-1940', 'USA', 'Switch', '0.123'),
(401, 100, 'Abraham', 'Lincoln', '01-08-1940', 'USA', 'Right', '0.234'),
(402, 100, 'Theodore', 'Roosevelt', '01-09-1940', 'USA', 'Left', '0.345'),
(403, 101, 'Boris', 'Johnson', '01-10-1940', 'USA', 'Switch', '0.456'),
(404, 101, 'Winston', 'Churchill', '01-11-1940', 'UK', 'Right', '0.111'),
(405, 101, 'Margaret', 'Thatcher', '01-12-1940', 'UK', 'Left', '0.222'),
(406, 102, 'Boris', 'Yeltsin', '01-01-1941', 'USSR', 'Switch', '0.333'),
(407, 102, 'Mikhail', 'Gorbachjov', '01-02-1941', 'USSR', 'Switch', '0.444'),
(408, 102, 'Ljonid', 'Brezhnev', '01-03-1941', 'USSR', 'Switch', '0.122');

INSERT INTO Pitchers ('MLB_ID', 'ERA') VALUES
(400, '3.210'),
(403, '4.321'),
(406, '5.432');

INSERT INTO Umpires ('MLB_ID', 'First_name', 'Last_name', 'DoB', 'PoB') VALUES
(500, 'Tony', 'Soprano', '01-04-1941', 'USA'),
(501, 'Paulie', 'Walnuts', '01-05-1941', 'USA'),
(502, 'Silvio', 'Dante', '01-06-1941', 'USA');

INSERT INTO Games ('Game_ID', 'Home_ID', 'Away_ID', 'Umpire1_ID', 'Umpire2_ID', 'Game_date') VALUES
(1000, 100, 101, 500, 501, '01-01-2020'),
(1001, 101, 100, 501, 502, '02-01-2020'),
(1002, 100, 102, 502, 501, '03-01-2020'),
(1003, 102, 100, 500, 501, '04-01-2020'),
(1004, 101, 102, 501, 502, '05-01-2020'),
(1005, 102, 101, 502, 501, '06-01-2020');

INSERT INTO Results ('Game_ID', 'W_Team_ID', 'L_Team_ID', 'W_Pitcher_ID', 'L_Pitcher_ID') VALUES
(1000, 100, 101, 400, 403),
(1001, 100, 101, 400, 403),
(1002, 100, 102, 400, 406),
(1003, 102, 100, 406, 400),
(1004, 101, 102, 403, 406),
(1005, 101, 102, 403, 406);

INSERT INTO Home_Score ('Game_ID', 'Team_ID', 'Runs', 'Errors') VALUES
(1000, 100, 5, 2),
(1001, 101, 1, 7),
(1002, 100, 7, 2),
(1003, 102, 4, 2),
(1004, 101, 1, 3),
(1005, 102, 5, 2);

INSERT INTO Away_Score ('Game_ID', 'Team_ID', 'Runs', 'Errors') VALUES
(1000, 101, 3, 1),
(1001, 100, 2, 4),
(1002, 102, 2, 6),
(1003, 100, 3, 4),
(1004, 102, 0, 3),
(1005, 101, 7, 7);

INSERT or IGNORE INTO Hits ('Hit_ID', 'Game_ID', 'Player_ID', 'Hit_type') VALUES
(900, 1000, 400, 'Single'),
(901, 1000, 401, 'Home_Run'),
(902, 1000, 402, 'Double'),
(903, 1001, 400, 'Single'),
(904, 1001, 402, 'Single'),
(905, 1001, 400, 'Single'),
(906, 1002, 407, 'Home_Run'),
(907, 1003, 400, 'Single'),
(908, 1003, 402, 'Triple'),
(909, 1004, 404, 'Single'),
(910, 1004, 405, 'Triple'),
(911, 1004, 404, 'Triple'),
(912, 1004, 403, 'Single'),
(913, 1004, 405, 'Triple'),
(914, 1004, 404, 'Triple'),
(915, 1005, 406, 'Single'),
(916, 1005, 405, 'Triple'),
(917, 1005, 407, 'Single');


/*######section for queries########*/

/* (E) - List all teams, their corresponding managers, coaches, and players. */
CREATE VIEW Personnel AS
SELECT Team_ID, First_name, Last_name
FROM Coaches
UNION ALL
SELECT Team_ID, First_name, Last_name
FROM Players
UNION ALL
SELECT Team_ID, First_name, Last_name
FROM Managers
ORDER BY Team_ID;

SELECT Teams.Team_name, Teams.Team_ID, Personnel.First_name, Personnel.Last_name
FROM Teams
JOIN Personnel ON Teams.Team_ID=Personnel.Team_ID
ORDER BY Teams.Team_ID;

/* (F) - List all games, ordered by descending number of hits. */
SELECT Game_ID, COUNT(Game_ID) 
AS most_hits
FROM Hits 
GROUP BY Game_ID 
ORDER BY most_hits 
DESC;

/* (G) - List the player (name and corresponding BA) with most hits - this can be a sum of all single, double, triple and home runs hits. In case the player is also a pitcher, list his corresponding ERA. */
SELECT First_name, Last_name, BA
FROM Players
WHERE Players.MLB_ID IN (
	SELECT Player_ID
	FROM Hits 
	GROUP BY Player_ID 
	ORDER BY COUNT(Player_ID) 
	DESC LIMIT 1);

/* (H) - List the team (name and location) which have won most games and its total score (for all the games it has played). */
CREATE VIEW Most_Runs AS
Select Team_ID, SUM(Runs) AS Total_Runs
FROM	
(SELECT Team_ID, SUM(Home_Score.Runs) AS Runs
FROM Home_Score
WHERE Home_Score.TEAM_ID IN (
	SELECT W_Team_ID
	FROM Results 
	GROUP BY W_Team_ID
	ORDER BY COUNT(W_Team_ID)
	DESC LIMIT 1)
UNION
SELECT Team_ID, SUM(Away_Score.Runs)
FROM Away_Score
WHERE Away_Score.Team_ID IN (
	SELECT W_Team_ID
	FROM Results 
	GROUP BY W_Team_ID
	ORDER BY COUNT(W_Team_ID)
	DESC LIMIT 1)
);

SELECT Team_name, City, Most_Runs.Total_Runs
FROM Teams
JOIN Most_Runs ON Teams.Team_ID=Most_Runs.Team_ID
WHERE Teams.Team_ID IN (
	SELECT W_Team_ID
	FROM Results 
	GROUP BY W_Team_ID
	ORDER BY COUNT(W_Team_ID)
	DESC LIMIT 1);
