/* WORLD DATABASE QUESTION */

/* Easy Questions */

-- Question 1
SELECT name FROM country WHERE continent = 'South America';

-- Question 2  
SELECT Population 
FROM country 
WHERE Name = 'Germany';

-- Question 3 
SELECT city.Name 
FROM city 
JOIN country ON city.CountryCode = country.Code
WHERE country.Name = 'Japan';

-- note to self: the join lets you combine two different databases on one column through foreign key in one table and primary key in other 

  /* Medium Questions */
  
  -- Question 1  
  SELECT Name, Population
FROM country
WHERE Continent = 'Africa'
ORDER BY Population DESC
LIMIT 3;

-- Question 2 
SELECT Name, LifeExpectancy, Population
FROM country
Where Population BETWEEN 1000000 and 5000000;

-- Question 3 
SELECT Language 
FROM countrylanguage
Where Language = 'French';


/* CHINOOK DATABASE QUESTION */

/* Easy Questions */

-- Question 1 
SELECT Album.Title
FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
WHERE Artist.Name = 'AC/DC';

-- Question 2 
SELECT FirstName, LastName, Country, Email
From Customer
Where Country = "Brazil";

-- Question 3 
SELECT Name
From Playlist;

/* Medium Questions */

-- Question 1
SELECT COUNT(*) AS TotalTracks
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Rock';

-- Question 2
SELECT FirstName, LastName
FROM Employee
WHERE ReportsTo = 2;  

-- Question 3 
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSales
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId, Customer.FirstName, Customer.LastName
ORDER BY TotalSales DESC;


/* CREATE YOUR OWN DATABASE */
-- Create the Authors table
CREATE TABLE Authors (
    AuthorId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Country VARCHAR(100)
);

-- Create the Books table
CREATE TABLE Books (
    BookId INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    Genre VARCHAR(100),
    AuthorId INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId)
);

-- Create the Sales table
CREATE TABLE Sales (
    SaleId INT PRIMARY KEY AUTO_INCREMENT,
    BookId INT,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (BookId) REFERENCES Books(BookId)
);
 
 -- Insert data into Authors table
INSERT INTO Authors (FirstName, LastName, Country)
VALUES 
('George', 'Orwell', 'United Kingdom'),
('J.K.', 'Rowling', 'United Kingdom'),
('Harper', 'Lee', 'United States'),

-- Insert data into Books table
INSERT INTO Books (Title, Genre, AuthorId, Price)
VALUES 
('1984', 'Dystopian', 1, 20),
('Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 2, 15),
('To Kill a Mockingbird', 'Classic', 3, 10),

-- Insert data into Sales table
INSERT INTO Sales (BookId, Quantity, TotalAmount)
VALUES 
(1, 2, 20),
(2, 1, 15),
(3, 3, 10),

-- WRITE QUERIES TO GET THINGS 
-- 1  
SELECT Books.Title, Authors.FirstName, Authors.LastName
FROM Books
JOIN Authors ON Books.AuthorId = Authors.AuthorId
WHERE Authors.Country = 'United Kingdom';

--  2 
SELECT Books.Title, SUM(Sales.TotalAmount) AS TotalRevenue
FROM Sales
JOIN Books ON Sales.BookId = Books.BookId
GROUP BY Books.Title;

-- 3  
SELECT Books.Genre, SUM(Sales.Quantity) AS TotalBooksSold
FROM Sales
JOIN Books ON Sales.BookId = Books.BookId
GROUP BY Books.Genre;


  




   


 
