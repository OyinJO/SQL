/*
All of the questions in this quiz refer to the open source Chinook Database: 
*/

-- 1. Using a subquery, find the names of all the tracks for the album "Californication".
SELECT 
	T.name
FROM 
	Tracks
WHERE T.albumid IN (	
	SELECT
		A.albumid
	FROM 
		Albums A
	WHERE	
		A.title = "Californication"
)

-- 2.Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT 
	C.firstname,
	C.lastname,
	C.city,
	C.email,
    count(invoiceid) AS numinvoices
FROM 
	Customers C
LEFT JOIN 
	Invoices I
ON
	C.customerid = I.customerid
GROUP BY 
    c.customerid


-- 3. Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT
	T.name,
	T.trackid,
	Alb.title,
	Alb.artistid
FROM 
	Albums Alb
LEFT JOIN
	Tracks T
ON 
	Alb.albumid = T.albumid


-- 4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
SELECT
	M.lastname AS manager,
	B.lastname AS employee
FROM 
	Employees M, EMployees B
WHERE 
	M.employeeid = B.reportsTo
	
	
	
-- 5. Find the name and ID of the artists who do not have albums. 
SELECT 
	A.name,
	A.artistid
FROM
	artists A
LEFT JOIN 
	albums Alb
WHERE 
	Alb.albumid IS NULL
-- 6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT 
	C.firstname,
	C.lastname
FROM 
	Customers C 
	
UNION

SELECT
	E.firstname,
	E.lastname
FROM 
	Employees E

ORDER By 
	lastname Desc

