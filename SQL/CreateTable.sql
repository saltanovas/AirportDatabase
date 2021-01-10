CREATE TABLE Customer (
  Id            INTEGER      NOT NULL CHECK (Id > 0),
  FirstName     VARCHAR(20)  NOT NULL,
  LastName      VARCHAR(30)  NOT NULL,
  Email         VARCHAR(50)  NOT NULL,
  Phone         VARCHAR(15)  NOT NULL,
  Street        VARCHAR(30)  NOT NULL,
  City          VARCHAR(30)  NOT NULL,
  Country       VARCHAR(20)  NOT NULL,
  Zip           CHAR(10)     NOT NULL,
  CardNumber    CHAR(16)     NOT NULL CHECK (LENGTH(CardNumber) = 16),
  CardExpiracy  DATE         NOT NULL CHECK (CardExpiracy > CURRENT_DATE),

  PRIMARY KEY (Id)
);

CREATE TABLE Airport (
  AirportCode   CHAR(3)      NOT NULL CHECK (LENGTH(AirportCode) = 3),
  Name          VARCHAR(50)  NOT NULL,
  Country       VARCHAR(20)  NOT NULL,
  City          VARCHAR(30)  NOT NULL,

  PRIMARY KEY (AirportCode)
);

CREATE TABLE Aircraft (
  AircraftCode  VARCHAR(10)  NOT NULL,
  Model         VARCHAR(20)  NOT NULL,
  Airline       VARCHAR(20)  NOT NULL,
  SeatsNumber   SMALLINT     NOT NULL CHECK (SeatsNumber > 0 AND SeatsNumber < 1000),
  Manufacture   DATE,

  PRIMARY KEY (AircraftCode)
);

CREATE TABLE Flight (
  FlightNumber      VARCHAR(10)  NOT NULL,
  DeparturePlace    CHAR(3)      NOT NULL,
  DepartureTime     TIMESTAMP    NOT NULL,
  ArrivePlace       CHAR(3)      NOT NULL,
  ArriveTime        TIMESTAMP    NOT NULL,
  Aircraft          VARCHAR(10)  NOT NULL,

  PRIMARY KEY (FlightNumber),
  FOREIGN KEY (DeparturePlace)  REFERENCES aisa6698.Airport     ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (ArrivePlace) 	  REFERENCES aisa6698.Airport     ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (Aircraft)        REFERENCES aisa6698.Aircraft    ON DELETE RESTRICT ON UPDATE CASCADE,

  CONSTRAINT ArriveAfter CHECK (ArriveTime > DepartureTime),
  CONSTRAINT SamePlace   CHECK (DeparturePlace <> ArrivePlace)
);

CREATE TABLE Ticket (
  Flight              VARCHAR(10)   NOT NULL,
  Seat                SMALLINT      NOT NULL CHECK (Seat > 0 AND Seat < 1000),
  SeatClass           CHAR(10)      NOT NULL CONSTRAINT Classes CHECK (SeatClass IN ('First', 'Business', 'Economy')) DEFAULT 'Economy',
  Price               DECIMAL(5,2)  NOT NULL CHECK (Price > 0),
  Customer            INTEGER,
  PassengerFirstName  VARCHAR(20),
  PassengerLastName   VARCHAR(30),
  PurchaseTime        TIMESTAMP,

  PRIMARY KEY (Flight, Seat),
  FOREIGN KEY (Flight)      REFERENCES aisa6698.Flight      ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Customer)    REFERENCES aisa6698.Customer    ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Aircrew (
  Id            INTEGER        NOT NULL CHECK(Id > 0),
  FirstName     VARCHAR(20)    NOT NULL,
  LastName      VARCHAR(30)    NOT NULL,
  Position      VARCHAR(20)    NOT NULL,
  Flight        VARCHAR(10),

  PRIMARY KEY (Id),
  FOREIGN KEY (Flight) REFERENCES aisa6698.Flight ON DELETE SET NULL ON UPDATE CASCADE
);
