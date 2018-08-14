DROP TABLE IF EXISTS bounties;

CREATE TABLE bounites(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
species VARCHAR(255),
bounty_value INT,
danger_level VARCHAR(255)
);
