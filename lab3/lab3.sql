USE movies;

GO

CREATE TABLE versions
(
	versionNo INT
);

INSERT INTO versions (versionNo) 
VALUES
(0);

GO

-- modify column type
CREATE PROCEDURE Procedure1
	AS
	BEGIN
	ALTER TABLE reviews
	ALTER COLUMN rating FLOAT;

	PRINT 'The rating column from the reviews table has been modified.';

	END;

GO

-- EXEC Procedure1;

GO

-- undo modify column type
CREATE PROCEDURE ReversedProcedure1
	AS
	BEGIN
	ALTER TABLE reviews
	ALTER COLUMN rating INT;

	PRINT 'The rating column from the reviews table has been reverted to its initial state.';

	END;

GO

-- EXEC ReversedProcedure1;

GO

-- add default constraint
CREATE PROCEDURE Procedure2
	AS
	BEGIN
	ALTER TABLE reviews
	ADD CONSTRAINT df_default_rating DEFAULT 0 FOR rating;

	PRINT 'A default constraint has been added to the rating column from the reviews table.';

	END;

GO

-- EXEC Procedure2;

GO

-- delete default constraint
CREATE PROCEDURE ReversedProcedure2
	AS
	BEGIN
	ALTER TABLE reviews
	DROP CONSTRAINT df_default_rating;

	PRINT 'The default constraint has been removed from the rating column from the reviews table.';

	END;

GO

-- EXEC ReversedProcedure2;

GO

-- create table
CREATE PROCEDURE Procedure3
	AS
	BEGIN
	CREATE TABLE trailers 
	(
		id_trailer INT PRIMARY KEY IDENTITY,
		type VARCHAR(100)
	);

	PRINT 'The table trailers has been created.';

	END;

GO

-- EXEC Procedure3;

GO

-- delete table
CREATE PROCEDURE ReversedProcedure3
	AS
	BEGIN
	DROP TABLE trailers;

	PRINT 'The table trailers has been deleted.';

	END;

GO

-- EXEC ReversedProcedure3;

GO

-- add column
CREATE PROCEDURE Procedure4
	AS
	BEGIN
	ALTER TABLE trailers
	ADD id_movie INT;

	PRINT 'The id_movie column has been added to the trailers table.';

	END;

GO

-- EXEC Procedure4;

GO

-- delete column
CREATE PROCEDURE ReversedProcedure4
	AS
	BEGIN
	ALTER TABLE trailers
	DROP COLUMN id_movie;

	PRINT 'The id_movie column has been removed from the trailers table.';

	END;

GO

-- EXEC ReversedProcedure4;

GO

-- add foreign key constraint
CREATE PROCEDURE Procedure5
	AS
	BEGIN
	ALTER TABLE trailers
	ADD CONSTRAINT fk_id_movie FOREIGN KEY (id_movie)
	REFERENCES movies(id_movie) 
	ON UPDATE CASCADE 
	ON DELETE CASCADE

	PRINT 'The foreign key constraint has been added to the id_movie column from the trailers table.';

	END;

GO

-- EXEC Procedure5;

GO

-- delete foreign key constraint
CREATE PROCEDURE ReversedProcedure5
	AS
	BEGIN
	ALTER TABLE trailers
	DROP CONSTRAINT fk_id_movie;

	PRINT 'The foreign key constraint has been removed from the id_movie column from the trailers table.';

	END;

GO

-- EXEC ReversedProcedure5;

GO

CREATE PROCEDURE ChangeVersion @wantedVersion INT 
	AS
	BEGIN
		
		DECLARE @currentVersion INT;
		SELECT @currentVersion = versionNo FROM versions;

		IF (@wantedVersion is null)
		BEGIN
			RAISERROR('The wanted version cannot be null!', 16, 1);
			RETURN 1;
		END

		IF (@wantedVersion < 0 OR @wantedVersion > 5)
		BEGIN
			RAISERROR('The wanted version is invalid!', 16, 1);
			RETURN 1;
		END

		IF (@wantedVersion = @currentVersion)
		BEGIN
			RAISERROR('The table already is in the wanted version!', 16, 1);
			RETURN 2;
		END

		DECLARE @procedureNo INT;
		DECLARE @procedureName VARCHAR(20);

		IF (@currentVersion < @wantedVersion)
		BEGIN

			SET @procedureNo = @currentVersion + 1;

			WHILE (@currentVersion < @wantedVersion)
			BEGIN

				SET @procedureName = 'Procedure' + CONVERT(VARCHAR, @procedureNo);
				EXEC @procedureName;
				SET @procedureNo = @procedureNo + 1;
				SET @currentVersion = @currentVersion + 1;

			END;

			UPDATE versions SET versionNo = @wantedVersion;

		END
		ELSE
		BEGIN

			SET @procedureNo = @currentVersion;

			WHILE (@currentVersion > @wantedVersion)
			BEGIN
				
				SET @procedureName = 'ReversedProcedure' + CONVERT(VARCHAR, @procedureNo);
				-- PRINT @procedureName;
				EXEC @procedureName;
				SET @procedureNo = @procedureNo - 1;
				SET @currentVersion = @currentVersion - 1;

			END;

			UPDATE versions SET versionNo = @wantedVersion;

		END;
		
	END;

GO

UPDATE versions SET versionNo = 0;

SELECT * FROM versions;

BEGIN TRY

	EXEC ChangeVersion 6;

END TRY
BEGIN CATCH

	SELECT 
		ERROR_MESSAGE() AS ErrorMessage;

END CATCH

SELECT * FROM versions;
		