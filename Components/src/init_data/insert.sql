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
('jpavner13', '$2a$10$rLMki1oS19Aalt8el5D3A.Nmz.NWXcdUmWCkiPkrR2A3Q9FlKjhse', 'Pierce', 'Avner', 'jack.avner@colorado.edu', 'https://img.freepik.com/premium-vector/fox-head-with-circle-forest_698903-1490.jpg?w=2000', 6),
('jithinrenji', '$2a$10$rdxlxq6meP4Weu35WXOGv.ttbWRTbqlVovgshS1zGIO/vR1vpEZPS', 'Jithin', 'Renji', 'jithin.renji@colorado.edu', 'https://torange.biz/photofxnew/76/HD/lion-profile-picture-76801.jpg',  6),
('keithbliss', '$2a$10$7XFmWZsS6tbiqUVNmdGqtOLI9TqC42/WCAZY8SFe7K4YWTApR5Oem', 'Keith', 'Bliss', 'keith.bliss@colorado.edu', 'https://static1.housesforsale.com/v2.4.5/assets/img/unknown_user.png', 5);

-- Full data insert
INSERT INTO users (username, password, firstname, lastname, email, profile_pic, phone_num, twitter, facebook_url, location_id) VALUES
('nick0connor', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Nick', 'OConnor', 'nioc4468@colorado.edu', 'https://wallpapers.com/images/hd/cool-neon-blue-profile-picture-u9y9ydo971k9mdcf.jpg', '314-320-5554', 'nick0connor', NULL, 25),
('StevenHarvey', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Steve', 'Harvey', 'steveharvey@gmail.com', 'https://www.wbnx.com/sites/default/files/styles/square_large/public/assets/bio/500x374-bio-family-feud-harvey.jpg?h=6544816a&itok=FbelaMBT', '111-111-1111', 'SteveHarvey', NULL, 6),
('Swifty', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Taylor', 'Swift', 'Swifty@gmail.com', 'https://media1.popsugar-assets.com/files/thumbor/hnVKqXE-xPM5bi3w8RQLqFCDw_E/475x60:1974x1559/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2019/09/09/023/n/1922398/9f849ffa5d76e13d154137.01128738_/i/Taylor-Swift.jpg', '720-325-5354', 'TaylorSwift', NULL, 6),
('JOHNCEEEEEENNNAAAA', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'John', 'Cena', 'CenaJohn@mma.net', 'https://ntvb.tmsimg.com/assets/assets/487578_v9_bb.jpg?w=270&h=360', '728-736-0189', 'JohnCena', NULL, 6),
('GET_IN _HE_HOLE!', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Tiger', 'Woods', 'GolfIsLife@pga.net', 'https://pga-tour-res.cloudinary.com/image/upload/c_fill,dpr_1.5,f_auto,g_face:center,h_439,q_auto,w_439/v1/pgatour/editorial/2022/10/13/woods-1694-benjared.jpg', '153-664-0173', 'TigerWoods', NULL, 6),
('Avs_Are_Better', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Andre', 'Burakovsky', 'AndreB@NHL.gov', 'https://cdn.theathletic.com/app/uploads/2020/10/10123801/USATSI_13704146-1024x683.jpg', '725-035-0163', 'AndreB', NULL, 6),
('ThatFootballGuy', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Payton', 'Manning', 'pama8364@colorado.edu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI9f9DsSU_ZXzwr8W9ArxSI12X2tb5VLJang&usqp=CAU', '916-726-9816', 'PaytonManning', NULL, 6),
('Obama.', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Barack', 'Obama', 'pres@government.gov', 'https://www.biography.com/.image/t_share/MTE4MDAzNDEwNzg5ODI4MTEw/barack-obama-12782369-1-402.jpg', '123-456-7890', 'BarackObama', NULL, 6),
('JohnDoe', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'John', 'Doe', 'jodo0172@colorado.edu', 'https://static1.housesforsale.com/v2.4.5/assets/img/unknown_user.png', '314-320-5554', 'JohnDoe', NULL, 25),
('JaneDoe', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Jane', 'Doe', 'jado0172@colorado.edu', 'https://static1.housesforsale.com/v2.4.5/assets/img/unknown_user.png', '314-320-5555', 'JaneDoe', NULL, 25),
('TheBestAvsPlayer', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Cale', 'Makar', 'CaleM@NHL.gov', 'https://milehighsticking.com/wp-content/uploads/getty-images/2017/07/1190618747.jpeg', '736-816-5354', 'CaleMakar', NULL, 25),
('Woody', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Oliver', 'Tree', 'WankyMusic@gmail.com', 'https://www.billboard.com/wp-content/uploads/2020/07/oliver-tree-2020-cr-Parker-Day-billboard-1548-1595254862.jpg', '018-824-1537', 'OliverTree', NULL, 25),
('HingleMcCrinkle', '$2a$10$.j4pqk3fykWZ0qcmk8CHbuJpovb9L2Bf4rb9V4DNQY2kwkS85LzHm', 'Hingle', 'McCrinkleberry', 'pumped@gmail.com', 'https://awfulannouncing.com/wp-content/uploads/sites/94/2016/12/mccringleberry_dance.jpg', '015-298-1658', 'KeyAndPeele', NULL, 25);

INSERT INTO posts (user_id, title, description, image_url, rating, location_id) VALUES
(4, 'St. Louis Arch', 'See the view of St. Louis Missouri from the top of the arch!', 'https://www.gatewayarch.com/wp-content/uploads/2020/06/GatewayArch600X400.png', 5, 25),
(12, 'St. Louis City Museum', 'Great place to go if you are young or have kids!', 'https://www.citymuseum.org/wp-content/uploads/2022/07/CityMuseum_VideoStill-min-scaled.jpg', 4, 25),
(14, 'Mizzou University', 'Beautiful university in Columbia, Missouri. Its no CU Boulder, though.', 'https://npr.brightspotcdn.com/dims4/default/185f0fc/2147483647/strip/true/crop/3000x1688+0+156/resize/1200x675!/quality/90/?url=https%3A%2F%2Fnpr.brightspotcdn.com%2F51%2F62%2F43fe7093497bb591109c608ee1b1%2F12142021-bm-mizzou-004.JPG', 3, 25),
(15, 'University City', 'U City is a suburb of St. Louis thats most known for Washington University and the Delmar Loop. Its a very cool area to walk around!', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Loop_Trolley_car_001_eastbound_on_Delmar_Blvd_near_Limit_Ave%2C_December_2018.jpg/220px-Loop_Trolley_car_001_eastbound_on_Delmar_Blvd_near_Limit_Ave%2C_December_2018.jpg', 5, 25),
(16, 'McDonalds in Hampton Village', 'They locked the doors when I tried to enter. Do not come here if you want a McChicken!', 'https://lh3.googleusercontent.com/p/AF1QipP16WabGbtI32ej87ODypN9bjLqwAO6IF00-aSD=s680-w680-h510', 1, 25);