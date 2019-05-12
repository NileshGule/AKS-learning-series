IF  NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'TechTalksDB')
    BEGIN
        PRINT 'Creating database TechTalksDB...'
        CREATE DATABASE [TechTalksDB]
    END;
GO

-- IF  EXISTS (SELECT * FROM sys.databases WHERE name = N'TechTalksDB')
--     BEGIN
--         PRINT 'Dropping existing database...'
--         DROP DATABASE [TechTalksDB]
--     END;
-- GO

-- PRINT 'Creating database TechTalksDB...'
-- CREATE DATABASE [TechTalksDB]

SELECT Name from sys.Databases
GO

-- Add Database to Availability Group only if the SQL Server Version is 2019                                                                                                                                                
USE MASTER
GO
 
DECLARE @IsSQL2019 bit

SET @IsSQL2019 = CHARINDEX('SQL Server 2019',@@VERSION)

IF @IsSQL2019 = 1

BEGIN

    BACKUP DATABASE [TechTalksDB] 
    TO DISK = N'/var/opt/mssql/data/TechTalksDB.bak'

    ALTER AVAILABILITY GROUP [ag1] ADD DATABASE [TechTalksDB]

    SELECT  r.replica_server_name
        , DB_NAME(rs.database_id) AS [DatabaseName]
        , rs.is_local
        , rs.is_primary_replica
        , r.availability_mode_desc
        , r.failover_mode_desc
        , rs.is_commit_participant
        , rs.synchronization_state_desc
        , rs.synchronization_health_desc
        , r.endpoint_url
        , r.session_timeout
    FROM    sys.dm_hadr_database_replica_states rs
            JOIN sys.availability_replicas r ON r.group_id = rs.group_id
                                                AND r.replica_id = rs.replica_id
    ORDER BY r.replica_server_name;
    
END

GO

USE TechTalksDB
GO


if not exists (select * from sysobjects where name='Categories' and xtype='U')
    BEGIN
        PRINT 'Creating Categories table'
        CREATE TABLE Categories 
        (
            Id INT IDENTITY(1,1) PRIMARY KEY,
            categoryName NVARCHAR(50), 
            description NVARCHAR(100)
        )

        PRINT 'Inserting default values in categories table...'
        INSERT INTO Categories(categoryName, description) VALUES('Meetup', 'Community event organized via meetup');
        INSERT INTO Categories(categoryName, description) VALUES('Free Conference', 'Free Tech Conference');
        INSERT INTO Categories(categoryName, description) VALUES('Paid Conference', 'Paid Tech Conference');
        INSERT INTO Categories(categoryName, description) VALUES('Hackathon', 'Hackathon');
        INSERT INTO Categories(categoryName, description) VALUES('Eventribe', 'Community event organized via Eventribe');
    END
GO

if not exists (select * from sysobjects where name='Levels' and xtype='U')
    BEGIN
        PRINT 'Creating Level table'
        CREATE TABLE Levels 
        (
            Id INT IDENTITY(1,1) PRIMARY KEY,
            levelName NVARCHAR(50)
        )

        PRINT 'Inserting default values in categories table...'
        INSERT INTO Levels(levelName) VALUES('100 - Beginer');
        INSERT INTO Levels(levelName) VALUES('200 - Intermediate');
        INSERT INTO Levels(levelName) VALUES('300 - Advanced');
        INSERT INTO Levels(levelName) VALUES('400 - Expert');
    END
GO

if not exists (select * from sysobjects where name='TechTalk' and xtype='U')
    BEGIN
        PRINT 'Creating TechTalk table'
        CREATE TABLE TechTalk 
        (
            Id INT IDENTITY(1,1) PRIMARY KEY,             
            techtalkname NVARCHAR(50), 
            categoryId INT REFERENCES Categories(Id),
            levelId INT REFERENCES Levels(Id)
        )

        PRINT 'Inserting default values into TechTalk table'
        INSERT INTO TechTalk(techtalkname, categoryId, levelId) VALUES ('Scaling Docker Containers', 1, 1); 
        INSERT INTO TechTalk(techtalkname, categoryId, levelId) VALUES ('Azure Container Services', 2, 2);
        INSERT INTO TechTalk(techtalkname, categoryId, levelId) VALUES ('Kubernetes', 3, 3);
    END
GO

if not exists (select * from sysobjects where name='KeyValue' and xtype='U')
    BEGIN
        CREATE TABLE KeyValue ([Key] NVARCHAR(10), [Value] NVARCHAR(100))

        INSERT INTO KeyValue VALUES('GoT', 'American fantasy drama television series');
       
    END
GO