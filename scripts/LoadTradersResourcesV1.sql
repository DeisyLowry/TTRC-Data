-- MySql Script 

-- April 17 2023

-- Load Script for The Traders Resource

-- DGL The D Man LatinLum

-- The infamous LatinLum Inc. LLC

-- DGLY LLC. 


USE TradersResources;

-- Table Maintenance
-- This section pertains to building tables for core funtionality related to Daily activites
-- Tasks Table schedule of tasks to be performed and what intervals


-- Users Section

-- Accounts Section

-- Trades Section

-- TradeZones

INSERT INTO `tradersresources`.`tradezones`
(Name,  
StartDate, EndDate, 
TrendChartId, TradeChartId, EntryChartId, 
CommodityId, 
Description)

VALUES
('Fall Winter', 
'10-15', '01-15', 
'01', '02', '06', 
'01', 
'Fall Winter Trade Zone  Fat time of the year big charts big gains long trade times');

-- Trades

-- TradeType
INSERT INTO `tradersresources`.`tradetype`
(Name, Purpose, Description, Targets)
VALUES
('Stock', 'Stock Trade', 'Gain Income usually conservative trade', '15 to 30 Percent Per Trade'),
('Options', 'Options Trade', 'Gain to increase Trading Accounts usually aggressive trade', '25 to 1000 Percent Per Trade largely depends on the time of the year')
;

-- TradeAction

-- TradeTechniques



-- Stocks Section

-- Charts Section

-- Charts 
INSERT INTO `tradersresources`.`charts`
(ChartsInterval, Name, Is_entry, Is_Trade, Is_Trend, Notes)
VALUES
('Weekly', 'Weekly Chart', 'No' , 'No', 'Yes', 'Used as the trend chart during fall, winter and spring time frame'),
('Daily', 'Daily Chart', 'No' , 'Yes', 'Yes', 'Used as the trade chart during fall, winter and spring time frame and trend during the late spring and summer'),
('233', '233 Half Day Chart', 'Yes' , 'Yes', 'Yes', 'Trade, Trend Chart all year'),
('55', '55 Hourly Type Chart', 'Yes' , 'Yes', 'Yes', 'Trade, Trend Entry Chart all year'),
('34', '34 Hourly Type Chart', 'Yes' , 'Yes', 'Yes', 'Trade, Trend Entry Chart all year'),
('21', '21 Hourly Type Chart', 'Yes' , 'Yes', 'Yes', 'Trade, Trend Entry Chart all year'),
('8', '8 Hourly Type Chart', 'Yes' , 'Yes', 'Yes', 'Trade, Trend Entry Chart all year'),
('5', '5 Hourly Type Chart', 'Yes' , 'Yes', 'Yes', 'Trade, Trend Entry Chart all year');


-- ChartsPurpose

-- ChartsActions

-- DailyChartsNasket

-- ChartStatus

-- Chart Status Table 
-- Chart Status Table 
INSERT INTO `tradersresources`.`chartstatus`
(Code, Name, Description, Notes)
VALUES
('OOBT', 'Out of Bounds Top', 'Top of the Bollinger Band', 'Notes'),
('OOBB', 'Out of Bounds Bottom', 'Bottom of the Bollinger Band', 'Notes'),
('20MA', '20 Moving Average Band', 'Potential Scale Points', 'Notes'),
('LRC', 'Long Red Candle', 'Potential Downside Reversal Candle', 'Notes'),
('LWC', 'Long White Candle', 'Potential Upside Reversal Candle', 'Notes'),
('URC', 'Upside Reversal Candle', 'Reversal Candle Trend upwards', 'Notes'),
('DRC', 'Downside Reversal Candle', 'Reversal Candle Trend downwards', 'Notes');



-- ChartRelationship 

INSERT INTO `tradersresources`.`chartrelationship`
(TrendId, TradeId, EntryId, 
LowPct, HighPct, 
LowTime, HighTime, 
Name, 
Description)

VALUES
('01','02','06', 
100, 10000, 
'1 Day' , '7 Weeks', 
'Fat Trade Time', 
'Fat of the year time'), 
('01','03','06', 
100, 10000, 
'4 hours' , '10 Days', 
'Chubby Trade Time', 
'Chubby Trade Fall and Winter time'), 
('02','04','07', 
50, 300, 
'1 hours' , '4 Days', 
'Trade Time', 
'Trade Year Round Trade'), 
('03','04','07', 
50, 300, 
'1 hours' , '4 Days', 
'Trade Time', 
'Trade Year Round Trade'), 
('02','04','08', 
50, 300, 
'1 hours' , '4 Days', 
'Trade Time', 
'Trade Year Round Trade'), 
('03','04','08', 
50, 300, 
'1 hours' , '4 Days', 
'Trade Time', 
'Trade Year Round Trade'), 
('02','05','07', 
50, 300, 
'1 hours' , '4 Days', 
'Trade Time', 
'Trade Year Round Trade'), 
('03','05','07', 
50, 300, 
'1 hours' , '4 Days', 
'Trade Time', 
'Trade Year Round Trade'), 
('02','05','08', 
25, 100, 
'30 Minutes' , '1 Days', 
'Trade Time', 
'Trade Year Round Trade'), 
('03','05','08', 
25, 100, 
'30 Minutes' , '1 Days', 
'Trade Time', 
'Trade Year Round Trade'), 

('04','06','09', 
10, 50, 
'20 Minutes' , '4 Hours', 
'Trade Time', 
'Trade Year Round Trade'), 

('04','07','07', 
10, 30, 
'8 Minutes' , '90 Minutes', 
'Trade Time', 
'Trade Year Round Trade'), 

('04','08','08', 
10, 20, 
'5 Minutes' , '60 Minutes', 
'Trade Time', 
'Trade Year Round Trade')
;




-- Reference Section 
-- CommodityType
-- OptionsType
-- Category

-- Earnings 

-- Goals
-- Gaols
-- Goals Interval
-- Goals Category
-- 
-- Analysis Table


-- TrendsInformation
-- LessonsLearned

-- Planning





INSERT INTO `tradersresources`.`tradeaction`
(
`Name`,
`Description`,
`Purpose`)
VALUES
('Enter', 'Enter Trade', 'Complete Enter Position'),
('Exit', 'Exit Trade', 'Complete Closure of Position'),
('ScaleEntry', 'Complete Scaled Position Entry', 'Complete Enter of the Trade'),
('ScaleExit', 'Complete Scaled Position Exit', 'Complete Exit of the Trade'),
('ScaleAdd', 'Scale Into Trade', 'Add to a Scaled Planned Position usually for Longer Trades or Trades'),
('ScaleMinus', 'Scale Into Trade', 'Subject from a Scaled Position usually for Longer Trades or Trades')
;



INSERT INTO TradeScenarios (Name, Description, GainsGoals)
VALUES

('Buy Stock', 'Buy Stock usually in round increments designed to hold for longer timeframes', '5 - 30'),
('Sell Stock', 'Sell Stock Short Sell usually in round increments designed to hold for longer timeframes', '5 - 30'),
('Buy Puts', 'Buy Puts Short Positions ', 'Income Trades Bigger POsitions Longer Trades'),
('Sell Puts', 'Sell Puts Long Positions ', 'Income Trades Bigger POsitions Longer Trades'),
('Buy Calls', 'Buy Calls Long Positions ', 'Income Trades Bigger POsitions Longer Trades'),
('Sell Calls', 'Sell Calls Short Positions ', 'Income Trades Bigger POsitions Longer Trades')
;

INSERT INTO TradeZone (Name, StartDate, EndDate, TrendChartId, TradeChartId, EntryChartId, CommodityId, Priority, Description)
VALUES

('Winter Fall Trading Zone', '10-15', '01-15', 01, 02, 05, 1, 1, 'Make this trade for maximum gains potential'),
('Spring Transitional Early', '01-15', '04-01', 01, 02, 05, 1, 1, 'Make this trade for maximum gains potential'),
('Spring Transitional Late', '04-01', '05-15', 02, 04, 07, 1, 1, 'Smaller quicker trades to make profits quicker usually multiple times a week'),
('Summer Transitional Early', '05-15', '08-01', 01, 02, 05, 1, 1, 'Make this trade for maximum gains potential'),
('Summer Transitional Late', '05-15', '08-01', 01, 02, 05, 1, 1, 'Choppy take profits quickly downside bias'),
('Spring Transitional Early', 'Options', 'Trade Account Growth Higher Risk smaller positions shorter trades'),
('Spring Transitional Late', 'Options', 'Trade Account Growth Higher Risk smaller positions shorter trades'),
('Summer Daily', 'Stocks', 'Income Trades Bigger POsitions Longer Trades')
;

INSERT INTO CommodityType (Name, Description, Purpose)
VALUES

('Options', 'Options', 'Trade Account Growth Higher Risk smaller positions shorter trades'),
('Stock', 'Stocks', 'Income Trades Bigger POsitions Longer Trades')
;


INSERT INTO OptionsType (Name, Description, Purpose)
VALUES

('Calls', 'Calls', 'Going long on a trade expect movement to the upside'),
('Puts', 'Puts', 'Going short on a trade expect movement to the downside')
;


INSERT INTO ChartStatus (Name, Description, Notes)
VALUES
('OOBT', 'Out of Bollinger Band Upper'),
('OOBB', 'Out of Bollinger Band Lower'),
('RVCU', 'Reversal Candle Upside'),
('RVCD', 'Reversal Candle Downside'),
('CCU', 'Christmas Cross Upside'),
('CCD', 'Christmas Cross Downside'),
('FPU', 'Fat Pitch Upside'),
('FPD', 'Fat Pitch Downside'),
('LRC', 'Long Red Candle'),
('LRW', 'Long White Candle'),
('RRC', 'Red Reversal Candle'),
('WRC', 'White Reversal Candle')
;



INSERT INTO Stocks (Symbol, StockName)
VALUES
('COIN', 'Bit Coin' ),('RCL', 'Royal Carribean Lines' ),('MDB', 'MongoDB' ),('SQ', 'BlockChain' ), ('META', 'META/Facebook'), ('AAPL', 'Apple'), ('AMZN', 'Amazon'), ('NVDA', 'NIVIDIA'), 
('NFLX', 'NetFlix'), ('GOOGL', 'Google'), ('SHOP', 'Shopify'), ('TSLA', 'Tesla'), ('ROKU','Roku'), ('FSLY', 'Fastly'), ('BYND', 'Beyond Meat'), ('ETSY','ETSY'), ('W', 'Wayfair'), 
('FDX', 'FedEx'), ('ULTA', 'Ulta Beauty'), ('GS', 'Goldman Sachs'), ('COF', 'Capital One Financials'), ('COP', 'ConnocoPhillips'), ('XOM', 'Exxon Mobile'), ('SEDG', 'SEDG'), ('TTD', 'Trade Desk '),
('HD', 'Home Depot'), ('CMG', 'Chipolte Grill'), ('BA', 'Boeing'), ('WYNN', 'Wynn Casinos'), ('ADBE', 'Adobe'), ('DHI', 'DR Horton'), ('EQT', 'EQT Natural Gas'), 
('TQQQ', 'Long Triple QQQs'),('SQQQ', 'Short Triple QQQs'), ('QQQ', 'QQQs')
;

-- Charts Table 
DROP TABLE IF EXISTS Charts;
CREATE TABLE Charts
(
	ChartsId INT NOT NULL AUTO_INCREMENT,
	ChartsInterval  VARCHAR(50) NOT NULL,
	Name  VARCHAR(50) NOT NULL,
	Is_Entry  VARCHAR(10) NOT NULL,
	Is_Trade  VARCHAR(10) NOT NULL,
	Is_Trend  VARCHAR(10) NOT NULL,
	Notes VARCHAR(255) NULL,	
	PRIMARY KEY(ChartsId)
);

INSERT INTO Charts (Name, Notes)
VALUES

('Monthly', 'Monthly Chart Reference', 0, 0, 1, 'Used to identify Trend for the Biggest Trade'),
('Weekly', 'Weekly Chart, Big Trend', 0, 1, 1, 'Used to Identify Big Trade Trend'),
('Daily', 'Daily Chart, Big Trend' , 0, 1, 1, 'Used to identify Big Trade and Medium Trend'), 
('233 Minute', '233 Chart, Medium Trend Trade', 1,1,1, 'Entry for Weekly Trade, Trade for Medium Trade, Trend for Medium Smaller Trade'), 
('55 Minute', '55 Minute Chart, Trend Trade Entry', 1,1,1, 'Used for Entry Trade Daily Chart, Trade Chart for Medium Trade, Trend for Medium to Smaller Trades'),
('34 Minute', '34 Minute Chart, Trade Entry', 0, 1, 1),
('21 Minute', '21 Minute Chart, Trade Entry'),
('8 Minute', '8 Minute Chart, Trade Entry'),
('5 Minute', '5 Minute Chart, Trade Entry'),
('1 Minute', '1 Minute Chart, Entry')
;



INSERT INTO TradeTechniques (Name, TrendChartId, TradeChartId, EntryChartId, Purpose, Description)
VALUES

('IntraDay', '6', '9', '10', 'Day Trading Small gains'),
('InterDay', '5', '7', '9', 'Day Trading Small gains'),
('Splits', '5', '7', '9', 'Splits trade usually between announcement and event, sometimes post event'),
('Earnings', '5', '7', '9', 'Earnings Trade usually before earnings release'),
('Charts', '3','5','8', 'Trade Chart with understanding'),
('BigCharts', '1','2','2', 'Big CHarts Move All in line usually Jan and July Trade')
;



INSERT INTO Events (Details, UserId)
VALUES
('Initial Event', 'dlowry007')
;


INSERT INTO AccountType (Name, Description, Notes)
VALUES
('Basket', 'Trading Basket for Day to Day trading', 'Some Stocks come in and out this basket'),
('Earnings', 'Make Earnings Trades', 'Some Stocks Trade at different earnings times'),
('Widows and Orphans', 'Trading Stocks for Income not designed for Options trading', 'Small Stock Basket'),
('Vault', 'Trading Stocks hold for long time', 'Tiny Stock Basket')
;



