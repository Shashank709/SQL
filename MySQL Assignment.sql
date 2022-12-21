Assignment MySQL


SHOW DATABASES;
CREATE DATABASE sales_data ;
USE Sales_data ;
CREATE table SalesPeople
(
		 Snum INT NOT NULL PRIMARY KEY UNIQUE,
		 Sname VARCHAR(100) UNIQUE,
		City VARCHAR(100),
		Comm INT
		
	);
SELECT * FROM SalesPeople;
INSERT INTO SalesPeople (Snum,Sname,City,Comm)
VALUES
(1001, 'Peel', 'London', 12),
(1002, 'Serres','Sanjose' ,13),
(1004, 'Motika', 'London', 11),
(1007,'Rifkin', 'Barcelona' ,15),
(1003, 'Axelrod', 'Newyork', 10);

CREATE TABLE Customers
(		Cnum INT NOT NULL PRIMARY KEY UNIQUE,
		Cname VARCHAR(100),
        City VARCHAR(100) NOT NULL,
        Snum INT 
);
INSERT INTO Customers (Cnum,Cname,City,Snum)
VALUES
(2001, 'Hoffman', 'London', 1001),
(2002, 'Giovanni', 'Rome', 1003),
(2003, 'Liu', 'Sanjose', 1002),
(2004, 'Grass', 'Berlin', 1002),
(2006, 'Clemens', 'London', 1001),
(2008, 'Cisneros', 'Sanjose', 1007),
(2007, 'Pereira', 'Rome', 1004);
CREATE TABLE Orders
(		Onum INT UNIQUE,
		Amt DECIMAL, 
        Odate DATE,
        Cnum INT,
        Snum INT
);
INSERT INTO Orders (Onum, Amt, Odate, Cnum, Snum)
VALUES 
(3001, 18.69, '1990-10-3', 2008, 1007),
(3003, 767.19, '1990-10-3', 2001, 1001),
(3002, 1900.10, '1990-10-3', 2007, 1004),
(3005, 5160.45, '1990-10-3', 2003, 1002),
(3006,  1098.16, '1990-10-3', 2008, 1007),
(3009, 1713.23, '1990-10-4', 2002, 1003),
(3007,  75.75, '1990-10-4', 2004, 1002),
(3008,  4273.00, '1990-10-5', 2006, 1001),
(3010,  1309.95, '1990-10-6', 2004, 1002),
(3011,  9891.88, '1990-10-6', 2006, 1001);

result tables

SELECT * FROM SalesPeople;

SalesPeople			
				
Snum	Sname	City	Comm	
1007	Rifkin	Barcelona	15	
1004	Motika	London	11	
1003	Axelrod	Newyork	10	
1002	Serres	Sanjose	13	
1001	Peel	London	12	
				

SELECT * FROM Orders;

Orders				
				
Onum	Amt	Odate	Cnum	Snum
3001	19	03-10-1990	2008	1007
3003	767	03-10-1990	2001	1001
3002	1900	03-10-1990	2007	1004
3005	5160	03-10-1990	2003	1002
3006	1098	03-10-1990	2008	1007
3009	1713	04-10-1990	2002	1003
3007	76	04-10-1990	2004	1002
3008	4273	05-10-1990	2006	1001
3010	1310	06-10-1990	2004	1002
3011	9892	06-10-1990	2006	1001


SELECT * FROM Customers;
				
Customers			
				
Cnum	Cname	City	Snum	
2001	Hoffman	London	1001	
2002	Giovanni	Rome	1003	
2003	Liu	Sanjose	1002	
2004	Grass	Berlin	1002	
2006	Clemens	London	1001	
2007	Pereira	Rome	1004	
2008	Cisneros	Sanjose	1007	
				


Q.1 Count the number of Salesperson whose name begin with ‘a’/’A’.
SELECT COUNT(*) FROM salespeople

WHERE Sname LIKE 'a%'
	OR Sname LIKE 'A%';
Q.2  Display all the Salesperson whose all orders worth is more than Rs. 2000.
SELECT Sname,Amt
FROM 
	orders as O
	inner join	salespeople as Sp on O.snum = Sp.snum
WHERE 
	O.Amt > 2000;

SELECT * FROM orders WHERE Amt>2000;
Q.3  Count the number of Salesperson belonging to Newyork.
SELECT COUNT(*) AS 	Salesperson_From_Newyork FROM Salespeople
	WHERE City = 'newyork' OR City = 'Newyork';

Q4. Display the number of Salespeople belonging to London and belonging to Paris.
    SELECT Count(Sname) FROM SalesPeople
	WHERE City = 'London' OR City = 'paris';
  
Q5.Display the number of orders taken by each Salesperson and their date of orders.
 SELECT Sname,
		count(*) as number_of_orders ,
		Odate
 FROM salespeople as sp
	inner join orders as oo on oo.Snum = sp.Snum
group by Sname,
		 Odate




