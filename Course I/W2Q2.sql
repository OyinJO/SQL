/*
All of the questions in this quiz refer to the open source Chinook Database: 
*/

--1) Find all the tracks that have a length of 5,000,000 milliseconds or more.

SELECT 
	trackid,
	milliseconds
FROM 
	tracks
WHERE
	milliseconds >= 5000000
	
--2) Return all the invoices whose total is between $5 and $15 dollars.
SELECT
	invoiceid,
	total
FROM 
	invoices 
WHERE 
	total between 5 and 15
	
--3) Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
SELECT 
	firstname,
	lastname,
	state
FROM 
	customers 
WHERE 
	state in('RJ','DF', 'AB', 'BC', 'CA', 'WA', 'NY')
	
--4) Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
SELECT 
	customerid,
	total,
	invoiceid,
FROM 
	invoices
WHERE 
	customerid in(56,58) and total between 1 and 5
	
--5) Find all the tracks whose name starts with 'All'.
SELECT
	count(name)
FROM 
	tracks
WHERE
	name like 'All%'
	
--6) Find all the customer emails that start with "J" and are from gmail.com.
SELECT 
	email
FROM 
	customers
WHERE 
	email like 'j%@gmail.com'
	
--7) Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
SELECT
	billingcity,
	invoiceid
FROM 
	invoices
WHERE
	billingcity in ('Brasília', 'Edmonton', 'Vancouver')
ORDER BY 
	invoiceid desc

--8) Show the number of orders placed by each customer and sort the result by the number of orders in descending order.
SELECT
	customerid,
	count(customerid) as num_ords
FROM 
	invoices
GROUP BY 
	customerid
ORDER BY 
	num_ords desc

--9) Find the albums with 12 or more tracks.
SELECT
	albumid,
	count(albumid) as freq_album
FROM
	tracks
GROUP BY 
	albumid
HAVING 
	freq_album >=12
