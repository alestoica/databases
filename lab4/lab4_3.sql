CREATE TABLE directors
	(
	id_director INT PRIMARY KEY IDENTITY,
	name VARCHAR(100),
	nationality VARCHAR(100),
	gender VARCHAR(100)
	);

CREATE TABLE movies
	(
	id_movie INT PRIMARY KEY,
	title VARCHAR(100),
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
	id_movie INT FOREIGN KEY REFERENCES movies(id_movie) ON DELETE CASCADE,
	id_actor INT FOREIGN KEY REFERENCES actors(id_actor) ON DELETE CASCADE,
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
	id_genre INT PRIMARY KEY,
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

DROP TABLE reviews;
DROP TABLE users;
DROP TABLE movies_genres;
DROP TABLE genres;
DROP TABLE movies_awards;
DROP TABLE awards;
DROP TABLE movies_actors;
DROP TABLE actors;
DROP TABLE movies;
DROP TABLE directors;

INSERT INTO directors (name, nationality, gender)
VALUES
	(
		'Damien Chazelle',
		'French-American',
		'male'
	),
	(
		'Taika Waititi',
		'New Zealand',
		'male'
	),
	(
		'Todd Phillips',
		'American',
		'male'
	),
	(
		'Bong Joon-Ho',
		'South Korean',
		'male'
	),
	(
		'Sam Mendes',
		'American',
		'male'
	),
	(
		'Robert Zemeckis',
		'American',
		'male'
	),
	(
		'Darren Aronofsky',
		'American',
		'male'
	),
	(
		'Quentin Tarantino',
		'American',
		'male'
	),
	(
		'David Fincher',
		'American',
		'male'
	),
	(
		'Jordan Peele',
		'American',
		'male'
	),
	(
		'Greta Gerwig',
		'American',
		'female'
	);

INSERT INTO directors (name, nationality, gender)
VALUES
	(
		'Daniel Kwan',
		'American',
		'male'
	)

INSERT INTO movies (id_movie, title, runtime, id_director)
VALUES
	(
		1,
		'Babylon',
		182,
		1
	),
	(
		2,
		'Everything Everywhere All at Once',
		139,
		12
	),
	(
		3,
		'Jojo Rabbit',
		108,
		2
	),
	(
		4,
		'Joker',
		121,
		3
	),
	(
		5,
		'Parasite',
		132,
		4
	),
	(
		6,
		'La La Land',
		127,
		1
	),
	(
		7,
		'Whiplash',
		103,
		1
	),
	(
		8,
		'American Beauty',
		122,
		5
	),
	(
		9,
		'Forrest Gump',
		142,
		6
	),
	(
		10,
		'Black Swan',
		109,
		7
	),
	(
		11,
		'Inglourious Basterds',
		146,
		8
	),
	(
		12,
		'Gone Girl',
		149,
		9
	),
	(
		13,
		'Get Out',
		103,
		10
	),
	(
		14,
		'Fight Club',
		139,
		9
	),
	(
		15,
		'Little Women',
		135,
		11
	),
	(
		16, 
		'Nope',
		130,
		10
	),
	(
		17,
		'Django Unchained',
		165,
		8
	),
	(
		18,
		'Lady Bird',
		94,
		11
	)

SELECT * FROM movies;

INSERT INTO awards(name, category)
VALUES
	(
		'Academy Awards',
		'Best Leading Actor'
	), 
	(
		'Academy Awards',
		'Best Leading Actress'
	), 
	(
		'Academy Awards',
		'Best Supporting Actor'
	), 
	(
		'Academy Awards',
		'Best Supporting Actress'
	), 
	(
		'Academy Awards',
		'Best Costume Design'
	), 
	(
		'Academy Awards',
		'Best Picture'
	), 
	(
		'Academy Awards',
		'Best Screenplay'
	), 
	(
		'Academy Awards',
		'Best Director'
	), 
	(
		'Golden Globes',
		'Best Leading Actor'
	), 
	(
		'Golden Globes',
		'Best Leading Actress'
	), 
	(
		'Golden Globes',
		'Best Supporting Actor'
	), 
	(
		'Golden Globes',
		'Best Supporting Actress'
	), 
	(
		'Golden Globes',
		'Best Costume Design'
	), 
	(
		'Golden Globes',
		'Best Picture'
	), 
	(
		'Golden Globes',
		'Best Screenplay'
	), 
	(
		'Golden Globes',
		'Best Director'
	), 
	(
		'BAFTA Awards',
		'Best Leading Actor'
	), 
	(
		'BAFTA Awards',
		'Best Leading Actress'
	), 
	(
		'BAFTA Awards',
		'Best Supporting Actor'
	), 
	(
		'BAFTA Awards',
		'Best Supporting Actress'
	), 
	(
		'BAFTA Awards',
		'Best Costume Design'
	), 
	(
		'BAFTA Awards',
		'Best Picture'
	), 
	(
		'BAFTA Awards',
		'Best Screenplay'
	), 
	(
		'BAFTA Awards',
		'Best Director'
	),
	(
		'Academy Awards',
		'Best Music'
	), 
	(
		'Golden Globes',
		'Best Music'
	),
	(
		'BAFTA Awards',
		'Best Music'
	);


SELECT * FROM awards;

INSERT INTO movies_awards(id_movie, id_award, year)
VALUES
	(
		1, 5, 2023
	),
	(
		1, 13, 2023
	),
	(
		1, 27, 2023
	),
	(
		2, 6, 2023
	),
	(
		2, 2, 2023
	),
	(
		2, 3, 2023
	),
	(
		2, 4, 2023
	),
	(
		2, 8, 2023
	),
	(
		2, 7, 2023
	),
	(
		2, 10, 2023
	),
	(
		16, 9, 2023
	),
	(
		16, 17, 2023
	),
	(
		3, 7, 2020
	),
	(
		4, 25, 2020
	),
	(
		4, 1, 2020
	),
	(
		4, 9, 2020
	),
	(
		4, 27, 2020
	),
	(
		4, 17, 2020
	),
	(
		5, 6, 2020
	),
	(
		5, 8, 2020
	),
	(
		5, 23, 2020
	),
	(
		15, 5, 2020
	),
	(
		15, 21, 2020
	),
	(
		6, 8, 2017
	),
	(
		6, 2, 2017
	),
	(
		6, 25, 2017
	),
	(
		6, 14, 2017
	),
	(
		6, 16, 2017
	),
	(
		6, 9, 2017
	),
	(
		6, 10, 2017
	),
	(
		6, 15,	2017
	),
	(
		6, 24, 2017
	),
	(
		6, 18, 2017
	),
	(
		6, 27, 2015
	),
	(
		7, 3, 2015
	),
	(
		7, 11, 2015
	),
	(
		7, 19, 2015
	),
	(
		12, 2, 2015
	),
	(
		12, 10, 2015
	),
	(
		12, 16, 2015
	),
	(
		12, 23, 2015
	),
	(
		12, 18, 2015
	),
	(
		8, 6, 2000
	),
	(
		8, 8, 2000
	),
	(
		8, 1, 2000
	),
	(
		8, 7, 2000
	),
	(
		8, 14, 2000
	),
	(
		8, 16, 2000
	),
	(
		8, 15, 2000
	),
	(
		8, 18, 2000
	),
	(
		8, 17, 2000
	),
	(
		14, 3, 2000
	),
	(
		14, 11, 2000
	),
	(
		14, 10, 2000
	),
	(
		14, 19, 2000
	),
	(
		9, 6, 1995
	),
	(
		9, 8, 1995
	),
	(
		9, 1, 1995
	),
	(
		9, 7, 1995
	),
	(
		9, 14, 1995
	),
	(
		9, 16, 1995
	),
	(
		9, 9, 1995
	),
	(
		10, 2, 2012
	),
	(
		10, 10, 2012
	),
	(
		10, 18, 2012
	),
	(
		17, 3, 2013
	),
	(
		17, 7, 2013
	),
	(
		17, 11, 2013
	),
	(
		17, 23, 2013
	),
	(
		11, 3, 2010
	),
	(
		18, 14, 2018
	),
	(
		18, 10, 2018
	),
	(
		13, 7, 2018
	);

SELECT * FROM movies_awards;

INSERT INTO actors(name, nationality, gender)
VALUES
	(
		'Brad Pitt',
		'American',
		'male'
	),
	(
		'Margot Robbie',
		'American',
		'female'
	),
	(
		'Michelle Yeoh',
		'Malaysian',
		'female'
	),
	(
		'Daniel Kaluuya',
		'British',
		'male'
	),
	(
		'Roman Griffin Davis',
		'British',
		'male'
	),
	(
		'Scarlett Johansson',
		'American',
		'female'
	),
	(
		'Joaquin Phoenix',
		'American',
		'male'
	),
	(
		'Lee Sun-kyun',
		'South Korean',
		'male'
	),
	(
		'Saorise Ronan',
		'American',
		'female'
	),
	(
		'Florence Pugh',
		'British',
		'female'
	),
	(
		'Timothee Chalamet',
		'American',
		'male'
	),
	(
		'Ryan Gosling',
		'American',
		'male'
	),
	(
		'Emma Stone',
		'American',
		'female'
	),
	(
		'Miles Teller',
		'American',
		'male'
	),
	(
		'J. K. Simmons',
		'American',
		'male'
	),
	(
		'Ben Affleck',
		'American',
		'male'
	),
	(
		'Rosamund Pike',
		'British',
		'female'
	),
	(
		'Kevin Spacey',
		'American',
		'male'
	),
	(
		'Edward Norton',
		'American',
		'male'
	),
	(
		'Tom Hanks',
		'American',
		'male'
	),
	(
		'Natalie Portman',
		'American',
		'female'
	),
	(
		'Mila Kunis',
		'American',
		'female'
	),
	(
		'Christoph Waltz',
		'Austrian',
		'male'
	),
	(
		'Leonardo DiCaprio',
		'American',
		'male'
	);

SELECT * FROM actors;

INSERT INTO movies_actors(id_movie, id_actor)
VALUES
	(
		1, 1
	),
	(
		1, 2
	),
	(
		11, 1
	),
	(
		14, 1
	),
	(
		2, 3
	),
	(
		16, 4
	),
	(
		13, 4
	),
	(
		3, 5
	),
	(
		3, 6
	),
	(
		4, 7
	),
	(
		5, 8
	),
	(
		15, 11
	),
	(
		18, 11
	),
	(
		6, 12
	),
	(
		6, 13
	),
	(
		7, 14
	),
	(
		6, 15
	),
	(
		7, 15
	),
	(
		12, 16
	),
	(
		12, 17
	),
	(
		8, 18
	),
	(
		14, 19
	),
	(
		9, 20
	),
	(
		10, 21
	),
	(
		10, 22
	),
	(
		11, 23
	),
	(
		17, 23
	),
	(
		17, 24
	);

SELECT * FROM movies_actors;

INSERT INTO genres(id_genre, name)
VALUES
	(
		1, 
		'Comedy'
	),
	(
		2, 
		'Drama'
	),
	(
		3, 
		'Science Fiction'
	),
	(
		4,
		'Thriller'
	),
	(
		5,
		'Mystery'
	),
	(
		6,
		'War'
	),
	(
		7,
		'Romance'
	),
	(
		8,
		'Music'
	);


INSERT INTO movies_genres(id_movie, id_genre)
VALUES
	(
		1, 1
	),
	(
		3, 1
	),
	(
		5, 1
	),
	(
		6, 1
	),
	(
		9, 1
	),
	(
		1, 2
	),
	(
		3, 2
	),
	(
		4, 2
	),
	(
		5, 2
	),
	(
		15, 2
	),
	(
		6, 2
	),
	(
		7, 2
	),
	(
		12, 2
	),
	(
		8, 2
	),
	(
		14, 2
	),
	(
		9, 2
	),
	(
		10, 2
	),
	(
		17, 2
	),
	(
		11, 2
	),
	(
		18, 2
	),
	(
		2, 3
	),
	(
		16, 3
	),
	(
		4, 4
	),
	(
		5, 4
	),
	(
		12, 4
	),
	(
		10, 4
	),
	(
		13, 4
	),
	(
		16, 5
	),
	(
		12, 5
	),
	(
		14, 5
	),
	(
		13, 5
	),
	(
		3, 6
	),
	(
		11, 6
	),
	(
		15, 7
	),
	(
		6, 7
	),
	(
		6, 8
	),
	(
		7, 8
	);

SELECT * FROM movies_genres;

INSERT INTO users(username, email, password)
VALUES
	(
		'JohnDoe123',
		'john_doe@gmail.com',
		'P@ssw0rd1'
	),
	(
		'JaneSmith456',
		'janes@gmail.com',
		'Secr3tCode!'
	),
	(
		'DavidJohnson789',
		'david.john@hotmail.com',
		'MyP@ssw0rd'
	),
	(
		'SarahWilliams101',
		'sarahwilli@yahoo.com',
		'12345AbCd'
	),
	(
		'MichaelBrown202',
		'michael_brown@gmail.com',
		'Qwerty1234'
	),
	(
		'EmilyDavis303',
		'davisemily@hotmail.com',
		'Pa$$w0rd!'
	),
	(
		'RobertClark404',
		'robert.clark@gmail.com',
		'F@keP@ss'
	),
	(
		'OliviaTaylor505',
		'olivia_taylor@yahoo.com',
		'5678P@ssword'
	),
	(
		'WilliamWhite606',
		'white_will@yahoo.com',
		'SecurePass1'
	),
	(
		'AvaJones70',
		'avajones@hotmail.com',
		'P@ssw0rd123'
	);

SELECT * FROM users;

INSERT INTO reviews(id_movie, id_user, rating, date)
VALUES
	(1, 1, 8.9, '2023-02-11'),
    (2, 2, 7.6, '2023-10-02'),
    (3, 3, 7.5, '2023-11-23'),
    (4, 4, 8.8, '2023-01-04'),
    (5, 5, 9, '2023-10-05'),
	(2, 9, 8.9, '2023-04-27'),
    (6, 6, 8.5, '2023-04-06'),
    (7, 7, 7.1, '2023-05-17'),
    (8, 8, 7.3, '2023-12-28'),
    (9, 9, 7.8, '2023-05-19'),
    (10, 10, 9.1, '2023-06-10'),
    (11, 1, 8.4, '2023-11-11'),
    (12, 2, 6.9, '2023-03-12'),
    (13, 3, 8.2, '2023-10-13'),
	(2, 4, 6.8, '2023-10-24'),
    (14, 4, 8.7, '2023-12-14'),
    (15, 5, 8.4, '2023-08-15'),
	(3, 10, 8.0, '2023-09-22'),
    (16, 6, 8.8, '2023-09-16'),
    (17, 7, 8.9, '2023-10-17'),
	(14, 8, 7.7, '2023-11-14'),
    (18, 8, 7.6, '2023-10-18');