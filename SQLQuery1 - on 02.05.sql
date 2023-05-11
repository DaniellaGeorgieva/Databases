--ex.1 build database Flights 

--USE master
--GO
--if exists (select * from sysdatabases where name='FlightsByMe')
--	DROP DATABASE FlightsByMe

--CREATE DATABASE FlightsByMe
--GO
--USE FlightsByMe
--GO

--CREATE TABLE AIRLINE (
--CODE CHAR(2) NOT NULL,
--NAME VARCHAR(30) UNIQUE NOT NULL, --ADDED UNIQUE
--COUNTRY VARCHAR(20) NOT NULL,
--CONSTRAINT pk_AIRLINE PRIMARY KEY (CODE)
--);

--CREATE TABLE AIRPORT (
--CODE CHAR (3) NOT NULL,
--NAME VARCHAR(50) NOT NULL,
--COUNTRY VARCHAR(30) NOT NULL,
--CITY VARCHAR(30) NOT NULL,
--CONSTRAINT pk_AIRPORT PRIMARY KEY (CODE),
--CONSTRAINT uk_AIRPORT UNIQUE (NAME)
--);

--CREATE TABLE AIRPLANE (
--CODE CHAR (3) NOT NULL,
--TYPE VARCHAR (30) NOT NULL,
--SEATS INT NOT NULL,
--YEAR INT NOT NULL,
--CONSTRAINT pk_AIRPLANE PRIMARY KEY (CODE)
--)

--CREATE TABLE FLIGHT (
--FNUMBER CHAR (10) NOT NULL,
--AIRLINE_OPERATOR CHAR(2) NOT NULL,
--DEP_AIRPORT CHAR (3),
--ARR_AIRPORT CHAR (3),
--FLIGHT_TIME TIME NOT NULL, 
--FLIGHT_DURATION INT NOT NULL,
--AIRPLANE CHAR(3),
--CONSTRAINT pk_FLIGHT PRIMARY KEY (FNUMBER),
--CONSTRAINT fk_FLIGHT_AIRLINE FOREIGN KEY (AIRLINE_OPERATOR) REFERENCES AIRLINE(CODE),
--CONSTRAINT fk_FLIGHT_AIRPLANE FOREIGN KEY (AIRPLANE) REFERENCES AIRPLANE (CODE),
--CONSTRAINT fk_FLIGHT_AIRPORT1 FOREIGN KEY (DEP_AIRPORT) REFERENCES AIRPORT (CODE),
--CONSTRAINT fk_FLIGHT_AIRPORT2 FOREIGN KEY (ARR_AIRPORT) REFERENCES AIRPORT (CODE)
--)


--CREATE TABLE CUSTOMER (
--ID INT NOT NULL,
--FNAME VARCHAR(30) NOT NULL,
--LNAME VARCHAR(30) NOT NULL,
--EMAIL VARCHAR(30),
--CONSTRAINT pk_CUSTOMER PRIMARY KEY (ID)
--);

--CREATE TABLE AGENCY (
--NAME VARCHAR(30) NOT NULL,
--COUNTRY VARCHAR(20) NOT NULL,
--CITY VARCHAR(20) NOT NULL,
--PHONE VARCHAR(20),
--CONSTRAINT pk_AGENCY PRIMARY KEY (NAME),
--CONSTRAINT uk_AGENCY UNIQUE (NAME)
--);

--CREATE TABLE BOOKING (
--CODE CHAR(6) NOT NULL,
--AGENCY VARCHAR(50) NOT NULL,
--AIRLINE_CODE CHAR (2),
--FLIGHT_NUMBER CHAR(10) NOT NULL,
--CUSTOMER_ID INT NOT NULL,
--BOOKING_DATE DATE NOT NULL,
--FLIGHT_DATE DATE NOT NULL,
--PRICE DECIMAL (9,2) NOT NULL,
--STATUS BIT NOT NULL,
--CONSTRAINT pk_BOOKING PRIMARY KEY (CODE),
--CONSTRAINT fk_BOOKING_FLIGHT FOREIGN KEY (FLIGHT_NUMBER) REFERENCES FLIGHT(FNUMBER),
--CONSTRAINT fk_BOOKING_AIRPLANE FOREIGN KEY (AIRLINE_CODE) REFERENCES AIRLINE (CODE),
--CONSTRAINT fk_BOOKING_CUSTOMER FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(ID)
--);



---- e) add check constraints
--ALTER TABLE AIRPLANE
--ADD CONSTRAINT ck_airplane_SEATS
--CHECK (SEATS > 0);

--ALTER TABLE BOOKING
--ADD CONSTRAINT ck_booking_dateDep
--CHECK (FLIGHT_DATE >= BOOKING_DATE);

--ALTER TABLE CUSTOMER
--ADD CONSTRAINT ck_customer_email
--CHECK ((LEN(EMAIL) > 6) AND (EMAIL LIKE '%@%.%'));

--ALTER TABLE BOOKING
--ADD CONSTRAINT ck_booking_status
--CHECK (STATUS IN (0,1));


--INSERT INTO AIRLINE
--VALUES  ('AZ', 'Alitalia', 'Italy'),
--		('BA', 'British Airways', 'United Kingdom'),
--		('LH', 'Lufthansa', 'Germany'),
--		('SR', 'Swissair', 'Switzerland'),
--		('FB', 'Bulgaria Air', 'Bulgaria'),
--		('SU', 'Aeroflot', 'Russian Federation'),
--		('AF', 'Air France', 'France'),
--		('TK', 'Turkish Airlines', 'Turkey'),
--		('AA', 'American Airlines', 'United States'),
--		('OA', 'Olympic Air', 'Greece'),
--		('A3', 'Aegean Airlines', 'Greece'),
--		('ET', 'Ethiopian Airlines', 'Ethiopia'),
--		('U2', 'EasyJet', 'United Kingdom'),
--		('DL', 'Delta Air Lines', 'France');
SELECT * FROM AIRLINE;

--INSERT INTO AIRPORT
--VALUES	('SVO', 'Sheremetyevo', 'Russian Federation', 'Moscow'),
--		('DME', 'Domodedovo', 'Russian Federation', 'Moscow'),
--		('SOF', 'Sofia International', 'Bulgaria', 'Sofia'),
--		('BOJ', 'Burgas International', 'Bulgaria', 'Burgas'),
--		('CDG', 'Charles De Gaulle', 'France', 'Paris'),
--		('ORY', 'Orly', 'France', 'Paris'),
--		('LBG', 'Le Bourget', 'France', 'Paris'),
--		('JFK', 'John F Kennedy International', 'United States','New York'),
--		('ORD', 'Chicago O''Hare International', 'United States', 'Chicago'),
--		('IST', 'Ataturk International', 'Turkey', 'Istanbul'),
--		('ESB', 'Esenboga International', 'Turkey', 'Ankara'),
--		('AHN', 'Athens', 'Greece', 'Athens'),
--		('FKB', 'Karlsruhe', 'Germany', 'Karlsruhe'),
--		('TXL', 'Tegel', 'Germany', 'Berlin'),
--		('BER', 'Berlin Metropolitan Area', 'Germany', 'Berlin'),
--		('MUC', 'Franz Josef Strauss', 'Germany', 'Munich'),
--		('GVA', 'Geneve-Cointrin', 'Switzerland', 'Geneve'),
--		('BRN', 'Belp', 'Switzerland', 'Berne'),
--		('FCO', 'Leonardo da Vinci International', 'Italy', 'Rome'),
--		('LIN', 'Linate', 'Italy', 'Milan'),
--		('LHR', 'London Heathrow', 'United Kingdom', 'London');
SELECT * FROM AIRPORT

--INSERT INTO AIRPLANE
--VALUES	('319', 'Airbus A319', 150, 2003),
--		('320', 'Airbus A320', 280, 2013),
--		('321', 'Airbus A321', 150, 2018),
--		('100', 'Fokker 100', 80, 2000),
--		('738', 'Boeing 737-800', 90, 2020),
--		('735', 'Boeing 737-800', 90, 2016),
--		('AT5', 'ATR 420', 50, 1995),
--		('DH4', 'De Havilland DHC-8-400', 70, 1992);
SELECT * FROM AIRPLANE

--INSERT INTO FLIGHT
--VALUES	('FB1363', 'SU', 'SOF', 'SVO', '12:45', 100, '738'),
--		('FB1364', 'SU', 'SVO', 'SOF', '10:00', 120, '321'),
--		('SU2060', 'SU', 'SVO', 'SOF', '11:10', 110, '738'),
--		('SU2061', 'SU', 'SOF', 'SVO', '13:00', 110, '320'),
--		('FB363', 'FB', 'SOF', 'SVO', '15:10', 110, '738'),
--		('FB364', 'FB', 'SVO', 'SOF', '21:05', 120, '738'),
--		('FB437', 'FB', 'SOF', 'MUC', '09:10', 120, '319'),
--		('FB438', 'FB', 'MUC', 'SOF', '12:10', 90, '738'),
--		('TK1027', 'TK', 'IST', 'SOF', '07:00', 100, '738'),
--		('TK1028', 'TK', 'SOF', 'IST', '10:00', 100, 'AT5'),
--		('OA307', 'OA', 'AHN', 'SOF', '09:25', 40, '738'),
--		('OA308', 'OA', 'SOF', 'AHN', '10:25', 40, '738'),
--		('EZY3159', 'U2', 'LHR', 'SOF', '10:05', 90, '738'),
--		('EZY3160', 'U2', 'SOF', 'LHR', '12:45', 90, '738'),
--		('EZY1931', 'U2', 'LHR', 'SOF', '10:15', 90, '738'),
--		('EZY1932', 'U2', 'SOF', 'LHR', '13:05', 90, '738'),
--		('LH1702', 'LH', 'MUC', 'SOF', '10:10', 100, '738'),
--		('LH1703', 'LH', 'SOF', 'MUC', '13:10', 100, '738'),
--		('FB851', 'FB', 'SOF', 'LHR', '13:30', 100, '738'),
--		('FB852', 'FB', 'LHR', 'SOF', '16:30', 100, '100'),
--		('LH1426', 'LH', 'FKB', 'SOF', '11:05', 120, '738'),
--		('LH1427', 'LH', 'SOF', 'FKB', '13:45', 120, '735'),
--		('FB457', 'FB', 'SOF', 'CDG', '09:10', 100, '319'),
--		('FB458', 'FB', 'ORY', 'SOF', '12:10', 100, '738'),
--		('TK1037', 'TK', 'ESB', 'SOF', '07:00', 90, '738'),
--		('TK1038', 'TK', 'SOF', 'ESB', '10:00', 90, 'AT5');
SELECT * FROM FLIGHT;

--INSERT INTO CUSTOMER (ID, FNAME, LNAME, EMAIL)
--VALUES	(1, 'Petar', 'Milenov', 'petter@mail.com'),
--		(2, 'Dimitar', 'Petrov', 'petrov@mail.com'),
--		(3, 'Ivan', 'Ivanov', 'ivanov@mail.com'),
--		(4, 'Petar', 'Slavov', 'slavov@mail.com'),
--		(5, 'Bogdan', 'Bobov', 'bobov@mail.com'),
--		(6, 'Petar', 'Kirov', 'kirov@mail.com'),
--		(7, 'Vladimir', 'Petrov', 'vladov@mail.com');
SELECT * FROM CUSTOMER;

--INSERT INTO AGENCY
--VALUES	('Travel One', 'Bulgaria', 'Sofia', '0783482233'),
--		('Travel Two', 'Bulgaria', 'Plovdiv', '02882234'),
--		('Travel Tour', 'Bulgaria', 'Sofia', NULL),
--		('Aerotravel', 'Bulgaria', 'Varna', '02884233'),
--		('Aerofly', 'Bulgaria', 'Sofia', '02882533'),
--		('Fly Tour', 'Bulgaria', 'Sofia', '02881233');
SELECT * FROM AGENCY;

--INSERT INTO BOOKING
--VALUES	('YN298P', 'Travel One', 'FB', 'FB1363', 1, '2023-04-20', '2023-12-25', 300, 0),
--		('YA298P', 'Travel Two', 'TK', 'TK1038', 2, '2023-04-20', '2023-12-25', 300, 1),
--		('YB298P', 'Travel Tour', 'TK', 'TK1037', 3, '2023-04-20', '2023-05-25', 400, 0),
--		('YC298P', 'Travel One', 'TK', 'TK1028', 4, '2023-04-21', '2023-11-25', 350, 0),
--		('YD298P', 'Travel Tour', 'TK', 'TK1028', 1, '2023-04-21', '2023-12-20', 250, 1),
--		('YE298P', 'Aerofly', 'TK', 'TK1027', 2, '2023-04-21', '2023-12-21', 150, 0),
--		('YJ298P', 'Aerofly', 'SU', 'SU2061', 3, '2023-04-22', '2023-12-05', 500, 1),
--		('YS298P', 'Aerofly', 'SU', 'SU2061', 4, '2023-04-22', '2023-11-15', 400, 0),
--		('YK298P', 'Aerofly', 'SU', 'SU2060', 1, '2023-04-22', '2023-08-08', 350, 0),
--		('YM298P', 'Aerotravel', 'OA', 'OA308', 2, '2023-04-23', '2023-07-10', 350, 1),
--		('YN198P', 'Aerotravel', 'OA', 'OA307', 3, '2023-04-23', '2023-11-25', 450, 0),
--		('YN498P', 'Aerofly', 'LH', 'LH1703', 1, '2023-04-24', '2023-05-25', 300, 1),
--		('YN598P', 'Aerotravel', 'FB', 'FB1363', 5, '2023-04-24', '2023-06-25', 300, 0),
--		('YN698P', 'Fly Tour', 'FB', 'FB852', 6, '2023-04-24', '2023-07-25', 330, 1),
--		('YL298P', 'Fly Tour', 'FB', 'FB851', 7, '2023-04-24', '2023-05-25', 360, 0),
--		('YZ298P', 'Fly Tour', 'FB', 'FB458', 1, '2023-04-25', '2023-06-25', 380, 1),
--		('YN268P', 'Fly Tour', 'FB', 'FB457', 2, '2023-04-25', '2023-12-21', 390, 0);
SELECT * FROM BOOKING