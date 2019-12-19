INSERT INTO `profile` (id, date_of_birth, email, first_name, gender, join_date, last_name, no_of_disapproved_posts, profile_photo, address_id) VALUES
(1,'1977-12-25','aaahmad@mum.edu','Aser','Male','2019-12-12','Ahmad',19,NULL,NULL),
(3,'1977-12-25','jdoe@mum.edu','John','Male','2019-12-13','Doe',0,NULL,NULL),
(4,'1977-12-25','janedoe@mum.edu','Jane','Female','2019-12-13','Doe',0,NULL,NULL),
(5,'1959-12-25','mblank@mum.edu','Max','Male','2019-12-13','Blank',0,NULL,NULL),
(6,'1969-12-25','aeinstein@mum.edu','Albert','Male','2019-12-13','Einstein',0,NULL,NULL),
(7,'1967-12-25','mcurie@mum.edu','Mary','Female','2019-12-13','Curie',0,NULL,NULL),
(8,'1955-12-25','fahmad@mum.edu','Fatma','Female','2019-12-13','Ahmad',0,NULL,NULL),
(9,'1988-12-25','hmohamed@mum.edu','Hany','Male','2019-12-13','Mohamed',0,NULL,NULL),
(10,'1981-12-25','jfang@mum.edu','Janice','Female','2019-12-13','Fang',0,NULL,NULL);

INSERT INTO `user` (id, enabled, password, role, username, profile_id) VALUES
(1,true,'$2a$10$.HegavXjtQKdDp/QecZ5Ru1AIZ6zyio8hvb9m44XtDF1WXaYuAFmu','ROLE_USER','aserahmad',1),
(3,true,'$2a$10$y.4wg1J66CDvOUDoJcnkiuOqzUErRq.W6R8U8jkT270SWwwaAug.y','ROLE_ADMIN','johndoe',3),
(4,true,'$2a$10$bIchBB38lzFcJkcDviaGpesYremJQPJTL9qEcEJMO6c8IFal1X9l6','ROLE_USER','janedoe',4),
(5,false,'$2a$10$2/qBUDYJD8Sgz4e9J4vC8eCu7eOKCOu2qZPPwx51VoWVXE1klU3w2','ROLE_USER','maxblank',5),
(6,true,'$2a$10$G4b6aXP.c7kYED/Xth8HouC4xjR59Kdpc530d8Kd4sOYha/KbSN72','ROLE_MARKETING_MANAGER','aeinstein',6),
(7,false,'$2a$10$n.iQSwlgUcJay4v3f7FYwO.HsOZEEICDq4XbTkEhHw8fYQRfJ3xq6','ROLE_USER','marycurie',7),
(8,true,'$2a$10$CyXK5twqtAilxeU3RdIJqOyYWacsrE0gNXSD4jU3pl2FYlF8QwJf6','ROLE_CONTENT_MANAGER','fatmaahmad',8),
(9,false,'$2a$10$3zILQoz5TKGumD9KPlb6Vu6CW2pVvZoFezFCzPMjT8WcPWcnVv2wm','ROLE_USER','hmohamed',9),
(10,true,'$2a$10$r3.20CEfZDxW5w8INuum2esl1UTq7DTzPmgrmxXUAhzluZZUPZirK','ROLE_USER','janicefang',10);

INSERT INTO `socialnetwork`.`unhealthy_word` (`word`) VALUES
('fuck'),('damn'),('motherfucker'),('idiot'),('dick'),
('ass'),('word7');

INSERT INTO `advertisement` (id, creation_date, enabled,expiry_date,text,advertisement_id) VALUES
(1,'2019-12-25',true,'2020-12-12','Buy one cup of strbucks and earn 5 more',NULL),
(2,'2019-12-25',true,'2020-12-12','Please buy Iphone 11 it has 5 camera',NULL);


INSERT INTO `address` VALUES (1,'Fairfield','United States','Iowa');


--
-- INSERT INTO `post` VALUES (1,1,'2019-12-19 16:33:36.849000',NULL,_binary '',0,_binary '',NULL,'John Doe first post',_binary '\0',NULL,3),
-- (2,0,'2019-12-19 16:34:30.957000',NULL,_binary '',0,_binary '',NULL,'This post is by max',_binary '\0',NULL,5),(3,1,'2019-12-19 16:35:28.911000',NULL,_binary '',0,_binary '',NULL,'Hello I am Mary',_binary '\0',NULL,7),(4,0,'2019-12-19 16:36:32.954000',NULL,_binary '',0,_binary '',NULL,'Hello hope you are doing well',_binary '\0',NULL,1),(5,0,'2019-12-19 16:36:44.514000',NULL,_binary '',0,_binary '',NULL,'My second post',_binary '\0',NULL,1),
-- (6,0,'2019-12-19 16:37:01.055000',NULL,_binary '',0,_binary '',NULL,'My third post will be like this: hello world',_binary '\0',NULL,1);
--
--
-- INSERT INTO `comments` VALUES (1,'2019-12-19','hello dear',3,1),
-- (2,'2019-12-19','oh is it the first one',1,1);