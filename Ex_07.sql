/* SET OPERATORS
-------------------

1 - UNION ALL
2 - UNION (WORKS WITH HIDDEN DISTINCT)
3 - INTERSECT
4 - EXCEPT (A-B)


1 - Number of columns must be equal
2 - Also these equal number of columns' data type must be the same

*/

-- EXCEPT sample
select *
from Person.PersonPhone
where PhoneNumber like '%-%-%'
EXCEPT
select * 
from Person.PersonPhone 
where PhoneNumber like '___-___-____'

-- INTERSECT sample
select *
from Person.PersonPhone
where PhoneNumber like '%-%-%'
INTERSECT
select * 
from Person.PersonPhone 
where PhoneNumber like '___-___-____'

-- UNION ALL sample
select *
from Person.PersonPhone
where PhoneNumber like '%-%-%'
UNION ALL
select * 
from Person.PersonPhone 
where PhoneNumber like '___-___-____'

-- UNION sample
select *
from Person.PersonPhone
where PhoneNumber like '%-%-%'
UNION ALL
select * 
from Person.PersonPhone 
where PhoneNumber like '___-___-____'

-- Explicit Conversion
select Name, ISNULL(Color, 'Colorless'), ListPrice,
ISNULL(CAST(ProductModelID as nvarchar), 'NoModel'),
ISNULL(CONVERT(nvarchar, ProductModelID), 'NoModel')
from Production.Product

select OrderDate,
CONVERT(nvarchar, OrderDate, 104),
CONVERT(nvarchar, OrderDate, 105),
CONVERT(nvarchar, OrderDate, 112),
CONVERT(nvarchar, OrderDate, 130),
CONVERT(nvarchar, OrderDate, 131)
from Sales.SalesOrderHeader