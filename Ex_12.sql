/* TRIGGER
----------------------
A trigger is a special type of stored procedure that automatically runs when an event occurs in the database server.
*/

create trigger trg_TarihGuncelle
on Production.Product
after update
as
begin
	update p
	set p.ModifiedDate = GETDATE()
	from Production.Product as p inner join inserted as i
	on p.productid = i.productid
end