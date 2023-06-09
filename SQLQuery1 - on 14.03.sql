USE movies
SELECT MOVIEEXEC.NAME, movie.TITLE
FROM MOVIE JOIN MOVIEEXEC ON MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
WHERE MOVIEEXEC.CERT# = (SELECT MOVIE.PRODUCERC# FROM MOVIE WHERE MOVIE.TITLE = 'Star Wars')

SELECT DISTINCT MOVIEEXEC.NAME
FROM MOVIE JOIN MOVIEEXEC ON MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
WHERE TITLE IN (SELECT MOVIETITLE FROM MOVIE JOIN STARSIN ON TITLE = MOVIETITLE WHERE STARNAME = 'Harrison Ford')


SELECT DISTINCT STUDIO.NAME, STARNAME
FROM MOVIE JOIN STUDIO ON MOVIE.STUDIONAME = STUDIO.NAME JOIN STARSIN ON TITLE = MOVIETITLE
ORDER BY STUDIO.NAME ASC

SELECT STARNAME, NETWORTH, TITLE
FROM MOVIE JOIN STARSIN ON TITLE = MOVIETITLE JOIN MOVIEEXEC ON PRODUCERC# = CERT#
WHERE NETWORTH = (SELECT TOP 1 NETWORTH FROM MOVIEEXEC ORDER BY NETWORTH DESC )

SELECT NAME, MOVIETITLE
FROM MOVIESTAR LEFT JOIN STARSIN ON NAME = STARNAME
WHERE MOVIETITLE IS NULL

USE PC
SELECT MAKER, PRODUCT.model, PRODUCT.type
FROM PRODUCT LEFT JOIN LAPTOP ON PRODUCT.model = LAPTOP.model
WHERE laptop.code IS NULL
INTERSECT
SELECT MAKER, PRODUCT.model, PRODUCT.type
FROM PRODUCT LEFT JOIN PC ON PRODUCT.model = PC.model
WHERE PC.code IS NULL
INTERSECT
SELECT MAKER, PRODUCT.model, PRODUCT.type
FROM PRODUCT LEFT JOIN PRINTER ON PRODUCT.model = PRINTER.model
WHERE PRINTER.code IS NULL

SELECT PRODUCT.maker
FROM LAPTOP LEFT JOIN PRODUCT ON LAPTOP.model = product.model
WHERE PRODUCT.maker IS NOT NULL
INTERSECT
SELECT PRODUCT.maker
FROM PRINTER LEFT JOIN PRODUCT ON PRINTER.model = PRODUCT.model
WHERE PRODUCT.maker IS NOT NULL

SELECT DISTINCT L2.hd
FROM LAPTOP AS L1 LEFT JOIN LAPTOP AS L2 ON L1.hd = L2.hd
WHERE L2.hd IS NOT NULL AND L1.code != L2.code

SELECT PC.model
FROM PC LEFT JOIN PRODUCT ON PC.model = PRODUCT.model
WHERE PRODUCT.maker IS NULL

USE ships
SELECT *
FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE SHIPS.CLASS IS NOT NULL


SELECT *
FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE SHIPS.NAME IS NOT NULL
UNION
SELECT *
FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS AND SHIPS.NAME = CLASSES.CLASS
WHERE SHIPS.CLASS IS NULL


SELECT CLASSES.COUNTRY, SHIPS.NAME
FROM CLASSES JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
WHERE SHIPS.NAME IN (SELECT SHIPS.NAME FROM SHIPS LEFT JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP WHERE OUTCOMES.SHIP IS NULL )
ORDER BY CLASSES.COUNTRY, SHIPS.NAME;

SELECT SHIPS.NAME AS 'Ship Name'
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE CLASSES.NUMGUNS >= 7 AND SHIPS.LAUNCHED = 1916

SELECT OUTCOMES.SHIP, BATTLES.NAME, BATTLES.DATE
FROM OUTCOMES JOIN BATTLES ON OUTCOMES.BATTLE = BATTLES.NAME
WHERE OUTCOMES.RESULT = 'sunk'
ORDER BY BATTLES.NAME

SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, SHIPS.LAUNCHED
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS AND SHIPS.NAME = CLASSES.CLASS

SELECT CLASSES.CLASS, CLASSES.TYPE, CLASSES.COUNTRY, CLASSES.NUMGUNS, CLASSES.BORE, CLASSES.DISPLACEMENT
FROM CLASSES LEFT JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
WHERE SHIPS.NAME IS NULL

SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS, OUTCOMES.RESULT
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.BATTLE = 'North Atlantic'


