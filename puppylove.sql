CREATE DATABASE puppylove;

CREATE TABLE users 
(
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(200),
  password_digest VARCHAR(200),
  firstname VARCHAR(200),
  lastname VARCHAR(200),
  address VARCHAR(500),
  phone_number VARCHAR(100),
  avatar VARCHAR(500)
);

CREATE TABLE dogs
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(200),
  age VARCHAR(50),
  weight VARCHAR(50),
  vetapr VARCHAR(50),
  dog_img VARCHAR(500),
  user_id INTEGER
);

CREATE TABLE breeds
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(200)
);

CREATE TABLE messages
(
  id SERIAL4 PRIMARY KEY,
  sender_id INTEGER,
  recipient_id INTEGER,
  dog_id INTEGER,
  content VARCHAR(5000)
);

CREATE TABLE breed_types
(
  id SERIAL4 PRIMARY KEY,
  dog_id INTEGER,
  breed_id INTEGER
);

INSERT INTO breeds (name) VALUES ('Affenpinscher');
INSERT INTO breeds (name) VALUES ('Afgan Hound');
INSERT INTO breeds (name) VALUES ('Airedale Terrier');
INSERT INTO breeds (name) VALUES ('Akita');
INSERT INTO breeds (name) VALUES ('Alaskan Malamute');
INSERT INTO breeds (name) VALUES ('American English Coonhound');
INSERT INTO breeds (name) VALUES ('American Eskimo Dog');
INSERT INTO breeds (name) VALUES ('American Foxhound');
INSERT INTO breeds (name) VALUES ('American Pit Bull Terrier');
INSERT INTO breeds (name) VALUES ('American Water Spaniel');
INSERT INTO breeds (name) VALUES ('Anatolian Shepherd Dog');
INSERT INTO breeds (name) VALUES ('Appenzeller Sennenhunde');
INSERT INTO breeds (name) VALUES ('Australian Cattle Dog');
INSERT INTO breeds (name) VALUES ('Australian Shepherd');
INSERT INTO breeds (name) VALUES ('Australian Terrier');
INSERT INTO breeds (name) VALUES ('Azawakh');

INSERT INTO breeds (name) VALUES ('Barbet');
INSERT INTO breeds (name) VALUES ('Basenji');
INSERT INTO breeds (name) VALUES ('Beagle');
INSERT INTO breeds (name) VALUES ('Bearded Collie');
INSERT INTO breeds (name) VALUES ('Bedlington Terrier');
INSERT INTO breeds (name) VALUES ('Belgian Malinois');
INSERT INTO breeds (name) VALUES ('Belgian Sheepdog');
INSERT INTO breeds (name) VALUES ('Belgian Tervuren');
INSERT INTO breeds (name) VALUES ('Berger Picard');
INSERT INTO breeds (name) VALUES ('Bernese Mountain Dog');
INSERT INTO breeds (name) VALUES ('Bichon Frise');
INSERT INTO breeds (name) VALUES ('Black and Tan Coonhound');
INSERT INTO breeds (name) VALUES ('Black Russian Terrier');
INSERT INTO breeds (name) VALUES ('Bloodhound');
INSERT INTO breeds (name) VALUES ('Bluetick Coonhound');
INSERT INTO breeds (name) VALUES ('Bolognese');
INSERT INTO breeds (name) VALUES ('Border Collie');
INSERT INTO breeds (name) VALUES ('Border Terrier');
INSERT INTO breeds (name) VALUES ('Borzoi');
INSERT INTO breeds (name) VALUES ('Boston Terrier');
INSERT INTO breeds (name) VALUES ('Bouvier des Flandres');
INSERT INTO breeds (name) VALUES ('Boxer');
INSERT INTO breeds (name) VALUES ('Boykin Spaniel');
INSERT INTO breeds (name) VALUES ('Bracco Italiano');
INSERT INTO breeds (name) VALUES ('Briard');
INSERT INTO breeds (name) VALUES ('Brittany');
INSERT INTO breeds (name) VALUES ('Brussels Griffon');
INSERT INTO breeds (name) VALUES ('Bull Terrier');
INSERT INTO breeds (name) VALUES ('Bulldog');
INSERT INTO breeds (name) VALUES ('Bullmastiff');

