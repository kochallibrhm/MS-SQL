/* SUBQUERY
-------------------------------

SELECT ......			 ]
FROM ........			 ]> Static query
WHERE COLUMNNAME = 'xyz' ]

SELECT ......				]
FROM ........				]
WHERE COLUMNNAME = (		]
	 	SELECT COLUMNNAME	]
		FROM ...........	]>  Dynamic query
	)						]
........					]
........					]
........					]

1 - The query that must be executed first must be written in parentheses.
2 - The column filtered in the where part of the query outside the parenthesis
	and the column returned from the select of the query in the parenthesis must be of the same data type.
3 - The "=" operator can only compare one value. In queries returning more than one row in parentheses, 
	"in" command is used instead of the "=" operator.

*/


select *
from Sales.SalesOrderHeader
where OrderDate = (
	select MAX(OrderDate)
	from Sales.SalesOrderHeader
)

-- Products have price that higher than avgerage price
select *
from Production.Product
where Product.ListPrice > (
	select AVG(ListPrice)
	from Production.Product
)

-- The products that have same color with most expensive product
select *
from Production.Product where Production.Product.Color IN (
	select Color
	from Production.Product
	where ListPrice = (
		select MAX(ListPrice)
		from Production.Product
		)
)

-- The Customers that has no order
select *
from Sales.Customer
where CustomerID NOT IN (
	select CustomerID
	from Sales.SalesOrderHeader
	)