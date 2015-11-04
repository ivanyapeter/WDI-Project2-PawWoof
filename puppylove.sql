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

CREATE TABLE breed_types
(
  id SERIAL4 PRIMARY KEY,
  dog_id INTEGER,
  breed_id INTEGER
);