CREATE SEQUENCE seq_season START 1;
CREATE SEQUENCE seq_league START 1;
CREATE SEQUENCE seq_team START 1;
CREATE SEQUENCE seq_player START 1;

-- independant tables

CREATE TABLE season(
    seasonID integer DEFAULT nextval('seq_season') PRIMARY KEY,
    startdate date NOT NULL,
    enddate date NOT NULL,
    commonname varchar(20) UNIQUE NOT NULL,
);

CREATE TABLE league(
    leagueID integer DEFAULT nextval('seq_league') PRIMARY KEY,
    name varchar(100) UNIQUE NOT NULL,
    hierarchylevel integer NOT NULL,
);

CREATE TABLE team(
    teamID integer DEFAULT nextval('seq_team') PRIMARY KEY,
    name varchar(100) UNIQUE NOT NULL,
    abbreviation char(3) UNIQUE NOT NULL,
    city varchar(100) NOT NULL,
    stadium varchar(100) NOT NULL
);

CREATE TABLE player(
    playerID integer DEFAULT nextval('seq_player') PRIMARY KEY,
    name varchar(100) NOT NULL,
    dateofbirth date NOT NULL,
    nationality varchar(50) NOT NULL,
    fieldposition varchar(30),
    height integer,
);

-- dependent tables

CREATE TABLE belongsToLeague(
    teamID integer,
    seasonID integer,
    leagueID integer,
    PRIMARY KEY(teamID, seasonID, leagueID),
    FOREIGN KEY(teamID) REFERENCES team(teamID),
    FOREIGN KEY(seasonID) REFERENCES season(seasonID),
    FOREIGN KEY(leagueID) REFERENCES league(leagueID)
);

CREATE TABLE playsFor(
    playerID integer,
    teamID integer,
    since date NOT NULL,
    until date,
    shirtnumber integer,
    PRIMARY KEY(playerID, teamID, since),
    FOREIGN KEY(playerID) REFERENCES player(playerID),
    FOREIGN KEY(teamID) REFERENCES team(teamID)
);

CREATE TABLE match(
    homeTeamID integer,
    awayTeamID integer,
    seasonID integer,
    playedon date NOT NULL,
    homegoals integer DEFAULT 0 NOT NULL,
    awaygoals integer DEFAULT 0 NOT NULL,
    PRIMARY KEY(homeTeamID, awayTeamID, seasonID),
    FOREIGN KEY(homeTeamID) REFERENCES team(teamID),
    FOREIGN KEY(awayTeamID) REFERENCES team(teamID),
    FOREIGN KEY(seasonID) REFERENCES season(seasonID)
);