-- MySql Script 

-- April 17 2023

-- The Traders Resource

-- DGL The D Man LatinLum

-- The infamous LatinLum Inc. LLC

-- DGLL LLC. 

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS=0;

DROP SCHEMA  IF EXISTS TradersResources;

CREATE SCHEMA IF NOT EXISTS TradersResources;

USE TradersResources;

-- Table Maintenance
-- This section pertains to building tables for core funtionality related to Daily activites
-- Tasks Table schedule of tasks to be performed and what intervals

-- Users Section 
-- User Table 

DROP TABLE IF EXISTS Users;
CREATE TABLE Users
(
	Id int NOT NULL AUTO_INCREMENT,
	FirstName VARCHAR(50) NOT NULL,	
	LastName VARCHAR(50) NOT NULL,	
	UserId VARCHAR(50) NOT NULL,	
	UserEmail VARCHAR(50) NOT NULL,
	Password VARCHAR(50) NOT NULL,	
	Notes VARCHAR(250),	
	IsActive INT DEFAULT 0,
	IsAdmin INT DEFAULT 0,
	PRIMARY KEY(Id)
);

INSERT INTO Users (FirstName, LastName, UserId, UserEmail, Password, Notes, IsActive, IsAdmin)
VALUES
('David', 'Lowry', 'dlowry007', 'DavidLowry64@gmail.com', 'DAVIDttrc2023!','Initial User', 1, 1),
('Demo', 'Lover', 'demo', 'Demo@gmail.com', 'DEMOttrc2023!','Demo User', 1, 1)

;
-- Accounts Section

-- Accounts Table

DROP TABLE IF EXISTS Account;
CREATE TABLE Account
(
	AccountId INT NOT NULL AUTO_INCREMENT,
	UserID VARCHAR(50) NOT NULL,	
	AccountName VARCHAR(50) NOT NULL,	
	AccountType VARCHAR(50) NOT NULL,	
	SecurityTypeId VARCHAR(50) NOT NULL,
	BrokerName VARCHAR(50) NOT NULL,	
	AccountBalance FLOAT(12, 2) DEFAULT 0.00,		
	Description VARCHAR(250),
	IsActive INT NULL DEFAULT 0,	
	PRIMARY KEY(AccountId)
);


-- AccountsType Table

DROP TABLE IF EXISTS AccountType;
CREATE TABLE AccountType
(
	Id INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,	
	Description VARCHAR(250) NULL,		
	Notes VARCHAR(250),	
	PRIMARY KEY(Id)
);


-- Trades Section
-- Trade Type Table

-- Trade Zones Table

DROP TABLE IF EXISTS TradeZones;
CREATE TABLE TradeZones
(
	Id INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,		
	StartDate VARCHAR(25) NOT NULL,
	EndDate VARCHAR(25) NOT NULL,	
	TrendChartId VARCHAR(10) NOT NULL, 	
	TradeChartId VARCHAR(10) NOT NULL, 
	EntryChartId VARCHAR(10) NOT NULL, 
	CommodityId VARCHAR(10) NOT NULL,	
	Description VARCHAR(250) NULL,	
	PRIMARY KEY(Id)
);




-- Trades Table 
-- Trades being recorded 
-- Capture Userid 
-- Need table structure example

DROP TABLE IF EXISTS Trades;
CREATE TABLE Trades
(
	TradeId INT NOT NULL AUTO_INCREMENT,
	StockId VARCHAR(10) NOT NULL,	    
	CreateTime  DATETIME DEFAULT   CURRENT_TIMESTAMP,
    ModifiedTime  DATETIME ON UPDATE CURRENT_TIMESTAMP,	
    TradeTypeId VARCHAR(10) NOT NULL,	    
    TradeActionId VARCHAR(10) NOT NULL,	    
    CommodityId VARCHAR(10) NOT NULL,	    
    TradeActionTime DATETIME NOT NULL,
    NumberBought INT NOT NULL,    
    OptionTypeId VARCHAR(10) NULL,
    ExpirationDate DATETIME NULL,
    StrikePrice INT NULL,
	TradeTechniqueId VARCHAR(10) NOT NULL,	    
    TrendChartPositionId VARCHAR(10) NOT NULL,	    
    TradeChartPositionId VARCHAR(10) NOT NULL,	    
    EntryChartPositionId VARCHAR(10) NOT NULL,	           
    Cost  FLOAT(12, 2) DEFAULT 0.00,
    Details VARCHAR(250) NULL,
    UserId VARCHAR(50) NOT NULL,
	PRIMARY KEY(TradeId)
);

-- Trade Type Table 
-- Stock or Options

DROP TABLE IF EXISTS TradeType;
CREATE TABLE TradeType
(
	TradeTypeId INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,		
	Purpose VARCHAR(50),
	Description VARCHAR(250) NULL,
	Targets VARCHAR(50) NULL,	
	PRIMARY KEY(TradeTypeId)
);


-- Trade Action Table
-- Real Simulation BackTesting

DROP TABLE IF EXISTS TradeAction;
CREATE TABLE TradeAction
(
	TradeActionId INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,			
	Description VARCHAR(50) NULL,	
	Purpose VARCHAR(50) NULL,		
	PRIMARY KEY(TradeActionId)
);

-- Trade Techniques Table
-- this is a list of trade techniques to be used
-- They contain the ChartIds
-- This should have a relationship with the chartrelationship table

DROP TABLE IF EXISTS TradeTechniques;
CREATE TABLE TradeTechniques
(
	Id INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,	
	TrendChartId VARCHAR(10) NOT NULL, 	
	TradeChartId VARCHAR(10) NOT NULL, 
	EntryChartId VARCHAR(10) NOT NULL, 
	Purpose VARCHAR(250),
	Description VARCHAR(250) NULL,	
	PRIMARY KEY(Id)
);




-- Related To Stocks Section 
 -- Stocks Table  
 -- Stocks entereed into the system associated with a userid
 DROP TABLE IF EXISTS Stocks;
 CREATE TABLE Stocks
 (
 	StockId INT NOT NULL AUTO_INCREMENT,
 	Symbol VARCHAR(10) NOT NULL,
 	StockName VARCHAR(50) NOT NULL,
 	Industry VARCHAR(250) NULL,
	Description VARCHAR(250) NULL,
	Notes VARCHAR(250) NULL,	
	PRIMARY KEY(StockId)
 );


-- Watchlist Table
-- Stock Watchlist associated with a user id and stock id

DROP TABLE IF EXISTS Watchlist;
CREATE TABLE Watchlist
(
	Id INT NOT NULL AUTO_INCREMENT,
	CreateTime  DATETIME DEFAULT   CURRENT_TIMESTAMP,
	UserId VARCHAR(50) NOT NULL,
	TypeId VARCHAR(50) NOT NULL,
	Symbol VARCHAR(50) NOT NULL,					

	PRIMARY KEY(Id)
);

-- Charts Section 
-- Charts Table 
DROP TABLE IF EXISTS Charts;
CREATE TABLE Charts
(
	Id INT NOT NULL AUTO_INCREMENT,
	ChartsInterval  VARCHAR(50) NOT NULL,
	Name  VARCHAR(50) NOT NULL,
	IsEntry  VARCHAR(10) NOT NULL,
	IsTrade  VARCHAR(10) NOT NULL,
	IsTrend  VARCHAR(10) NOT NULL,
	Notes VARCHAR(255) NULL,	
	PRIMARY KEY(Id)
);

-- Charts Purpose Table 
-- Not using this until figure out what it is for
DROP TABLE IF EXISTS ChartsPurpose;
CREATE TABLE ChartsPurpose
(
	ChartsPurposeId INT NOT NULL AUTO_INCREMENT,	
	Name  VARCHAR(50) NOT NULL,	
	Notes VARCHAR(255) NULL,	
	PRIMARY KEY(ChartsPurposeId)
);


-- Chart Actions Table 
-- This is a summary of Daily 
-- Not using this until figure out what it is for
DROP TABLE IF EXISTS ChartActions;
CREATE TABLE ChartActions
(
	ChartActionsId INT NOT NULL AUTO_INCREMENT,
	StockId VARCHAR(10) NOT NULL,	    
	EventDateTime  DATETIME DEFAULT   CURRENT_TIMESTAMP,
	DirectionId VARCHAR(10) NULL,    
    TradeChartsId VARCHAR(10) NULL, 
	TradeChartPositionId VARCHAR(10) NOT NULL,	   
	OptionsTypeId VARCHAR(10) NULL,    
	StrikePrice INT NOT NULL,
	Cost  FLOAT(12, 2) DEFAULT 0.00,
    UserId VARCHAR(50) NOT NULL,
	PRIMARY KEY(ChartActionsId)
);


-- Daily Charts Basket Table 
-- This is the daily charts journal 
-- estimate of direction and target prices
-- want to capture
 this information for future analysis

DROP TABLE IF EXISTS DailyChartsBasket;
CREATE TABLE DailyChartsBasket
(
	Id INT NOT NULL AUTO_INCREMENT,
	StockId VARCHAR(10) NOT NULL,	    
	EventDateTime  DATETIME DEFAULT   CURRENT_TIMESTAMP,
	StockTrendId VARCHAR(10) Not NULL,    
    TrendChartsId VARCHAR(10) NOT NULL DEFAULT 2, 
	TrendChartsDirection VARCHAR(10) NOT NULL,
	TrendChartsTarget INT NOT NULL,
	TrendChartsNotes VARCHAR(50) NULL,
	TradeChartsId VARCHAR(10) NOT NULL DEFAULT 3, 
	TradeChartsDirection VARCHAR(10) NOT NULL,
	TradeChartsTarget INT NOT NULL,
	TradeChartsNotes VARCHAR(50) NULL,
	EntryChartsId VARCHAR(10) NOT NULL DEFAULT 3, 
	EntryChartsDirection VARCHAR(10) NOT NULL,
	EntryChartsTarget INT NOT NULL,
	EntryChartsNotes VARCHAR(50) NULL,
	PRIMARY KEY(Id)
);


-- Chart Status Table 
-- Codes which are attached to the observation of the charts
-- Example out of bounds top
DROP TABLE IF EXISTS ChartStatus;
CREATE TABLE ChartStatus
(
	Id INT NOT NULL AUTO_INCREMENT,	
	Code VARCHAR(50) NOT NULL,	    	
	Name VARCHAR(50) NOT NULL,	    	
	Description  VARCHAR(250) NULL,
    Notes VARCHAR(250) NULL,
	PRIMARY KEY(Id)
);

-- Chart Relationship Table 
DROP TABLE IF EXISTS ChartRelationship;
CREATE TABLE ChartRelationship
(
	Id INT NOT NULL AUTO_INCREMENT,	
	TrendId VARCHAR(10) Not Null, 
	TradeId VARCHAR(10) Not Null, 
	EntryId VARCHAR(10) Not Null, 
	LowPct FLOAT NOT NULL, 
	HighPct FLOAT NOT NULL, 
	LowTime VARCHAR(10) NOT NULL, 
	HighTime VARCHAR(10) NOT NULL, 
	Name VARCHAR(50) NOT NULL,	    	
	Description  VARCHAR(250) NULL,    
	PRIMARY KEY(Id)
);


-- System Reference Section
-- Commodity Type Table
DROP TABLE IF EXISTS CommodityType;
CREATE TABLE CommodityType
(
	Id INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,			
	Description VARCHAR(50) NULL,	
	Purpose VARCHAR(250) NULL,		
	PRIMARY KEY(Id)
);


-- Options Type Table
DROP TABLE IF EXISTS OptionsType;
CREATE TABLE OptionsType
(
	Id INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,			
	Description VARCHAR(50) NULL,	
	Purpose VARCHAR(250) NULL,		
	PRIMARY KEY(Id)
);

-- Category Table
DROP TABLE IF EXISTS Category;
CREATE TABLE Category
(
	Id INT NOT NULL AUTO_INCREMENT,
	CreateTime  DATETIME DEFAULT   CURRENT_TIMESTAMP,
	UserId VARCHAR(50) NOT NULL,
    GroupId VARCHAR(50) NOT NULL,
    GroupName VARCHAR(250) NOT NULL,
	Name VARCHAR(50) NOT NULL,				
	Description VARCHAR(250),	
	PRIMARY KEY(Id)
);


-- Earnings Table
DROP TABLE IF EXISTS Earnings;
CREATE TABLE Earnings
(
	Id INT NOT NULL AUTO_INCREMENT,
	CreateTime  DATETIME DEFAULT   CURRENT_TIMESTAMP,
	UserId VARCHAR(50) NOT NULL,
	Symbol VARCHAR(50) NOT NULL,					
	Notes VARCHAR(250),	
	PRIMARY KEY(Id)
);


-- Non Trading Section
-- Goals Table
DROP TABLE IF EXISTS Goals;
CREATE TABLE Goals
(
	Id INT NOT NULL AUTO_INCREMENT,
	CreateTime  DATETIME DEFAULT   CURRENT_TIMESTAMP,
	UserId VARCHAR(50) NOT NULL,	
	CategoryId VARCHAR(25) NULL,		
	GoalIntervalId VARCHAR(25) NULL,		
	Goal VARCHAR(250),	
	Notes VARCHAR(250),	

	PRIMARY KEY(Id)
);

-- Goals Interval Table
-- How long wiill the goals take to be accomplished
-- Intervals are 7, 30, 60, 90 days 6 months, 1 year 5 years

DROP TABLE IF EXISTS GoalsIntervals;
CREATE TABLE GoalsIntervals
(
	Id INT NOT NULL AUTO_INCREMENT,
	GoalName VARCHAR(50) NOT NULL,	
	GoalInterval VARCHAR(50) NOT NULL,			
	Description VARCHAR(250),	
	PRIMARY KEY(Id)
);

-- Goals Category Table
-- What type of goal is it 
-- What does it relate to COMMENT-- Trading, Personal , Professional 


DROP TABLE IF EXISTS GoalsCategory;
CREATE TABLE GoalsCategory
(
	Id INT NOT NULL AUTO_INCREMENT,
	Category VARCHAR(50) NOT NULL,	
	GroupName VARCHAR(50) NOT NULL,		
	Description VARCHAR(250),	
	PRIMARY KEY(Id)
);


-- Events Table 
-- Used to record events that happen within the system


DROP TABLE IF EXISTS Events;
CREATE TABLE Events
(
	EventsId INT NOT NULL AUTO_INCREMENT,
	CreateTime  DATETIME DEFAULT   CURRENT_TIMESTAMP,
	Details VARCHAR(255) NOT NULL,	
    UserId VARCHAR(50) NOT NULL,
	PRIMARY KEY(EventsId)
);

-- Analysis Tables

DROP TABLE IF EXISTS TrendsInformation;
CREATE TABLE TrendsInformation
(
	Id INT NOT NULL AUTO_INCREMENT,
	Symbol VARCHAR(25) NOT NULL,
	ChartId VARCHAR(25) NOT NULL,
	StartDate  DATETIME NOT NULL,
	StartPrice INT NOT NULL,
	StartChartPositionId  VARCHAR(25) NOT NULL,
	EndDate DATETIME NOT NULL,
	EndPrice INT NOT NULL,
	EndChartPositionId  VARCHAR(25) NOT NULL,
	Details VARCHAR(255) NOT NULL,	
    UserId VARCHAR(50) NOT NULL,

	PRIMARY KEY(Id)
);

-- Lessons Learned Table
DROP TABLE IF EXISTS LessonsLearned;
CREATE TABLE LessonsLearned
(
	Id INT NOT NULL AUTO_INCREMENT,
	CreateTime  DATETIME DEFAULT   CURRENT_TIMESTAMP,
	UserId VARCHAR(50) NOT NULL,				
	Notes VARCHAR(250),	
	PRIMARY KEY(Id)
);

-- Planning




