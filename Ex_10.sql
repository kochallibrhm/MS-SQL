/*
FUNCTIONS
-------------------

SELECT ......... (Scalar Function)
FROM ........... (Table Valued Function)
WHERE .......... (Scalar Function)
GROUP BY ....... (Scalar Function)
HAVING ......... (Scalar Function)
ORDER BY ....... (Scalar Function)

*/

-- Table Valued Function Sample
create function fnGetProductwithColor
(
@Color nvarchar(50)
)
returns table
as
	return select Name, Color, ListPrice
			from Production.Product
			where Color = @Color


select *
from fnGetProductwithColor('white')


-- Func that gets particular number of sales with parameter. (Table Valued Function Sample)
create function fnGetProduct
(
@CustomerID int,
@Number int
)
returns table
as
	return select top (@Number) CustomerID, OrderDate, SalesOrderID, SubTotal
			from Sales.SalesOrderHeader
			where CustomerID = @CustomerID
			order by OrderDate desc
			

select * from fnGetProduct(11019, 5)