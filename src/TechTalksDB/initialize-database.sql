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