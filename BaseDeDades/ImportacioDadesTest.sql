USE  minder;

LOAD DATA LOCAL INFILE 'D:\USER.csv' INTO TABLE Importacio FIELDS TERMINATED BY ',' IGNORE 1 LINES;
INSERT INTO User(userName, birth_date, premium, email, password) SELECT userName, birth_date, premium, email, password FROM Importacio;
INSERT INTO Perfil(userName, image, description, llenguatge_pref) SELECT userName, image, description, llenguatge_pref FROM Importacio;


LOAD DATA LOCAL INFILE 'D:\LIKES.csv' INTO TABLE Import_Likes FIELDS TERMINATED BY ',' IGNORE 1 LINES;
DELETE from Import_Likes WHERE user_sender = user_receiver;
UPDATE Import_Likes SET Timestamp_time = CONCAT('0', Timestamp_time) WHERE char_length(Timestamp_time) = 7;
INSERT INTO  Likes(date, user_sender, user_receiver, isLike)
SELECT CONCAT(Timestamp_date,' ' ,  Timestamp_time), user_sender, user_receiver, isLike FROM Import_Likes;

LOAD DATA LOCAL INFILE 'D:\MESSAGES.csv' INTO TABLE Import_Message FIELDS TERMINATED BY ',' IGNORE 1 LINES;

UPDATE Import_Message SET Timestamp_time = CONCAT('0', Timestamp_time) WHERE char_length(Timestamp_time) = 7;
INSERT INTO  Message(timestamp, user_sender, user_receiver, content)
SELECT CONCAT(Timestamp_date,' ' ,  Timestamp_time), user_sender, user_receiver, content FROM Import_Message;

