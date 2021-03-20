/* LIKE
---------------
% --> Reperesents amount of 0 or more than 0 character
_ --> Represents only 1 character

*/

--The following SQL statement selects all persons with a LastName starts with "k":
select *
from Person.Person
where LastName LIKE 'k%'

--The following SQL statement selects all persons with a LastName ending with "k":
select *
from Person.Person
where LastName LIKE '%k'

--The following SQL statement selects all persons with a LastName with "k" is 3rd letter from last:
select *
from Person.Person
where LastName LIKE '%k__'


select *
from Person.PersonPhone
where PhoneNumber like '%-%-%'

-- xxx-xxx-xxxx format phonenumber
select *
from Person.PersonPhone
where PhoneNumber like '___-___-____'

-- How many separate color in Colors column
select distinct Color
from Production.Product

select distinct Color, Size
from Production.Product

-- if is price 0-1000 product is cheap,  if is price 1000-2000 product is midrange, if is price above 2000 product is expensive
select Name, Color, ListPrice,
	case when ListPrice between 0 and 1000 then 'Cheap'
		 when ListPrice between 1000 and 2000 then 'MidRange'
		 when ListPrice > 2000 then 'Expensive'
		 else 'Di�er'
	end as Class
from Production.Product

select Name, Color, ListPrice,
	case when Color = 'Black' then N'Siyah'
		 when Color = 'Yellow' then N'Sar�'
		 when Color = 'Blue' then N'Mavi'
		 when Color = 'Grey' then N'Gri'
		 when Color = 'Multi' then N'�oklu'
		 when Color = 'Red' then N'K�rm�z�'
		 when Color = 'Silver' then N'G�m��'
		 when Color = 'White' then N'Beyaz'
		 when Color = 'Silver/Black' then N'G�m��/Siyah'
		 else 'Null'
	end as Renkler
from Production.Product