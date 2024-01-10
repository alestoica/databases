USE movies;

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

SELECT * FROM directors;

INSERT INTO movies (title, release_year, runtime, id_director)
VALUES
	(
		'Babylon',
		'2022-12-23',
		182,
		1
	),
	(
		'Everything Everywhere All at Once',
		'2022-03-11',
		139,
		12
	),
	(
		'Jojo Rabbit',
		'2019-10-18',
		108,
		2
	),
	(
		'Joker',
		'2019-10-04',
		121,
		3
	),
	(
		'Parasite',
		'2019-05-30',
		132,
		4
	),
	(
		'La La Land',
		'2016-12-09',
		127,
		1
	),
	(
		'Whiplash',
		'2014-01-16',
		103,
		1
	),
	(
		'American Beauty',
		'1999-09-17',
		122,
		5
	),
	(
		'Forrest Gump',
		'1994-07-06',
		142,
		6
	),
	(
		'Black Swan',
		'2011-02-25',
		109,
		7
	),
	(
		'Inglourious Basterds',
		'2009-09-04',
		146,
		8
	),
	(
		'Gone Girl',
		'2014-10-03',
		149,
		9
	),
	(
		'Get Out',
		'2017-02-24',
		103,
		10
	),
	(
		'Fight Club',
		'1999-10-15',
		139,
		9
	),
	(
		'Little Women',
		'2019-12-25',
		135,
		11
	),
	(
		'Nope',
		'2022-07-22',
		130,
		10
	),
	(
		'Django Unchained',
		'2012-12-25',
		165,
		8
	),
	(
		'Lady Bird',
		'2017-11-10',
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

INSERT INTO genres(name)
VALUES
	(
		'Comedy'
	),
	(
		'Drama'
	),
	(
		'Science Fiction'
	),
	(
		'Thriller'
	),
	(
		'Mystery'
	),
	(
		'War'
	),
	(
		'Romance'
	),
	(
		'Music'
	);

SELECT * FROM genres;

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

SELECT * FROM reviews;

/*
shows all movies and the number of genres that they have
*/
SELECT M.title, COUNT(G.name) nr_genres 
FROM genres G, movies M, movies_genres MG 
WHERE G.id_genre = MG.id_genre 
AND M.id_movie = MG.id_movie 
GROUP BY M.title;


/*
shows all the actors that have worked on more than one movie
*/
SELECT A.name, COUNT(M.title) nr_movies 
FROM actors A, movies M, movies_actors MA 
WHERE MA.id_actor = A.id_actor 
AND MA.id_movie = M.id_movie 
GROUP BY A.name 
HAVING COUNT(M.title) >= 2;

/*
shows all the actors that have worked on movies with the average rating hirgher or equal to 8
*/
SELECT A.name, AVG(R.rating) rating_average
FROM actors A, movies M, movies_actors MA, reviews R
WHERE MA.id_actor = A.id_actor 
AND MA.id_movie = M.id_movie 
AND R.id_movie = M.id_movie 
GROUP BY A.name 
HAVING AVG(R.rating) >= 8;

/*
shows all movies that have won a BAFTA Award
*/
SELECT DISTINCT M.title, A.name 
FROM movies M, awards A, movies_awards MA 
WHERE M.id_movie = MA.id_movie 
AND A.id_award = MA.id_award 
AND A.name = 'BAFTA Awards';

/*
shows all movies that have won a Best Picture category
*/
SELECT DISTINCT M.title, A.category
FROM movies M, awards A, movies_awards MA 
WHERE M.id_movie = MA.id_movie 
AND A.id_award = MA.id_award 
AND A.category = 'Best Picture';

/*
shows all movies that have won an Academy Award for Best Picture
*/
SELECT M.title, A.name, A.category 
FROM movies M, awards A, movies_awards MA 
WHERE M.id_movie = MA.id_movie 
AND A.id_award = MA.id_award 
AND A.name = 'Academy Awards' 
AND A.category = 'Best Picture' ;

/*
shows all movies and how many Golden Globes they've won
*/
SELECT M.title, COUNT(A.category) nr_academy_awards 
FROM movies M, awards A, movies_awards MA 
WHERE M.id_movie = MA.id_movie 
AND A.id_award = MA.id_award
AND A.name = 'Golden Globes'
GROUP BY M.title, A.name;

/*
shows all the movies that have won more than 3 Academy Awards
*/
SELECT M.title, COUNT(A.category) nr_academy_awards 
FROM movies M, awards A, movies_awards MA 
WHERE M.id_movie = MA.id_movie 
AND A.id_award = MA.id_award 
AND A.name = 'Academy Awards' 
GROUP BY M.title 
HAVING COUNT(A.category) >= 3;

/*
shows all the categories of awards that the movies have won, 
whether they were won at different awards
*/
SELECT DISTINCT M.title, A.category 
FROM movies M, awards A, movies_awards MA 
WHERE M.id_movie = MA.id_movie 
AND A.id_award = MA.id_award ;

/*
shows all distinct genres of movies that an actor has done
*/
SELECT DISTINCT A.name, G.name
FROM actors A, movies M, movies_actors MA, genres G, movies_genres MG 
WHERE A.id_actor = MA.id_actor 
AND M.id_movie = MA.id_movie 
AND M.id_movie = MG.id_movie 
AND G.id_genre = MG.id_genre;

/*
shows all genres and the number of movies that are part of that genre
*/
SELECT G.name, COUNT(M.title) nr_movies 
FROM genres G, movies M, movies_genres MG 
WHERE G.id_genre = MG.id_genre 
AND M.id_movie = MG.id_movie
GROUP BY G.name;