DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
    username VARCHAR(50) PRIMARY KEY,
    password CHAR(60) NOT NULL,
    location VARCHAR(50) NOT NULL
);

-- INSERT INTO users (username, password, location) VALUES (jpvner13, Pierce, Denver);
-- INSERT INTO users (username, password, location) VALUES (kiethbliss, Kieth, Boulder);
-- INSERT INTO users (username, password, location) VALUES (JunoPark-01, Juno, Colorado Springs);
-- INSERT INTO users (username, password, location) VALUES (nick0cinnor, Nick, Fort Collins);
-- INSERT INTO users (username, password, location) VALUES (jithinrenji, Jithin, Breckenridge);

-- DROP TABLE IF EXISTS profilePics CASCADE;
-- CREATE TABLE profilePics(
--     username VARCHAR(50) PRIMARY KEY,
--     profilePic BLOB NOT NULL
-- )