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
  firstname VARCHAR(30) NOT NULL,
  lastname VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone_num VARCHAR(12),
  twitter VARCHAR(15),
  facebook_url VARCHAR(100),
  location_id INTEGER NOT NULL REFERENCES locations (location_id),
  profile_pic VARCHAR(100)
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