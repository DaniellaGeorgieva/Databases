--USE FLIGHTS
--GO

--ex.1
--CREATE VIEW v_airline_numFlight_numPassenger(NUM_CONFIRMED, lineName, flight)
--AS
--SELECT COUNT(BOOKINGS.CUSTOMER_ID) AS NUM_COMFIRMED, AIRLINES.NAME, BOOKINGS.FLIGHT_DATE
--FROM BOOKINGS JOIN AIRLINES ON BOOKINGS.AIRLINE_CODE=AIRLINES.CODE
--WHERE BOOKINGS.STATUS=1
--GROUP BY FLIGHT_NUMBER, AIRLINES.NAME, BOOKINGS.FLIGHT_DATE
--WITH CHECK OPTION;

--to check ex.1
--SELECT *
--FROM v_airline_numFlight_numPassenger;


--ex.2
--CREATE VIEW v_client_with_most_bookings_by_agency
--AS
--SELECT MAX(NUM_CUS_PERAGENCY) AS max_num, BOOKINGS.AGENCY, CUSTOMERS.FNAME, CUSTOMERS.LNAME
--FROM BOOKINGS JOIN (SELECT BOOKINGS.AGENCY, BOOKINGS.CUSTOMER_ID, COUNT(CUSTOMER_ID) AS NUM_CUS_PERAGENCY
--                   FROM BOOKINGS JOIN CUSTOMERS ON BOOKINGS.CUSTOMER_ID=CUSTOMERS.ID
--                   GROUP BY BOOKINGS.AGENCY, BOOKINGS.CUSTOMER_ID) AS T1 ON BOOKINGS.AGENCY = T1.AGENCY JOIN CUSTOMERS ON T1.CUSTOMER_ID=CUSTOMERS.ID




--optimal for ex.2, does not print the names, only the biggest number of bookings of the same client per agency
--SELECT T1.AGENCY, MAX(T1.NUM_CUSTOMERS) AS MAX_BOOKINGS_PERAGENCY
--FROM BOOKINGS JOIN (SELECT AGENCY, CUSTOMER_ID, COUNT(CUSTOMER_ID) AS NUM_CUSTOMERS
--                    FROM BOOKINGS
--                    GROUP BY CUSTOMER_ID, AGENCY) AS T1 ON BOOKINGS.CUSTOMER_ID = T1.CUSTOMER_ID
--GROUP BY T1.AGENCY

--ex.3

--CREATE VIEW v_sofia_agencies 
--AS 
--  SELECT *
--  FROM AGENCIES
--  WHERE CITY LIKE 'Sofia'
--  WITH CHECK OPTION;

----to be successful
--INSERT INTO v_sofia_agencies (NAME, COUNTRY, CITY, PHONE)
--VALUES ('Dadada', 'Bulgaria', 'Sofia', '08992992')

----to be terminated
--INSERT INTO v_sofia_agencies (NAME, COUNTRY, CITY, PHONE)
--VALUES ('Dadada', 'Bulgaria', 'Plovdiv', '08992992')


--ex.4
--CREATE VIEW v_phone_agencies
--AS
--   SELECT *
--   FROM AGENCIES
--   WHERE PHONE IS NULL
--   WITH CHECK OPTION;

--TO CHECK EX.4
--INSERT INTO v_phone_agencies
--VALUES ('Hakuna Matata', 'Bulgaria', 'Plovdiv', null)

--ex.5
--INSERT INTO v_sofia_agencies 
--VALUES('T1 Tour', 'Bulgaria', 'Sofia','+359');
--completed


--INSERT INTO v_phone_agencies 
--VALUES('T2 Tour', 'Bulgaria', 'Sofia',null);
--completed

--INSERT INTO v_sofia_agencies 
--VALUES('T3 Tour', 'Bulgaria', 'Varna','+359');
--not completed

--INSERT INTO v_phone_agencies 
--VALUES('T4 Tour', 'Bulgaria', 'Varna',null);
--completed

--INSERT INTO v_phone_agencies 
--VALUES('T4 Tour', 'Bulgaria', 'Sofia','+359');--not completed, already existing t4, so it cannot be key


--ex.6
--the views in 3 and 4 are updatable

--ex.7
--DROP VIEW v_sofia_agencies;
--DROP VIEW v_phone_agencies;
--DROP VIEW v_airline_numFlight_numPassenger;

--ex.8

--USE pc 

--CREATE CLUSTERED INDEX idx_pc_product
--ON PRODUCT(MODEL)

--ex.9
--USE ships
--CREATE INDEX idx_classes_class
--ON CLASSES(CLASS)

--CREATE INDEX idx_ships_name
--ON SHIPS(NAME);

--CREATE INDEX idx_outcomes_ship
--ON OUTCOMES(SHIP);

--CREATE INDEX idx_battles_name
--ON BATTLES(NAME);


--DROP INDEX PRODUCT.idx_pc_product;
--DROP INDEX CLASSES.idx_classes_class;
--DROP INDEX OUTCOMES.idx_outcomes_ship;
--DROP INDEX SHIPS.idx_ships_name;
--DROP INDEX BATTLES.idx_battles_name;

