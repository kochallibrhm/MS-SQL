
-- Order by (Orders by price)

-- best practice for order by
select Name, ProductID, Color, ListPrice
from Production.Product
order by ListPrice desc --asc for down to up

-- should not be preferred
select Name, ProductID, Color, ListPrice
from Production.Product
order by 4 desc --asc for down to up

-- best practice
select Name, ProductID, Color, ListPrice
from Production.Product
order by ListPrice, ProductID desc --asc for small to large

-- most expensive 10 product
select top (10) Name, Color, ListPrice
from Production.Product
order by ListPrice desc

-- cheapest 10 product
select top (10) Name, Color, ListPrice
from Production.Product
order by ListPrice asc

-- cheapest %10 of all products
select top (10) percent Name, Color, ListPrice
from Production.Product
order by ListPrice asc

-- adds the ties that has same price with last one
select top (3) with ties Name, Color, ListPrice
from Production.Product
order by ListPrice desc

-- server side paging
select Name, Color, ListPrice
from Production.Product
order by ListPrice desc
offset 20 rows fetch next 20 rows only
