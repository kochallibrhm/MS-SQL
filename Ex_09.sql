/* TABLE EXPRESSIONS
----------------------------

1 - Derived Table (Also known as Subquery) 
	! It is temporary
2 - Common Table Expression (CTE)
	!! Allows recursive
3 - View
4 - Table Valued Function (TVF)

*/

-- Derived Table
select Class, COUNT(*) as Piece
from 
	(
		select Name, Color, ListPrice,
			case when ListPrice between 0 and 1000 then 'Cheap'
				 when ListPrice between 1000 and 2000 then 'MidRange'
				 when ListPrice > 2000 then 'Expensive'
				 else 'Di�er'
			end as Class
		from Production.Product
	 ) as tbl
group by Class
order by Piece


-- Common Table Expression (CTE)
with tbltest
as (
		select Name, Color, ListPrice,
			case when ListPrice between 0 and 1000 then 'Cheap'
				 when ListPrice between 1000 and 2000 then 'MidRange'
				 when ListPrice > 2000 then 'Expensive'
				 else 'Di�er'
			end as Class
		from Production.Product
	) 
select Class, COUNT(*) as Piece
from tbltest
group by Class
order by Piece