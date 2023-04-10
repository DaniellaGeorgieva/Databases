USE movies
SELECT MOVIEEXEC.NAME
FROM MOVIEEXEC
WHERE NETWORTH > 10000000 AND MOVIEEXEC.NAME IN (SELECT MOVIESTAR.NAME FROM MOVIESTAR WHERE GENDER = 'F')

SELECT MOVIESTAR.NAME
FROM MOVIESTAR
WHERE MOVIESTAR.NAME NOT IN (SELECT MOVIEEXEC.NAME FROM MOVIEEXEC)

SELECT MOVIE.TITLE
FROM MOVIE
WHERE MOVIE.LENGTH > (SELECT MOVIE.LENGTH FROM MOVIE WHERE MOVIE.TITLE = 'Star Wars')


SELECT MOVIEEXEC.NAME, MOVIE.TITLE
FROM MOVIEEXEC JOIN MOVIE ON CERT# = PRODUCERC#
WHERE MOVIEEXEC.NETWORTH > (SELECT MOVIEEXEC.NETWORTH FROM MOVIEEXEC WHERE MOVIEEXEC.NAME = 'Merv Griffin')

/*SELECT NAME, (SELECT TOP 1 LENGTH FROM MOVIE WHERE CERT# = PRODUCERC# ORDER BY LENGTH DESC) AS prodmax1
FROM MOVIEEXEC*/


USE PC
SELECT PRODUCT.maker
FROM PRODUCT
WHERE PRODUCT.model IN (SELECT PC.model FROM PC WHERE PC.speed > 500)

SELECT PRINTER.code, PRINTER.model, PRINTER.price
FROM printer
WHERE PRINTER.price >= ALL (SELECT PRINTER.price FROM PRINTER)

SELECT *
FROM laptop
WHERE LAPTOP.speed < ALL (SELECT PC.speed FROM PC)

SELECT TOP 1 LAPTOP.price, PRODUCT.model
FROM PRODUCT JOIN LAPTOP ON PRODUCT.model = LAPTOP.model 
ORDER BY LAPTOP.price DESC

SELECT TOP 1 t1.price 
From (
SELECT price
FROM LAPTOP
union
SELECT price
FROM pc
union
SELECT price
FROM printer
) as t1
ORDER BY price DESC

/* query number 2.5 unsuccessful*/
SELECT PRODUCT.maker
FROM PRODUCT JOIN PRINTER ON PRODUCT.model = PRINTER.model
WHERE PRINTER.color ='y' AND PRINTER.price = (SELECT TOP 1 PRINTER.price FROM PRINTER ORDER BY PRINTER.price ASC)

SELECT TOP 1 PRINTER.price
FROM PRINTER
ORDER BY price ASC


SELECT PRODUCT.maker
FROM PRODUCT JOIN PC ON PRODUCT.model = PC.model
WHERE PC.ram = (SELECT TOP 1 PC.ram FROM PC ORDER BY PC.ram ASC)
UNION
SELECT PRODUCT.maker
FROM PRODUCT JOIN PC ON PRODUCT.model = PC.model
WHERE PC.speed = (SELECT TOP 1 PC.speed FROM PC ORDER BY PC.speed DESC)

USE ships
SELECT DISTINCT CLASSES.COUNTRY
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE NUMGUNS = (SELECT TOP 1 NUMGUNS FROM CLASSES ORDER BY NUMGUNS DESC)

SELECT DISTINCT CLASSES.CLASS
FROM CLASSES JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
WHERE CLASSES.CLASS IN (SELECT SHIPS.CLASS FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP WHERE OUTCOMES.RESULT = 'sunk' )

/* TWO different executions for query 3.3*/
SELECT SHIPS.NAME, SHIPS.CLASS
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE CLASSES.BORE = 16

SELECT NAME, CLASS
FROM SHIPS
WHERE CLASS IN (SELECT CLASS FROM CLASSES WHERE BORE = 16)

SELECT NAME
FROM BATTLES
WHERE NAME IN (SELECT OUTCOMES.BATTLE FROM OUTCOMES JOIN SHIPS ON OUTCOMES.SHIP = SHIPS.NAME WHERE SHIPS.CLASS = 'Kongo')

SELECT SHIPS.CLASS, SHIPS.NAME
FROM SHIPS JOIN CLASSES AS C1 ON SHIPS.CLASS = C1.CLASS
WHERE NUMGUNS >= ALL (SELECT NUMGUNS FROM SHIPS JOIN CLASSES AS C2 ON SHIPS.CLASS = C2.CLASS WHERE C1.BORE = C2.BORE)
ORDER BY SHIPS.CLASS ASC
