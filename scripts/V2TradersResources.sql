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


-- User Table 

DROP TABLE IF EXISTS Users;
CREATE TABLE Users
(
	Id INT NOT NULL AUTO_INCREMENT,
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
('David', 'Lowry', 'dlowry007', 'DavidLowry64@gmail.com', 'DAVIDttrc2023!','Initial User', 1, 1)
;


-- Trade Type Table

DROP TABLE IF EXISTS TradeType;
CREATE TABLE TradeType
(
	TradeTypeId INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,		
	Purpose VARCHAR(50),
	Description VARCHAR(250) NULL,
	Targets VARCHAR(250) NULL,
	
	PRIMARY KEY(TradeTypeId)
);


-- Trade Action Table

DROP TABLE IF EXISTS TradeAction;
CREATE TABLE TradeAction
(
	TradeActionId INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,			
	Description VARCHAR(50) NULL,	
	Purpose VARCHAR(250) NULL,		
	PRIMARY KEY(TradeActionId)
);



-- Trade Type Table

DROP TABLE IF EXISTS TradeScenarios;
CREATE TABLE TradeScenarios
(
	Id INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,			
	Description VARCHAR(250) NULL,	
	GainsGoals VARCHAR(50) NULL,		
	TradeAccountId VARCHAR(50) NULL,	
	PRIMARY KEY(Id)
);


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
	Purpose VARCHAR(50) NULL,		
	PRIMARY KEY(Id)
);


-- Trades Table 
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


-- Chart Actions Table 
-- This is a summary of Daily 
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




-- Chart Positions Table 

DROP TABLE IF EXISTS ChartPositions;
CREATE TABLE ChartPositions
(
	ChartPositionsId INT NOT NULL AUTO_INCREMENT,	
	Name VARCHAR(50) NOT NULL,	    	
	Description  VARCHAR(250) NULL,
    Notes VARCHAR(50) NULL,
	PRIMARY KEY(ChartPositionsId)
);


 -- Stocks Table 
 
 DROP TABLE IF EXISTS Stocks;
 CREATE TABLE Stocks
 (
 	StockId INT NOT NULL AUTO_INCREMENT,
 	Symbol VARCHAR(10) NOT NULL,
 	StockName VARCHAR(50) NOT NULL,
 	Description VARCHAR(250) NULL,
	IndustrialCategory VARCHAR(50) NULL, 	
	TradeCategory VARCHAR(50) NULL, 	
	Notes VARCHAR(250) NULL,	
	PRIMARY KEY(StockId)
 );



-- Charts Table 
DROP TABLE IF EXISTS Charts;
CREATE TABLE Charts
(
	ChartsId INT NOT NULL AUTO_INCREMENT,
	Name  VARCHAR(50) NOT NULL,
	Notes VARCHAR(255) NULL,	
	PRIMARY KEY(ChartsId)
);

-- Trade Techniques Table

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


-- System Reference Tables 

-- Events Table 
DROP TABLE IF EXISTS Events;
CREATE TABLE Events
(
	EventsId INT NOT NULL AUTO_INCREMENT,
	CreateTime  DATETIME DEFAULT   CURRENT_TIMESTAMP,
	Details VARCHAR(255) NOT NULL,	
    UserId VARCHAR(50) NOT NULL,
	PRIMARY KEY(EventsId)
);




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


-- Accounts Type Table

DROP TABLE IF EXISTS AccountType;
CREATE TABLE AccountType
(
	Id INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,	
	Description VARCHAR(250) NULL,		
	Notes VARCHAR(250),	
	PRIMARY KEY(Id)
);




