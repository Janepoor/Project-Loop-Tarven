DROP TABLE User CASCADE;
DROP TABLE Basketball_Team_Runned CASCADE;
DROP TABLE Searches CASCADE;
DROP TABLE Comment_Written_About CASCADE;
DROP TABLE Game CASCADE;
DROP TABLE Plays CASCADE;
DROP TABLE Championship_Achieved CASCADE;
DROP TABLE Player CASCADE;
DROP TABLE Position_Composes_Participates CASCADE;
DROP TABLE Manager_Has CASCADE;
DROP TABLE Company CASCADE;

CREATE TABLE User(
    UserID int,
    Username varchar(50),
    Password varchar(100),
    Gender char(2),
    EmailAddress varchar(100),
    Age int,
    PRIMARY KEY (UserID),
    CHECK(
    Age>0 and (Gender='F' or Gender='M')
    )
);

CREATE TABLE Basketball_Team_Runned(
    TeamID int,
    Coach varchar(255),
    Mascot varchar(100),
    LanguageRegion varchar(100),
    Location_City varchar(100),
    Name varchar(255),
    Found_Date date,
    Web varchar(255),
    ManagerID int NOT NULL,
    Payment int,
    PRIMARY KEY (TeamID),
    FOREIGN KEY (ManagerID) REFERENCES Manager_Has ON DELETE NO ACTION,
    CHECK(
    Found_Date>'1891-12-21' and Payment>0
    )
);

CREATE TABLE Searches(
    UserID int,
    TeamID int,
    Searchtime timestamp,
    PRIMARY KEY (UserID, TeamID),
    FOREIGN KEY (UserID) REFERENCES User,
    FOREIGN KEY (TeamID) REFERENCES Basketball_Team_Runned
);

CREATE TABLE Game(
    GameID int,
    Place varchar(255),
    GameTime timestamp,
    PRIMARY KEY(GameID)
);

CREATE TABLE Comment_Written_About(        
    UserID int NOT NULL,
    GameID int NOT NULL,
    CommentID int,
    CommentTime timestamp,
    Content varchar(255),
    Rate int,
    PRIMARY KEY (CommentID),
    FOREIGN KEY (UserID) REFERENCES User ON DELETE NO ACTION,
    FOREIGN KEY (GameID) REFERENCES Game ON DELETE NO ACTION,
    CHECK(
    Rate=1 or Rate=2 or Rate=3 or Rate=4 or Rate=5 or Rate=6 or Rate=7 or Rate=8 or Rate=9 or Rate=10
    )   
);

CREATE TABLE Plays(
    GameID int, 
    TeamID int, 
    Score int,
    PRIMARY KEY (TeamID, GameID),
    FOREIGN KEY (TeamID) REFERENCES Basketball_Team_Runned,
    FOREIGN KEY (GameID) REFERENCES Game,
    CHECK(
    Score>=0
    )
);

CREATE TABLE Championship_Achieved(
    Title varchar(255),
    Presenter varchar(100),
    TeamID int NOT NULL,
    PRIMARY KEY (Title),
    FOREIGN KEY (TeamID) REFERENCES Basketball_Team_Runned ON DELETE NO ACTION
);

CREATE TABLE Player (
    PlayerID int,
    BirthDate date,
    PlayerName varchar(100),
    Nationality varchar(100),
    Height real,
    Weight real,
    ShootAccuracy int,
    PRIMARY KEY (PlayerID),
    CHECK(
    ShootAccuracy < 100 and ShootAccuracy >0 and Height>0 and Weight>0 and BirthDate >='1960-01-01'and (current_date-BirthDate>=18*365)
    )
);

CREATE TABLE Position_Composes_Participates( 
    TeamID int,
    PositionName varchar(50),
    Job varchar(255),
    PlayerID int NOT NULL, 
    PRIMARY KEY (TeamID, PositionName),
    FOREIGN KEY (TeamID) REFERENCES Basketball_Team_Runned ON DELETE CASCADE,
    FOREIGN KEY (PlayerID) REFERENCES Player ON DELETE NO ACTION
);

CREATE TABLE Company (
    CompanyID int, 
    CompanyName varchar(100),
    Address varchar(255),
    Website varchar(255),
    PRIMARY KEY (CompanyID)
);

CREATE TABLE Manager_Has(
    ManagerID int,
    Name varchar(100), 
    Age int,
    DateOfBirth date,
    CompanyID int NOT NULL,
    PRIMARY KEY (ManagerID),
    FOREIGN KEY (CompanyID) REFERENCES Company ON DELETE NO ACTION,
    CHECK(
    Age>0 and (current_date-DateOfBirth>=18*365)
    )
);
