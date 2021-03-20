/* STORED PROCEDURE
-------------------------

QUERY EXECUTION PHASES

1 - Syntax check (Parsing)
2 - Name Resolution (Binding)
3 - Compile
4 - Execution plan --> Buffer Pool (Plan Chache)
5 - Execute

*/


-- Stored procedure that Updates product price as given parameter
create procedure uspProductPriceUpdate

(@ProductID int, @Total decimal(18,2))
as begin 
	update Production.Product
	set ListPrice = ListPrice + @Total
	where ProductID = @ProductID

	select Name, Color, ListPrice
	from Production.Product
	where ProductID = @ProductID
end

exec uspProductPriceUpdate 1, 3333