/* JOINS
----------------

1 - INNER JOIN
2 - OUTHER JOIN
		a - LEFT OUTHER JOIN
		b - RIGHT OUTHER JOIN
		c - FULL OUTHER JOIN (L + R - I)
3 - CROSS JOIN

*/ 

-- Inner Join
select * from Sales.SalesOrderHeader
select * from Sales.SalesTerritory   --> These tables are going to join

select soh.OrderDate as Date, soh.SubTotal as Total, st.Name as Name
from Sales.SalesOrderHeader as soh inner join Sales.SalesTerritory as st
on soh.TerritoryID = st.TerritoryID

-- Product name, color, price and model name (with inner join)
select p.Name as Name, p.Color as Color, p.ListPrice as Price, pm.Name as "Model Name"
from Production.Product as p inner join Production.ProductModel as pm
on p.ProductModelID = pm.ProductModelID


select * from Production.ProductCategory
select * from Production.ProductSubcategory
select * from Production.Product --> 504 rows
select * from Production.ProductModel --> 128 rows

-- Product name, color, price, category, subcategory and model name 
select p.Name as Name, p.Color as Color, p.ListPrice as Price, psc.Name as SubCategory, pc.Name as Category, pm.Name as ModelName
from Production.Product as p inner join Production.ProductModel as pm
on p.ProductModelID = pm.ProductModelID
inner join Production.ProductSubCategory as psc 
on psc.ProductSubcategoryID = p.ProductSubcategoryID
inner join Production.ProductCategory as pc 
on pc.ProductCategoryID = psc.ProductCategoryID

-- Left join sample (gets all products with or without modelname [could be null!])
select p.Name as Name, p.Color as Color, p.ListPrice as Price, pm.Name as "Model Name"
from Production.Product as p left join Production.ProductModel as pm
on p.ProductModelID = pm.ProductModelID

-- Right join sample 
select p.Name as Name, p.Color as Color, p.ListPrice as Price, pm.Name as "Model Name"
from Production.Product as p right join Production.ProductModel as pm
on p.ProductModelID = pm.ProductModelID

-- Full join sample
select p.Name as Name, p.Color as Color, p.ListPrice as Price, pm.Name as "Model Name"
from Production.Product as p full join Production.ProductModel as pm
on p.ProductModelID = pm.ProductModelID

-- Cross join sample
select p.Name as Name, p.Color as Color, p.ListPrice as Price, pm.Name as "Model Name"
from Production.Product as p cross join Production.ProductModel as pm

-- FirstName, LastName, Email, Phone
select p.FirstName as Name, p.LastName as LastName, pea.EmailAddress as Email, pp.PhoneNumber as PhoneNumber
from Person.Person as p inner join Person.EmailAddress as pea
on p.BusinessEntityID = pea.BusinessEntityID
inner join Person.PersonPhone as pp
on p.BusinessEntityID = pp.BusinessEntityID

-- Creating query with query designer
SELECT        pc.Name AS [Category Name], psc.Name AS [Sub Category Name], p.Name AS [Product Name], p.Color AS [Product Color], pm.Name AS [Model Name], p.ListPrice AS [List Price]
FROM            Production.Product AS p INNER JOIN
                         Production.ProductModel AS pm ON p.ProductModelID = pm.ProductModelID INNER JOIN
                         Production.ProductSubcategory AS psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID INNER JOIN
                         Production.ProductCategory AS pc ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE        (p.Color = N'Black') OR
                         (p.Color = N'Red')
ORDER BY [Category Name], [Sub Category Name], [Product Name], [List Price]