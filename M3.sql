DROP DATABASE IF EXISTS final;

create database final;

use final;



 CREATE TABLE Customer
(
CustomerID INT NOT NULL auto_increment,
  FirstName VARCHAR(50) NOT NULL,
 LastName VARCHAR(50) NOT NULL,
 PhoneNumber VARCHAR(10) NOT NULL,
 Email VARCHAR(100) NOT NULL,
   PRIMARY KEY (CustomerID)
  );
    

	CREATE TABLE Reservations
(
	ReservationID INT NOT NULL auto_increment,
  CheckInDate DATE NOT NULL,
  CheckOutDate DATE NOT NULL,
  CustomerID INT NOT NULL,
  PRIMARY KEY (ReservationID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE AddOns
(
  AddOnID INT NOT NULL auto_increment,
  AddOnType VARCHAR(45),
  Price INT NOT NULL,
  PRIMARY KEY(AddOnID)
);

CREATE TABLE Billing (
    BillingID INT NOT NULL AUTO_INCREMENT,
    AddOnID INT NOT NULL,
    ReservationID INT NOT NULL,
    TotalCost DECIMAL NOT NULL,
    Taxes DECIMAL NOT NULL,
    PRIMARY KEY (BillingID),
    FOREIGN KEY (AddOnID)
        REFERENCES AddOns (AddOnID)
);

ALTER TABLE Billing
ADD FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID);

CREATE TABLE BillingDetails
(
  BillingDetailsID INT NOT NULL auto_increment,
  BillingID INT NOT NULL,
  PRIMARY KEY (BillingDetailsID),
  FOREIGN KEY (BillingID) REFERENCES Billing(BillingID)
);

CREATE TABLE Events 
(
  EventId INT NOT NULL auto_increment,
  EventName VARCHAR(100),
  EventType VARCHAR(45),
  PRIMARY KEY (EventId)
);

CREATE TABLE PromoCodes
(
  PromoID INT NOT NULL auto_increment,
  Promo DATETIME NOT NULL,
  Percentage DECIMAL NOT NULL,
  PRIMARY KEY (PromoID)
);

CREATE TABLE Amenitites
(
  AmenititesId INT NOT NULL auto_increment,
  AmenityType VARCHAR(45),
  PRIMARY KEY (AmenititesId)
);

CREATE TABLE RoomType
(
  RoomTypeId INT NOT NULL auto_increment,
  RoomType VARCHAR(50),
  PRIMARY KEY (RoomTypeId)
);

CREATE TABLE RoomRate
(
  RoomRateId INT NOT NULL auto_increment,
  CheckInDate DATETIME NOT NULL,
  CheckOutDate DATETIME NOT NULL,
  Price DECIMAL NOT NULL,
  PRIMARY KEY (RoomRateId)
);

CREATE TABLE Rooms (
    RoomId INT NOT NULL AUTO_INCREMENT,
    FLOOR INT NOT NULL,
    Occupancy INT NOT NULL,
    RoomType VARCHAR(50),
    RoomRateId INT NOT NULL,
    RoomTypeID INT NOT NULL,
    AmenititesId INT NOT NULL,
    PRIMARY KEY (RoomId)
);

ALTER TABLE Rooms
ADD FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID);

ALTER TABLE Rooms
ADD FOREIGN KEY (AmenititesId) REFERENCES Amenitites(AmenititesId);

ALTER TABLE Rooms
ADD FOREIGN KEY (RoomRateId) REFERENCES RoomRate(RoomRateId);

CREATE TABLE ReservationRooms
(
  RoomId INT NOT NULL,
  ReservationID INT NOT NULL,
  PRIMARY KEY (RoomId, ReservationId)
);

ALTER TABLE ReservationRooms
ADD CONSTRAINT fk_ReservationRooms_Room 
FOREIGN KEY (RoomId) REFERENCES Room(RoomId);

ALTER TABLE ReservationRooms 
ADD CONSTRAINT fk_ReservationRooms_Reservations
FOREIGN KEY (ReservationIDReservationID) REFERENCES Reservations(ReservationID);