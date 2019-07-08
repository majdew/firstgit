drop database `tracking`;
create database `tracking`;
	Use tracking;
	CREATE TABLE `Users` (
  `UserName` VARCHAR(25),
  `UserID` INT AUTO_INCREMENT PRIMARY KEY,
  `UserPhone` VARCHAR(16),
  `DateRegister` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE `Users`;

CREATE TABLE `UserFinder` (
  `UserID` INT,
  `FindByUserID` INT,
   CONSTRAINT FOREIGN KEY (`UserID`) REFERENCES `Users`(`UserID`),
   CONSTRAINT FOREIGN KEY (`FindByUserID`) REFERENCES `Users`(`UserID`)
);

DESCRIBE  `UserFinder`;


CREATE TABLE `Places` (
  `PlaceName` VARCHAR(50),
  `PlaceLog` DOUBLE,
  `PlaceLat` DOUBLE,
  `NotifyMe` BOOLEAN DEFAULT 1,
  `PlaceFullLocation` VARCHAR(75),
  `UserID` INT,
  CONSTRAINT FOREIGN KEY (`UserID`) REFERENCES `Users`(`UserID`)
);
DESCRIBE `Places`;


CREATE TABLE `Notification` (
  `UserID` INT,
  `ByUserID` INT,
  `PlaceFullName` VARCHAR(70),
  `IsReaded` BOOLEAN DEFAULT 0,
  CONSTRAINT FOREIGN KEY (`UserID`) REFERENCES `Users`(`UserID`),
  CONSTRAINT FOREIGN KEY (`ByUserID`) REFERENCES `Users`(`UserID`)
);
DESCRIBE `Notification`;

CREATE TABLE `Tracking` (
  `UserId` INT,
  `Log` DOUBLE,
  `Lat` DOUBLE,
  `BatteryLevel` INT,
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT FOREIGN KEY (`UserID`) REFERENCES `Users`(`UserID`)
);

DESCRIBE `Tracking`;


CREATE TABLE `ShopItem` (
  `ItemName` VARCHAR(50),
  `PreferPlace` VARCHAR(70),
  `RequstedByUserID` INT,
  `DeliveredByUserID` INT,
  `DateRequsted` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `DateDelivered` DATETIME,
   CONSTRAINT FOREIGN KEY (`RequstedByUserID`) REFERENCES `Users`(`UserID`),
    CONSTRAINT FOREIGN KEY (`DeliveredByUserID`) REFERENCES `Users`(`UserID`)
);

DESCRIBE `ShopItem`;


SHOW TABLES;
