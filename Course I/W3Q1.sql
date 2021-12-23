/*
All of the questions in this quiz refer to the open source Chinook Database: 
*/

--1. How many albums does the artist Led Zeppelin have? 
SELECT  
	A.name,
	count(Alb.albumid) as num_albums
FROM 
	artists A
INNER JOIN 
	Albums Alb 
ON 
	A.artistid = Alb.artistid
WHERE 
	A.name = 'Led Zeppelin'


-- 2. Create a list of album titles and the unit prices for the artist "Audioslave".
SELECT 
	Alb.title, T.unitprice, A.name
FROM 
	Albums Alb
LEFT JOIN 
	Artists A 
ON 
	Alb.artistid = A.artistid
LEFT JOIN 
	Tracks as T 
ON 
	Alb.albumid = T.albumid
WHERE 
	A.name = 'Audioslave'

--3. Find the first and last name of any customer who does not have an invoice
SELECT  
	C.firstname,
	C.lastname, 
	I.invoiceid
FROM 	
	customers C  
LEFT JOIN 
	invoices I 
ON 
	C.customerid=I.customerid
WHERE 
	invoiceid IS NULL

--4. Find the total price for the Album "Big Ones"
SELECT
    title,
    unitprice * numtracks AS total
FROM

(
    SELECT 
        A.Albumid, A.title, T.trackid,
        count(trackid) as numtracks,
        unitprice
    FROM 
        ALBUMS A
    INNER JOIN
        Tracks T 
    ON 
        A.Albumid = T.albumid
    GROUP BY
        A.albumid
        --numtracks x unit proce
)

WHERE 
    title = "Big Ones"
