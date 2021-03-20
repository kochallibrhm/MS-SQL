/* CRUD Transactions
-------------------------

CREATE
UPDATE
DELETE

*/

-- Creating table

create table dbo.Orders(
	OrderId int primary key identity(1,1),
	Salary decimal(18,2) not null,
	OrderDate datetime2,
	CustomerID int foreign key references dbo.Customer(CustomerID)
)

select * from dbo.Customer
select * from dbo.Orders

-- Adding data to table that we created before
insert into dbo.Orders(OrderDate, Salary, CustomerID)
values (GETDATE(), 7500.55, 1),
	   (GETDATE(), 3400.65, 3),
	   (GETDATE(), 5500.75, 4),
	   (GETDATE(), 1500.45, 3)

-- Update
update dbo.Orders
set Salary = Salary * 1.1 
where OrderId = 4

update dbo.Orders
set Salary = Salary * 1.5
where Salary < 2000


-- Delete
delete from dbo.Orders
where OrderId = 2

delete from dbo.Customer
where CustomerID = 6