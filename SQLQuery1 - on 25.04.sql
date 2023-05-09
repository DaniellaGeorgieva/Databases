
--Ex.1
--CREATE TABLE Product
--(maker CHAR (1),
-- model CHAR (4),
-- type VARCHAR (7)
--);

--CREATE TABLE PRINTER
--(code INT,
-- model CHAR (4),
 --price DECIMAL(5,2)
--);

--Á)
--INSERT INTO Product(maker, model, type)
--VALUES ('A', '1111', 'tech'),
        --('B', '1234', 'clth'),
		--('C', '1212', 'bag'),
		--('A', '1112', 'tech'),
        --('B', '1235', 'clth'),
		--('C', '1213', 'bag');

--For check
--SELECT *
--FROM PRINTER

--INSERT INTO PRINTER
--VALUES (12, '1111', 235),
  --      (13, '1112', 458.34),
	--	(11, '1782', 123.46),
		--(10, '1257', 899.345);

--Â)
--ALTER TABLE Printer
--ADD type VARCHAR (6);

--ALTER TABLE Printer
--ADD color CHAR(1) DEFAULT 'n';

--Used to check if B) properly executed:
--INSERT INTO PRINTER
--VALUES (9, '6738', 10.23, 'laser', DEFAULT);


--Ã)
--ALTER TABLE Printer
--DROP COLUMN price

--Ä)
--DROP TABLE Product, PRINTER


--ex.2 a)

--CREATE DATABASE MyFacebook;
--GO
USE MyFacebook
--GO

--CREATE TABLE USERS
--( id INT,
  --email VARCHAR (30),
  --password VARCHAR (30),
  --dateOfRegistration DATETIME
--);

--CREATE TABLE FRIENDS
--( numFirst INT,
  --numSecond INT
--)

--CREATE TABLE WALLS
--( numUser INT,
  --numMessageSender INT,
  --textMessage VARCHAR (50),
  --dateWritten DATETIME
--)

--CREATE TABLE GROUPS
--( id INT,
  --name VARCHAR (30),
  --description VARCHAR (30) DEFAULT ''
--)

--CREATE TABLE GROUPMEMBERS 
--( numGroup INT,
  --numUser INT
--)

--á)
--users
--INSERT INTO USERS
--VALUES (1, 'damon@abv.bg', 12345, '2021-05-11'),
  --(2, 'stefan@abv.bg', 12456, '2022-04-01'),
  --(3, 'elena@abv.bg', 145678, '2020-07-21'),
  --(4, 'caroline@abv.bg', 156789, '2019-03-09'),
  --(5, 'matt@abv.bg', 16789, '2020-11-25'),
  --(6, 'bonnie@abv.bg', 178890, '2021-06-11'),
  --(7, 'klaus@abv,bg', 166690, '2010-03-12'),
  --(8, 'hayley@abv.bg', 120984, '2019-02-15'),
  --(9, 'elijah@abv.bg', 45218, '2022-12-01');

SELECT * FROM USERS

--INSERT INTO FRIENDS
--VALUES (1, 2),
  --     (1, 3),
	--   (1, 6),
	  -- (2, 1),
	   --(2, 3),
	   --(2, 4),
	   --(4, 3),
	   --(4, 6),
	   --(4, 1),
	   --(9, 7),
	   --(9, 8),
	   --(8, 7),
	   --(8, 9);

SELECT * FROM FRIENDS

--INSERT INTO WALLS
--VALUES (2, 1, 'Hello, brother!', '2023-02-11'),
  --  (1, 3, 'I am not sorry that I am in love with you!', '2023-01-11'),
	--(7, 4, 'Seriously!', '2023-03-11'),
	--(7, 8, 'I need you to trust me', '2023-02-17'),
	--(1, 2, 'I was feeling epic!', '2022-02-11'),
	--(7, 6, 'Incendia!', '2023-02-13'),
	--(2, 1, 'Hello, brother!', '2023-02-11'),
	--(5, 4, 'Need your help at school', '2023-02-11');

SELECT * FROM WALLS

--INSERT INTO GROUPS
--VALUES (11, 'mysticFalls', 'town group activities'),
--(12,'daggers', 'how to find the perfect gift'),
--(13, 'NewOrleans', 'the king sends orders'),
--(14, 'vampires', 'learn how to be a vampire');

SELECT * FROM GROUPS

--INSERT INTO GROUPMEMBERS
--VALUES (11, 2),
--(11, 3),
--(11, 4),
--(11, 5),
--(12, 7),
--(13, 7),
--(13, 8),
--(13, 9),
--(14, 3),
--(14, 1);

SELECT * FROM GROUPMEMBERS
      








