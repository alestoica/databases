create database MoviesCRUD
go

use MoviesCRUD
go

select * from movies
select * from movies_genres
select * from genres

select m.title from movies m inner join movies_genres mg on m.id_movie = mg.id_movie
go

----- movies -----
-- tests
create function testTitle (@title varchar(100)) returns int
as
begin
	declare @valid int
	set @valid = 1
	if (len(@title) = 0)
	begin
		set @valid = 0
	end
	return @valid
end
go

create function testIdDirector (@id_director int) returns int
as
begin
	declare @valid int
	declare @limit int
	set @valid = 1
	select @limit = max(id_director) from directors
	if (@id_director > @limit)
	begin
		set @valid = 0
	end
	return @valid
end
go

select dbo.testTitle('Saltburn') as result
select dbo.testTitle('') as result
select dbo.testIdDirector(4) as result
select dbo.testIdDirector(18) as result
go

-- create
create procedure createMovie @title varchar(100), @runtime int, @id_director int
as
begin
	if (dbo.testTitle(@title) = 1 and dbo.testIdDirector(@id_director) = 1)
	begin
		declare @id_movie int
		select @id_movie = max(id_movie) + 1 from movies
		insert into movies (id_movie, title, runtime, id_director) values (@id_movie, @title, @runtime, @id_director)
	end
	else
	begin
		print 'validation error for the title or the id of the director!'
		return
	end
end
go

exec createMovie @title = 'Saltburn', @runtime = 210, @id_director = 1
exec createMovie @title = '', @runtime = 210, @id_director = 1
exec createMovie @title = 'Saltburn', @runtime = 210, @id_director = 50
go

-- read
create procedure readMovies
as
begin
	select * from movies
end
go

exec readMovies
go

-- update
create procedure updateMovie @title varchar(100), @newTitle varchar(100)
as
begin
	if (dbo.testTitle(@newTitle) = 1)
	begin
		update movies set title = @newTitle where title = @title
	end
	else
	begin
		print 'validation error for the new title!'
		return
	end
end
go

exec updateMovie @title = 'Saltburn', @newTitle = 'Saltburn1'
exec updateMovie @title = 'Saltburn1', @newTitle = ''
go

-- delete
create procedure deleteMovie @title varchar(100)
as
begin
	if (dbo.testTitle(@title) = 1)
	begin
		delete from movies_genres where id_movie = (select id_movie from movies where title = @title)
		delete from movies where title = @title
	end
	else
	begin
		print 'validation error for the title!'
		return
	end
end
go

exec deleteMovie @title = 'Saltburn1'
exec deleteMovie @title = ''
go

----- genres -----
-- test
create function testName (@name varchar(100)) returns int
as
begin
	declare @valid int
	set @valid = 1
	if (len(@name) = 0)
	begin
		set @valid = 0
	end
	return @valid
end
go

-- create
create procedure createGenre @name varchar(100)
as
begin
	if (dbo.testName(@name) = 1)
	begin
		declare @id_genre int
		select @id_genre = max(id_genre) + 1 from genres
		insert into genres (id_genre, name) values (@id_genre, @name)
		end
	else
	begin
		print 'validation error for the name!'
		return
	end
end
go

exec createGenre @name = 'Coming of Age'
exec createGenre @name = ''
go

-- read
create procedure readGenres
as
begin
	select * from genres
end
go

exec readGenres
go

-- update
create procedure updateGenre @name varchar(100), @newName varchar(100)
as
begin
	if (dbo.testName(@newName) = 1)
	begin
		update genres set name = @newName where name = @name
	end
	else
	begin
		print 'validation error for the name!'
		return
	end
end
go

exec updateGenre @name = 'Coming of Age', @newName = 'Age'
exec updateGenre @name = 'Coming of Age', @newName = ''
go

-- delete
create procedure deleteGenre @name varchar(100)
as
begin
	if (dbo.testName(@name) = 1)
	begin
		delete from movies_genres where id_genre = (select id_genre from genres where name = @name)
		delete from genres where name = @name
	end
	else
	begin
		print 'validation error for the name!'
		return
	end
end
go

exec deleteGenre @name = 'Age'
exec deleteGenre @name = ''
go

----- movies_genres -----
-- test
create function testIds (@id_movie int, @id_genre int) returns int
as
begin
	declare @valid int
	set @valid = 0
	if (exists(select * from movies where id_movie = @id_movie) and exists(select * from genres where id_genre = @id_genre))
	begin
		set @valid = 1
	end
	return @valid
end
go

select dbo.testIds(10, 7) as result
select dbo.testIds(19, 3) as result
select dbo.testIds(2, 9) as result
go

create function testType (@type varchar(100)) returns int
as
begin
	declare @valid int
	set @valid = 1
	if (@type != 'main' and @type != 'sub')
	begin
		set @valid = 0
	end
	return @valid
end
go

select dbo.testType('main') as result
select dbo.testType('sub') as result
select dbo.testType('kjbsakj') as result
go

-- create
create procedure createMovieGenre @id_movie int, @id_genre int, @type varchar(100)
as
begin
	if (dbo.testIds(@id_movie, @id_genre) = 1 and dbo.testType(@type) = 1)
	begin
		insert into movies_genres (id_movie, id_genre, type) values (@id_movie, @id_genre, @type)
	end
	else
	begin
		print 'validation error for the id of the movie or the id of the genre or the type!'
		return
	end
end
go

exec createMovieGenre 1, 5, 'main'
exec createMovieGenre 1, 100, 'main'
exec createMovieGenre 1, 100, ''
go

-- read 
create procedure readMoviesGenres
as
begin
	select * from movies_genres
end
go

exec readMoviesGenres
go

-- update
create procedure updateMovieGenre @id_movie int, @id_genre int, @type varchar(100)
as
begin
	if (dbo.testIds(@id_movie, @id_genre) = 1 and dbo.testType(@type) = 1)
	begin
		update movies_genres set type = @type where id_movie = @id_movie and id_genre = @id_genre
	end
	else
	begin
		print 'validation error for the id of the movie or the id of the genre or the type!'
		return
	end
end
go

exec updateMovieGenre 1, 2, 'main'
exec updateMovieGenre 1, 2, 'jkwbck'
exec updateMovieGenre 1, 2, ''
go

-- delete
create procedure deleteMovieGenre @id_movie int, @id_genre int
as
begin
	if (dbo.testIds(@id_movie, @id_genre) = 1)
	begin
		delete from movies_genres where id_movie = @id_movie and id_genre = @id_genre
	end
	else
	begin
		print 'validation error for the id of the movie or the id of the genre!'
		return
	end
end
go

exec deleteMovieGenre 1, 5
exec deleteMovieGenre 1, 100
go

----- views & indexes ----- 
create view View1
as
select
    title,
    runtime
from
    movies m
where 
	runtime > 130;
go 

create nonclustered index IX_Movies_Runtime
on movies (runtime desc, title asc);
go

create view View2
as
select
    id_genre,
    name
from
    genres
where name like 'A%';
go 

create nonclustered index IX_Genres_Name
on genres (name asc);
go

create view View3
as
select
    id_movie,
    count(type) as nr_subgenres
from
    movies_genres
where 
	type = 'sub'
group by 
	id_movie;
go 

create nonclustered index IX_MoviesGenres_Type
on movies_genres (type);
go

select * from View1
select * from View2
select * from View3

drop index IX_Movies_Runtime on movies
drop index IX_Genres_Name on genres
drop index IX_MoviesGenres_Type on movies_genres

drop view View1
drop view View2
drop view View3
