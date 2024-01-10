CREATE DATABASE movies;
GO
USE movies;

CREATE TABLE directors
	(
	id_director INT PRIMARY KEY IDENTITY,
	name VARCHAR(100),
	nationality VARCHAR(100),
	gender VARCHAR(100)
	);

CREATE TABLE movies
	(
	id_movie INT PRIMARY KEY IDENTITY,
	title VARCHAR(100),
	release_year DATE,
	runtime INT,
	id_director INT FOREIGN KEY REFERENCES directors(id_director) ON UPDATE CASCADE ON DELETE CASCADE 
	);

CREATE TABLE actors
	(
	id_actor INT PRIMARY KEY IDENTITY,
	name VARCHAR(100),
	nationality VARCHAR(100),
	gender VARCHAR(100)
	);

CREATE TABLE movies_actors
	(
	id_movie INT FOREIGN KEY REFERENCES movies(id_movie),
	id_actor INT FOREIGN KEY REFERENCES actors(id_actor),
	CONSTRAINT pk_movies_actors PRIMARY KEY(id_movie, id_actor)
	);

CREATE TABLE awards
	(
	id_award INT PRIMARY KEY IDENTITY,
	name VARCHAR(100),
	category VARCHAR(100),
	);

CREATE TABLE movies_awards
	(
	id_movie INT FOREIGN KEY REFERENCES movies(id_movie),
	id_award INT FOREIGN KEY REFERENCES awards(id_award),
	year INT,
	CONSTRAINT pk_movies_awards PRIMARY KEY(id_movie, id_award)
	);

CREATE TABLE genres
	(
	id_genre INT PRIMARY KEY IDENTITY,
	name VARCHAR(100),
	);

CREATE TABLE movies_genres
	(
	id_movie INT FOREIGN KEY REFERENCES movies(id_movie),
	id_genre INT FOREIGN KEY REFERENCES genres(id_genre),
	CONSTRAINT pk_movies_genres PRIMARY KEY(id_movie, id_genre)
	);

CREATE TABLE users
	(
	id_user INT PRIMARY KEY IDENTITY,
	username VARCHAR(100) UNIQUE,
	email VARCHAR(100),
	password VARCHAR(100)
	);

CREATE TABLE reviews
	(
	id_movie INT FOREIGN KEY REFERENCES movies(id_movie),
	id_user INT FOREIGN KEY REFERENCES users(id_user),
	rating INT,
	date DATE,
	CONSTRAINT pk_reviews PRIMARY KEY(id_movie, id_user)
	);