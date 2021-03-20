select *
from Production.Product

select Name, Color, ListPrice
from Production.Product

-- Comment
/* Multi
   Line
   Comment  */

-- the products that list prices' is 0
select Name, Color, ListPrice
from Production.Product 
where ListPrice = 0

-- the products that last prices' is not 0
select Name, Color, ListPrice
from Production.Product 
where ListPrice != 0

-- the products that last prices' is between 1000, 2000
select Name, Color, ListPrice
from Production.Product
where ListPrice between 1000 and 2000
--where ListPrice >= 1000 and ListPrice <= 2000

-- the products that colors' is black
select Name, Color, ListPrice
from Production.Product
where Color = 'Black'

-- the products that colors' is black or red and price > 1000
select Name, Color, ListPrice
from Production.Product
where ListPrice > 1000 and (Color = 'Black' or Color = 'Red')

-- the products that colors' is black or red or yellow or blue
select Name, Color, ListPrice
from Production.Product
where Color IN ('Black', 'Red', 'Yellow', 'Blue')
-- where Color = 'Black' or Color = 'Red' or Color = 'Yellow' or Color = 'Blue'

-- the products that colors' is not black or red or yellow or blue
select Name, Color, ListPrice
from Production.Product
where Color not IN ('Black', 'Red', 'Yellow', 'Blue')

-- the products that colors' is not black or red or yellow or blue or null
select Name, Color, ListPrice
from Production.Product
where Color NOT IN ('Black', 'Red', 'Blue', 'Yellow') or color is null

-- orders between '2012-01-01' and '2013-01-01'
select *
from Sales.SalesOrderHeader
-- where YEAR(OrderDate) = 2012
where OrderDate >= '2012-01-01' and Orderdate < '2013-01-01'