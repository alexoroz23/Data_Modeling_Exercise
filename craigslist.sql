DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist;

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(10) NOT NULL,
    preferred_region VARCHAR(50) NOT NULL REFERENCES region(name)
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users ON DELETE SET NULL,
    title VARCHAR(50) NOT NULL,
    text TEXT,
    location VARCHAR(50),
    region VARCHAR(50) NOT NULL REFERENCES region(name),
    category VARCHAR(50) NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(50) NOT NULL
);

INSERT INTO region (name)
VALUES
('San Francisco'), ('Atlanta'), ('Seattle');
