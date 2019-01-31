SELECT *
FROM invoice i
JOIN invoice_line il ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;

SELECT i.InvoiceDate, c.FirstName, c.LastName, i.Total
FROM Invoice i 
JOIN Customer c ON i.CustomerId = c.CustomerId;

SELECT c.FirstName, c .LastName, e.FirstName, e.LastName
FRom Customer c 
JOIN Employee e ON c.SupportRepId = e.EmployeeId;

SELECT al.Title, arName
FROM Album al 
JOIN Artist ar ON al.ArtistId = ar.ArtistId;

SELECT pt.TrackId
FROM PlaylistTrack pt 
JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
WHERE p.Name = 'Music';

SELECT t.NAMESPACE
FROM Track t 
JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
-- WHERE pt.PlaylistId = 5;

SELECT t.name, p.name 
-- FROM Track t 
JOIN PlaylistTrack pt ON t.TrackId = pt.TrackId
JOIN Playlist p ON pt.PlaylistId = p.PlaylistId;

SELECT t.Name, a.title 
FROM Track t 
JOIN Album a ON t.AlbumId = a.AlbumId
JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = "Alternative";



SELECT *
FROM Invoice
WHERE InvoiceId IN ( SELECT InvoiceId FROM InvoiceLine WHERE UnitPrice > 0.99);

SELECT *
FROM PlaylistTrack
WHERE PlaylistId IN ( SELECT PlaylistId FROM Playlist WHERE Name = "Music");

SELECT Name
FROM Track
WHERE TrackId IN (SELECT TrackId FROM PlaylistTrack WHERE PlaylistId = 5 );

SELECT *
FROM Track
WHERE GenreId IN ( SELECT GenreId FROM Genre WHERE Name = "Comedy" );

SELECT *
FROM Tracks
WHERE AlbumId IN ( SELECT AlbumId FROM Album WHERE Title = "Fireball");

SELECT * 
FROM Track
WHERE AlbumId in (
    SELECT AlbumId FROM Album WHERE ArtistId IN (
        SELECT ArtistId FROM Artist WHERE Name = "Queen"
    )
);



UPDATE Customer 
SET FAX = NULL
WHERE FAX IS NOT null;

UPDATE Customer
SET Company = "Self"
WHERE Company IS null;

UPDATE Customer
SET LastName = "Thompson"
WHERE FirstName = "Julia" AND LastName = "Barnett";

UPDATE Customer
SET SupportRepId = 4
WHERE Email = "luisrojas@yahoo.cl";

UPDATE Track
SET Composer = "The darkness around us"
WHERE GenreId = (SELECT GenreId FROM Genre WHERE Name = "Metal")
AND Composer IS null;



SELECT Count(*), g.Name 
FROM Track t 
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name;


SELECT COUNT(*), g.Name 
FROM Track t 
JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = 'Pop' OR g.Name = 'Rock'
GROUP BY g.Name;

SELECT ar.Name, Count(*)
FROM Artist ar 
JOIN Album al ON ar.ArtistIs = al.ArtistId
GROUP BY al.ArtistId;



SELECT DISTINCT Composer
FROM Track;

SELECT DISTINCT BillingPostalCode
FROM Invoice;

SELECT DISTINCT Company
FROM Customer;



DELETE 
FROM practice_delete
WHERE Type = "bronze";

DELETE 
FROM practice_delete
WHERE Type = "silver";

DELETE 
FROM practice_delete
WHERE Value = 150;



-- ecommerce sim

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    name VARCHAR(50),
    price INTEGER
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(id)
)

INSERT INTO users  ( name, email) VALUES ( 'dave', 'devmtnali@gmail.com');
INSERT INTO users  ( name, email) VALUES ( 'timothy', 'aalhaddad1997@gmail.com');
INSERT INTO users  ( name, email) VALUES ( 'ben', 'AQA1997@'); */
 INSERT INTO products  ( name, price) VALUES ( 'Bottle Rocket', 20);
INSERT INTO products  ( name, price) VALUES ( 'Basketball', 10);
INSERT INTO products  ( name, price) VALUES ( 'Football', 8); 
INSERT INTO orders (product_id) VALUES (1);
INSERT INTO orders (product_id) VALUES (2);
INSERT INTO orders (product_id) VALUES (3); 