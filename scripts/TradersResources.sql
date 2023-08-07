-- MySql Script 

-- March 2 2020

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


DROP TABLE IF EXISTS Tasks;
CREATE TABLE Tasks
(
	TaskId INT NOT NULL AUTO_INCREMENT,
	Title VARCHAR(50) NOT NULL,
	Frequency VARCHAR(50) NOT NULL DEFAULT 'DAILY',
	Description VARCHAR(250),
	Notes VARCHAR(250),
	Addnotes VARCHAR(250),
	CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(TaskId)
);

INSERT INTO Tasks (Title, Frequency, Description, Notes)
VALUES
('Charts', 'Daily','Daily Chart Work', 'Chart Work'),
('IntraDay', 'Daily','Daily Tracking of Stocks currently following', 'Stocks currently in basket and others, Intervals Pre Open, Mid Morning Before 11, Afternoon before 2:30, and Close after 4'),
('Homework', 'Daily','Daily Homework assignments', 'Homework'),
('Observations', 'Daily','Daily Observations assignments', 'Observations'),
('Assignments', 'Daily','Daily Assignments', 'Assignments')
;



 -- Stocks Table  The stocks currently tracking this list will change at various times it is fluid
 
 CREATE TABLE Stocks
 (
 	StocksId INT NOT NULL AUTO_INCREMENT,
 	Symbol VARCHAR(10) NOT NULL,
 	InitiateDate DATE,
 	TerminateDate DATE, 	
 	Category VARCHAR(50) NOT NULL DEFAULT 'Basket',
 	Segment VARCHAR(50),
 	CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(StocksId)
 );


INSERT INTO Stocks (Symbol)
VALUES
('MU'), ('NFLX'), ('CMG'),('AMZN'), ('GOOGL'), ('TSLA'), ('ROKU'), ('TSLA'), ('NVDA'), ('BA'), ('BYND')
;

-- Charts Table Daily charts work for stocks in the basket and others currently tracking

CREATE TABLE Charts
(
	ChartsId INT NOT NULL AUTO_INCREMENT,
	TaskId INT, 
	Symbol VARCHAR(10) NOT NULL,
	EffectiveDate DATE,
	WeeklyDir VARCHAR(10),
	WeeklyPriceTarget Double(10,2),	
	WeeklyNotes VARCHAR(255),
	DailyDir VARCHAR(10),
	DailyPriceTarget Double(10,2),
	DailyNotes VARCHAR(255),	
	TwoThreeThreeDir VARCHAR(10),
	TwoThreeThreePriceTarget Double(10,2),	
	TwoThreeThreeNotes VARCHAR(255),
	FiveFiveDir VARCHAR(10),
	FiveFivePriceTarget Double(10,2),	
	FiveFiveNotes VARCHAR(255),
	TwoOneDir VARCHAR(10),
	TwoOnePriceTarget Double(10,2),
	TwoOneNotes VARCHAR(255),
	Prediction VARCHAR(250),
	CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(ChartsId)
);

-- Charts Table Daily charts work for stocks in the basket and others currently tracking


-- Homework Table Daily Assignments

CREATE TABLE Notes
(
	NoteId INT NOT NULL AUTO_INCREMENT,
	SequenceId INT, 
	EffectiveDate DATE,
	SequenceNumber INT,
	Details VARCHAR(250),
	CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(NoteId)
);


-- Observations Table Daily things in the news internet seeking alpha etc these are used to provide opinions

CREATE TABLE Tasks
(
	TaskId INT NOT NULL AUTO_INCREMENT,	 
	EffectiveDate DATE,
	SequenceNumber INT,
	Details VARCHAR(250),
	FollowUp VARCHAR(250),
	CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(TaskId)
);




