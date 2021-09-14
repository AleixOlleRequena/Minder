CREATE DATABASE IF NOT EXISTS minder;
USE  minder;

SET GLOBAL local_infile = 1;

-- CODI PER CREAR LA BASE DE DADES NECESARIA I IMPORTAR UNA BASE DE DADES AMB UNA GRAN QUANTITAT D'USUARIS PER FER TEST.


DROP TABLE IF EXISTS Importacio CASCADE;
DROP TABLE IF EXISTS Import_Message CASCADE;
DROP TABLE IF EXISTS Import_Likes CASCADE;
DROP TABLE IF EXISTS Likes CASCADE;
DROP TABLE IF EXISTS Perfil CASCADE;
DROP TABLE IF EXISTS Message CASCADE;
DROP TABLE IF EXISTS User CASCADE ;

CREATE TABLE Importacio(
    userName       VARCHAR(255),
    birth_date      Date, #int age --> Date birth_date
    premium         BOOLEAN,
    email           VARCHAR(255),
    password        VARCHAR(255),
    image           VARCHAR(255),
    description     TEXT,
    llenguatge_pref INT
);

CREATE TABLE Import_Message
(
    Timestamp_date VARCHAR(255),
    Timestamp_time VARCHAR(255),
    user_sender   VARCHAR(255),
    user_receiver VARCHAR(255),
    content       TEXT
);

CREATE TABLE User(
    userName VARCHAR(255),
    birth_date Date, #int age --> Date birth_date
    premium BOOLEAN,
    email VARCHAR(255),
    password VARCHAR(255),
    PRIMARY KEY (userName)
);

CREATE TABLE Message(
    message_ID INT auto_increment,
	Timestamp TIMESTAMP, #date --> Timestamp
    user_sender VARCHAR(255),
    user_receiver VARCHAR(255),
    content TEXT,
    PRIMARY KEY (message_ID, user_sender,user_receiver),
    FOREIGN KEY (user_sender) REFERENCES User(userName),
    FOREIGN KEY (user_receiver) REFERENCES User(userName)
);

CREATE TABLE Perfil(
    userName VARCHAR(255),
    image  VARCHAR(255),
    description TEXT,
    llenguatge_pref INT,
    PRIMARY KEY (userName),
    FOREIGN KEY (userName) REFERENCES User(userName)
);

CREATE TABLE import_likes(
    user_sender VARCHAR(255),
    user_receiver VARCHAR(255),
    isLike BOOLEAN,
    Timestamp_date VARCHAR(255),
    Timestamp_time VARCHAR(255),
    PRIMARY KEY (user_sender,user_receiver),
    FOREIGN KEY (user_sender) REFERENCES User(userName),
    FOREIGN KEY (user_receiver) REFERENCES User(userName)
);


CREATE TABLE Likes(
    user_sender VARCHAR(255),
    user_receiver VARCHAR(255),
    isLike BOOLEAN,
    date TIMESTAMP,
    PRIMARY KEY (user_sender,user_receiver),
    FOREIGN KEY (user_sender) REFERENCES User(userName),
    FOREIGN KEY (user_receiver) REFERENCES User(userName)
);
