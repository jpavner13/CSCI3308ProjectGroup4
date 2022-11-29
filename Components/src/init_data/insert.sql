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

-- Passwords are all first names all lowercase
-- ie Nick's password is 'nick'

-- Bare-bones user data
INSERT INTO users (username, password, firstname, lastname, email, profile_pic, location_id) VALUES
('jpavner13', '$2a$10$rLMki1oS19Aalt8el5D3A.Nmz.NWXcdUmWCkiPkrR2A3Q9FlKjhse', 'Pierce', 'Avner', 'jack.avner@colorado.edu', 'https://static1.housesforsale.com/v2.4.5/assets/img/unknown_user.png', 6),
('jithinrenji', '$2a$10$rdxlxq6meP4Weu35WXOGv.ttbWRTbqlVovgshS1zGIO/vR1vpEZPS', 'Jithin', 'Renji', 'jithin.renji@colorado.edu', 'https://static1.housesforsale.com/v2.4.5/assets/img/unknown_user.png',  6),
('keithbliss', '$2a$10$7XFmWZsS6tbiqUVNmdGqtOLI9TqC42/WCAZY8SFe7K4YWTApR5Oem', 'Keith', 'Bliss', 'keith.bliss@colorado.edu', 'https://static1.housesforsale.com/v2.4.5/assets/img/unknown_user.png', 5);

-- Full data insert
INSERT INTO users (username, password, firstname, lastname, email, profile_pic, phone_num, twitter, facebook_url, location_id) VALUES
('nick0connor', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Nick', 'OConnor', 'nioc4468@colorado.edu', 'https://wallpapers.com/images/hd/cool-neon-blue-profile-picture-u9y9ydo971k9mdcf.jpg', '314-320-5554', 'nick0connor', NULL, 25);