create database MoviesTests
go

use MoviesTests
go

create view View1 as
	select name, nationality, gender from Actors;
go

create view View2 as
	select M.title, M.release_year, D.name
	from Movies M
	inner join Directors D 
	on M.id_director = D.id_director;
go

create view View3 as
	select A.id_actor, A.name, COUNT(M.id_movie) as no_movies
	from Movies M
	inner join MoviesActors MA
	on MA.id_movie = M.id_movie
    inner join Actors A
	on MA.id_actor = A.id_actor
	group by A.id_actor, A.name;
go

insert into Tables (Name) values
	('Actors'),
	('Movies'),
	('MoviesActors')
go

insert into Views (Name) values
	('View1'),
	('View2'),
	('View3')
go

create or alter procedure insertActors
	@NoOfRows int
as

declare @i int
declare @nr varchar(30)

set @i = 1 

while @i <= @NoOfRows 
begin
	set @nr = 'Actor' + CONVERT(varchar(5), @i)
	insert into Actors (id_actor, name, nationality, gender) values (@i, @nr, 'unknown', 'female')
	set @i = @i + 1
end
go

create or alter procedure insertMovies
	@NoOfRows int
as

declare @i int
declare @nr varchar(30)
declare @fk int

select top 1 @fk = min(id_director) from Directors

set @i = 1 

while @i <= @NoOfRows 
begin
	set @nr = 'Movie' + CONVERT(varchar(5), @i)
	insert into Movies(id_movie, title, release_year, runtime, id_director) values (@i, @nr, '2020-02-02', 111, @fk)
	set @i = @i + 1
end
go

create or alter procedure insertMoviesActors
	@NoOfRows int
as

declare @i int
declare @fk1 int
declare @fk2 int

select top 1 @fk1 = id_movie from Movies order by id_movie
select top 1 @fk2 = id_actor from Actors order by id_actor

set @i = 1 

while @i <= @NoOfRows 
begin
	insert into MoviesActors (id_movie, id_actor) values (@fk1, @fk2)
	set @fk1 = @fk1 + 1
	set @fk2 = @fk2 + 1
	set @i = @i + 1
end
go

create or alter procedure deleteMoviesActors
	@NoOfRows int
as

delete from MoviesActors 
go

create or alter procedure deleteActors
	@NoOfRows int
as

delete from Actors
go

create or alter procedure deleteMovies
	@NoOfRows int
as

delete from movies 
go

create or alter procedure selectView3
as

begin

	select * from View3

end
go

create or alter procedure selectView2
as

begin

	select * from View2

end
go

create or alter procedure selectView1
as
begin

	select * from View1

end
go

/*
insert into Tests (Name) values
	('deleteActors'),
	('insertActors'),
	('selectActors'),
	('deleteMovies'),
	('insertMovies'),
	('selectMovies'),
	('deleteMoviesActors'),
	('insertMoviesActors'),
	('selectMoviesActors')
go
*/

insert into Tests (Name) values
	('runTests')

insert into TestViews(TestID, ViewID) values
(1, 1),
(1, 2),
(1, 3)
go

/*
insert into TestTables (TestID, TableID, NoOfRows, Position)
values
(7, 3, 100, 1),
(4, 2, 100, 2),
(1, 1, 100, 3),
(2, 1, 100, 4),
(5, 2, 100, 5),
(8, 3, 100, 6)
go
*/

insert into TestTables (TestID, TableID, NoOfRows, Position)
values
(1, 1, 100, 3),
(1, 2, 100, 2),
(1, 3, 100, 1)
go

set nocount on
go

create or alter procedure runDelete
as

begin

	declare @posMax int
	select @posMax = min(Position) from TestTables
	declare @i int = 1

	declare @testId int
	declare @tableId int
	declare @procName varchar(64)
	declare @noOfRows int

	while @i <= @posMax
	begin

		select @testId = TestID from TestTables where Position = @i 
		select @tableId  = TableID from TestTables where Position = @i
		select @noOfRows = NoOfRows from TestTables where Position = @i

		select @procName = 'delete' + (select t.Name from TestTables tt join Tables t on tt.tableId = t.tableId where tt.Position = @i)

		exec @procName @noOfRows	

		set @i = @i + 1

	end

end
go

create or alter procedure runInsert
as

begin

	declare @posMax int
	select @posMax = max(Position) from TestTables
	declare @i int = @posMax

	declare @testId int
	declare @tableId int
	declare @procName varchar(64)
	declare @noOfRows int

	while @i >= 1
	begin

		declare @startTableTest datetime = getdate()

		select @testId = TestID from TestTables where Position = @i 
		select @tableId  = TableID from TestTables where Position = @i
		select @noOfRows = NoOfRows from TestTables where Position = @i

		select @procName = 'insert' + (select t.Name from TestTables tt join Tables t on tt.tableId = t.tableId where tt.Position = @i)

		exec @procName @noOfRows	

		declare @endTableTest datetime = getdate()

		insert into TestRunTables values(1, @i, @startTableTest, @endTableTest)

		set @i = @i - 1

	end

end
go

create or alter procedure runViews
as

begin

	declare @i int = 1

	declare @testId int
	declare @tableId int
	declare @procName varchar(64)
	declare @noOfRows int

	while @i <= 3
	begin

		print @i

		declare @startViewTest datetime = getdate()

			select @procName = 'select' + (select Name from Views where ViewID = @i)

			exec @procName

		declare @endViewTest datetime = getdate()

		insert into TestRunViews values(1, @i, @startViewTest, @endViewTest)

		set @i = @i + 1

	end

end
go

exec runDelete
exec runInsert
exec runViews
go

create or alter procedure runTests
as

begin

	declare @startAll datetime = getdate()

	insert into TestRuns(TestRuns.Description, StartAt, EndAt) values ('Test', @startAll, @startAll)

	exec runDelete
	exec runInsert
	exec runViews

	declare @endAll datetime = getdate()

	update TestRuns set EndAt = @endAll where StartAt = @startAll

end
go

exec runTests
go

drop procedure runTests

select * from Actors
select * from Movies
select * from MoviesActors

select * from TestRunTables
select * from TestRunViews
select * from TestRuns

select * from Tables
select * from Views
select * from Tests
select * from TestViews
select * from TestTables

delete from TestRunViews
delete from TestRuns
delete from TestRunTables

exec insertActors 100
select * from Actors

exec insertMovies 100
select * from Movies

exec insertMoviesActors 100
select * from MoviesActors

exec deleteMoviesActors 100
select * from MoviesActors

exec deleteMovies 100
select * from Movies

exec deleteActors 100
select * from Actors