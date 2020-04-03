CREATE DATABASE `BugReporter`;

CREATE TABLE BugReporter.BugReporter (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Status` enum('OPEN','PENDING','CLOSED','OTHER') NOT NULL DEFAULT 'OPEN',
  `Firstname` varchar(256) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `Subject` varchar(256) NOT NULL,
  `Details` varchar(10000) NOT NULL,
  `Device` varchar(128) NOT NULL,
  `OSVersion` varchar(128) NOT NULL,
  `AppName` varchar(128) NOT NULL,
  `AppVersion` varchar(128) NOT NULL,
  `BuildNumber` varchar(128) NOT NULL,
  `IP` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
);
