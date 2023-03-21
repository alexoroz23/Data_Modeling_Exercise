Copy code
DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    team_id INTEGER REFERENCES teams(id) ON DELETE SET NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams(id) NOT NULL,
    away_team_id INTEGER REFERENCES teams(id) NOT NULL,
    referee_id INTEGER REFERENCES referees(id) ON DELETE SET NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches(id) NOT NULL,
    player_id INTEGER REFERENCES players(id) NOT NULL,
    team_id INTEGER REFERENCES teams(id) NOT NULL,
    minute INTEGER NOT NULL
);