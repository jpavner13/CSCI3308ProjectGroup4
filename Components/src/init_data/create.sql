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
('Alabama', 'United States'),
('Alaska', 'United States'),
('Arizona', 'United States'),
('Arkansas', 'United States'),
('California', 'United States'),
('Colorado', 'United States'),
('Connecticut', 'United States'),
('Delaware', 'United States'),
('Florida', 'United States'),
('Georgia', 'United States'),
('Hawaii', 'United States'),
('Idaho', 'United States'),
('Illinois', 'United States'),
('Indiana', 'United States'),
('Iowa', 'United States'),
('Kansas', 'United States'),
('Kentucky', 'United States'),
('Louisiana', 'United States'),
('Maine', 'United States'),
('Maryland', 'United States'),
('Massachusetts', 'United States'),
('Michigan', 'United States'),
('Minnesota', 'United States'),
('Mississippi', 'United States'),
('Missouri', 'United States'),
('Montana', 'United States'),
('Nebraska', 'United States'),
('Nevada', 'United States'),
('New Hampshire', 'United States'),
('New Jersey', 'United States'),
('New Mexico', 'United States'),
('New York', 'United States'),
('North Carolina', 'United States'),
('North Dakota', 'United States'),
('Ohio', 'United States'),
('Oklahoma', 'United States'),
('Oregon', 'United States'),
('Pennsylvania', 'United States'),
('Rhode Island', 'United States'),
('South Carolina', 'United States'),
('South Dakota', 'United States'),
('Tennessee', 'United States'),
('Texas', 'United States'),
('Utah', 'United States'),
('Vermont', 'United States'),
('Virginia', 'United States'),
('Washington', 'United States'),
('West Virginia', 'United States'),
('Wisconsin', 'United States'),
('Wyoming', 'United States');