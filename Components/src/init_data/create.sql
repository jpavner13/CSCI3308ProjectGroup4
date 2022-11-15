DROP TABLE IF EXISTS locations CASCADE;
CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY NOT NULL,
  loc_name VARCHAR(20),
  country VARCHAR(20)
);

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users(
  user_id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(60) NOT NULL,
  firstname VARCHAR(20),
  lastname VARCHAR(20),
  email VARCHAR(30),
  location_id INTEGER NOT NULL REFERENCES locations (location_id)
);

DROP TABLE IF EXISTS posts CASCADE;
CREATE TABLE posts(
  post_id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users (user_id),
  title VARCHAR(100) NOT NULL,
  description VARCHAR(300), 
  image_url VARCHAR(300),
  rating INTEGER,
  location_id INT NOT NULL,
  FOREIGN KEY (location_id) REFERENCES locations (location_id)
);

DROP TABLE IF EXISTS posts_to_locations CASCADE;
CREATE TABLE posts_to_locations(
  location_id INT NOT NULL,
  post_id INT NOT NULL,
  FOREIGN KEY (location_id) REFERENCES locations (location_id),
  FOREIGN KEY (post_id) REFERENCES posts (post_id)
);

DROP TABLE IF EXISTS users_to_locations CASCADE;
CREATE TABLE users_to_locations(
  location_id INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (location_id) REFERENCES locations (location_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- ADD BASIC DATA
INSERT INTO locations (loc_name, country) VALUES
('alabama', 'united states'),
('alaska', 'united states'),
('arizona', 'united states'),
('arkansas', 'united states'),
('california', 'united states'),
('colorado', 'united states'),
('connecticut', 'united states'),
('delaware', 'united states'),
('florida', 'united states'),
('georgia', 'united states'),
('hawaii', 'united states'),
('idaho', 'united states'),
('illinois', 'united states'),
('indiana', 'united states'),
('iowa', 'united states'),
('kansas', 'united states'),
('kentucky', 'united states'),
('louisiana', 'united states'),
('maine', 'united states'),
('maryland', 'united states'),
('massachusetts', 'united states'),
('michigan', 'united states'),
('minnesota', 'united states'),
('mississippi', 'united states'),
('missouri', 'united states'),
('montana', 'united states'),
('nebraska', 'united states'),
('nevada', 'united states'),
('new hampshire', 'united states'),
('new jersey', 'united states'),
('new mexico', 'united states'),
('new york', 'united states'),
('north carolina', 'united states'),
('north dakota', 'united states'),
('ohio', 'united states'),
('oklahoma', 'united states'),
('oregon', 'united states'),
('pennsylvania', 'united states'),
('rhode island', 'united states'),
('south carolina', 'united states'),
('south dakota', 'united states'),
('tennessee', 'united states'),
('texas', 'united states'),
('utah', 'united states'),
('vermont', 'united states'),
('virginia', 'united states'),
('washington', 'united states'),
('west virginia', 'united states'),
('wisconsin', 'united states'),
('wyoming', 'united states');