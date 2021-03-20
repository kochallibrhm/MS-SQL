/* Query Commands Writing and Executing Order
--------------------------------------

WRITING ORDER    |  EXECUTING ORDER
----------------------------------------
1-SELECT    .....|		  5
2-FROM    .......|		  1
3-WHERE    ......|		  2
4-GRUOP BY   ....|		  3
5-HAVING    .....|		  4
6-ORDER BY   ....|		  6

*/

select Name as "Product Name", Color as Renk, ListPrice as [List Price]
from Production.Product
where Color='Black'
order by [List Price] asc


/* AGGREGATE FUNCTIONS
----------------------------
SUM() 
MIN()
MAX()
COUNT() --> Null hesaplamaya dahil edilmez!!
AVG()   --> Null hesaplamaya dahil edilmez!!

*/

select SUM(ProductSubcategoryID) as toplam,
	MIN(ProductSubcategoryID) as minimum,
	MAX(ProductSubcategoryID) as maksimum,
	COUNT(ProductSubcategoryID) as adet,
	AVG(ProductSubcategoryID) as ortalama,
	COUNT(*) as adet2,
	SUM(ProductSubcategoryID) / COUNT(*) as ortalama2,
	AVG(ISNULL(ProductSubcategoryID, 0)) as ortalama3
from Production.Product

    
-- How many product is there for each color
select Color, COUNT(*) as adet
from Production.Product
group by Color

-- How many address register is there for each city
select City, COUNT(*) as adet
from Person.Address
group by City

-- Min, max and avg price values of each color
select Color, MAX(ListPrice) as "Max Price", MIN(ListPrice) as "Min Price", AVG(ListPrice) as "Average Price"
from Production.Product
group by Color

-- Sum of 'Subtotal' for each year
select  YEAR(OrderDate) as "Year", SUM(SubTotal) as "Total"
from Sales.SalesOrderHeader
group by YEAR(OrderDate)
order by YEAR(OrderDate)

-- Sum of 'Subtotal' above 5 Million for each month of each year
select YEAR(OrderDate) as "Year", MONTH(OrderDate) as "Month", SUM(SubTotal) as Total
from Sales.SalesOrderHeader
group by YEAR(OrderDate), MONTH(OrderDate)
having SUM(SubTotal) >= 5000000
order by "Year" asc, "Month" asc


-- Customers who order at least 50000$ at a time and total over 5000000$ orders
select  CustomerID as "Customer ID", SUM(SubTotal) as "Total"
from Sales.SalesOrderHeader
where SubTotal >= 50000
group by SalesOrderHeader.CustomerID
having SUM(SubTotal) > 500000
order by Total