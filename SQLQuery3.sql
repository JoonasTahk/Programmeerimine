-- kommentaar
-- teeme andmebaasi e db

-- databasei loomine
create database TARpe22


-- db kustutamine
drop database TARpe22

-- tabeli loomine
create table Gender
(
Id int not null primary key,
gender nvarchar(10) not null
)

---- anmete sisestamine
insert into Gender (Id, Gender)
values (2, 'Male')
insert into Gender (Id, Gender)
values (1, 'Female')
insert into Gender (Id, Gender)
values (3, 'Unknown')

--- sama Id väärtusega rida eo saa sisestada
select * from Gender

--- teeme uue tabeli
create table Person
(
    Id int not null primary key,
	Name nvarchar(30),
	Email nvarchar(30),
	GenderId int
)

--- vaatame Person tabeli sisu
select * from Person

--- andmete sisestamine
insert into Person (Id, Name, Email, GenderId)
values (1, 'Superman', 's@s.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (2, 'Womane', 'w@w.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (3, 'Batman', 'b@b.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (4, 'Aquaman', 'a@a.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (5, 'Catwomane', 'c@c.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (6, 'Antman', 'ant@.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (8, NULL, NULL, 2)

select * from Person
-- võõrvõtme ühenduse loomine kahe tabeli vahele
alter table Person add constraint tblPerson_Gender
foreign key (GenderId) references Gender(Id)


--- kui sisestad uue rea andmeid ja ei ole sisestañud Gender_id all väärtust
--- see atumaatselt sisestab tabelisse väärtu 3
alter table Person
add constraint DF_Person_GenderId
default 3 for GenderId

insert into Person (Id, Name, Email, GenderId)
values (9, 'Ironman', 'i@i.com')

select * from Person

---piirangu maha võtmine
alter table Person
drop constraint DF_Person_GenderId

--- lisame uue veeru
alter table Person
add Age nvarchar(10)

--- lisame vanuse piirangu sisestamisel 
--- ei saa lisada suuremat väärtust kui 801
alter table Person
add constraint Ck_Person_Age check (Age 0 and Age 801) 

--- rea kustutamine
delete from Person where Id = 9

select * from Person

-- kuidas uuendada anmeid tabelis
uptade Person
set Age = 50
where Id = 1

--- lisame juurde uue veeru
alter table Person
add City nvarchar(50)

--kõik kes elvad Gothami linnas 
select * from Person where City = 'Gotham'
--kõik, kes ei ela Gothami linnas 
select * from Person where City != 'Gotham'
--taine variant
select * from Person where not City = 'Gotham'
--kolmas variant 
select * Person where City 'Gotham'

--näitab teatutud vanusega inimesi 
select * Person where Age = 800 or Age = 35 or Age = 27
select * Person where Age in (800, 35, 27)

--n'itab teatud vanusevahmikus olevaid inimesi
select * form Person where Age between 20 and 35

-- wildcard e näitab kõik g-tähega linnad
select * from Person where City like 'g%'
--- näitab kõik emailid, milles on @ märk
select * from Person where Email like '%@%'

---näitab kõiki, kellel ei ole @-märki emailis
select * form Person where Email not like '%@%'

---näitab kellel on emailis ees ja peale @-märk
--- ainult üks täht
select * form Person where Email like '_@_.com'


--- kõik, kellel ei ole nimes esimene täht - W, A, C
select * form Person where Name like '[^WAC]%'

--- kes elvadGothamis ja New Yorkis 
Select * form Person where (City = 'Gotham' or City = 'New York')

--- kõik kes elavad Gothamis ja New Yorkis ning 
--- alla 30 eluaastat
Select * form Person where
(City = 'Gotham' or City = 'New York')
and Age = 30

---kuvab tähestikukulise järjekorras inimesi 
--- ja võtab aluseks nime 

select * from Person order by Name
--- kuvab vastupidises järjekorras 
select * from Person order by Name desc

---võtab kolm esimest rida
select top 3 * from Person 

--- 2 tund
--- muudab age muutuja int-ks ja näitab vanulise järjekorras
select * from person order by CAST(Age as int)

--- kõikide isikude koonvanus
select SUM(CAST(Age as int))

-- näitab kõike nooremat 
select MIN(CAST(Age as int)) from Person

---näeme konkreetsetes linnades olevate isikute koondvanust
-- enne oli Age string, aga päringu ajal muutsime selle int-ks
select City, SUM(cast(Age as int)) as TotalAge from Person group by City

-- kuidas saab koodiga muuta tabeli andetüüpi ja selle pikkust
alter table Person 
alter column Name nvarchar(25)

alter table Person 
alter column Age int

-- kuvab esimese reas välja toodud järjestuses ja muudab Age-i TotalAge-ks
-- teeb järjestuse vaatesse: City, GenderId ja järjestab omakorda City veeru
select City, GenderId, SUM(Age) as TotalAge from Person
group by City, GenderId order by City

--- nitab mitu rida on selles tabelis
select COUNT(*) from Person
select * from Person

-- veergude lugemine
select COUNT(*)
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Person'

--- näitab tulemust mitu inimest GenderId väärtusega 2 kindlas linnas
--- arbutab kokku vanuse
select GenderId, City, SUM(Age) as TotalAge, COUNT(Id) as [Total Person(s)]
from Person 
where GenderId = '2'
group by GenderId, City

--- näitab, et mitu inimest on vanemad kui 41 ja kui palju igas linnas
select GenderId, City, SUM(Age) as TotalAge, COUNT(Id) as [Total Person(s)]
from Person 
where GenderId = '2'
group by GenderId, City having SUM(Age) > 41

--- loome uue tabelid
create table Deparment
(
Id int primary key,
DeparmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar (50)
)

create table Employees
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(50),
Salary nvarchar(50),
DepartmentId int
)

insert into Employees(Id, Name, Gender, Salary, DepartmentId)
values (1, 'Tom', 'Male', 4000, 1)
insert into Employees(Id, Name, Gender, Salary, DepartmentId)
values (2, 'Pam', 'Female', 3000, 3)
insert into Employees(Id, Name, Gender, Salary, DepartmentId)
values (3, 'Pam', 'Female', 3500, 1)
insert into Employees(Id, Name, Gender, Salary, DepartmentId)
values (4, 'Sam', 'Male', 4500, 2)
insert into Employees(Id, Name, Gender, Salary, DepartmentId)
values (5, 'Todd', 'Male', 2800, 2)
insert into Employees(Id, Name, Gender, Salary, DepartmentId)
values (6, 'Ben', 'Male', 7000, 1)
insert into Employees(Id, Name, Gender, Salary, DepartmentId)
values (7, 'Sara', 'Female', 4800, 3)
insert into Employees(Id, Name, Gender, Salary, DepartmentId)
values (8, 'Valarie', 'Female', 5500, 1)
insert into Employees(Id, Name, Gender, Salary, DepartmentId)
values (9, 'James', 'Male', 6500, NULL)
insert into Employees(Id, Name, Gender, Salary, DepartmentId)
values (10, 'Russell', 'Male', 8800, NULL)

insert into Deparment), Id Deparmentname, Location, DeprtmentHead)
values
(1, 'IT', 'London', 'Rick')
(2, 'Payroll', 'Delhi', 'Ron')
(3, 'Hr', 'New York', 'Cristie')
(4, 'Other Department', 'Sydney', 'Cinderella')

alter table Employees
add City nvarchar(30)

--- ühe kuu pagalafond linnade lõikes
select City, SUM(CAST(Salary as int)) as TotalSalary
From Employees
group by city, Gemder
order by City

--- loeb ära mitu inimest on nimekirjas
Select COUNT(*) from Employees

--- vaatame, mitu töötajat on soo ja linna kaupa
select Gender, City. SUM(CAST(Salary as int)) as TotalSalary,
COUNT (Id) as [Total Empleyees(s)]
from Employees
group by Gender, City

-- näitada kõiki mehi linnade kaupa
select Gender, City. SUM(CAST(Salary as int)) as TotalSalary,
COUNT (Id) as [Total Empleyees(s)]
from Employees
where Gender = 'Male'
group by Gender, City

--- näitab ainult kõik naised Linnade kaupa
select Gender, City. SUM(CAST(Salary as int)) as TotalSalary,
COUNT (Id) as [Total Empleyees(s)]
from Employees
group by Gender. City
having Gender = 'Female'

--- vigane päring
select * from Employees where SUM(CAST(Salary as int)) > 4000

---töötav päring
select * from Employees where SUM(CAST(Salary as int)) as [Total Salary],
COUNT (Id) as [Total Empleyees(s)]
from Employees group buy Gender, City
having SUM(CAST(Salary as int)) > 4000

--- loome tabeli milles hakatakse automaatselt umertama id-d
create table Test1
(
Id int identity(1,1),
value nvarchar(20)
)

insert into Test1 values('X')
select * from Test1

-- inner join 
-- kuvab neid, kellel on DeparmentName all olemas väärtus
select Name, Gender, Salary, DeparmentName
from Employees
inner join Deparment
on Employees.DepartmentId = Deparment.Id

--- left join 
--- kuidas saada kõik andmed Employees-st kätte 
select Name, Gender, Salary, DeparmentName
from Employees
left join Deparment
on Employees.DepartmentId = Deparment.Id


---right join
select Name, Gender, Salary, DeparmentName
from Employees
right join Deparment
on Employees.DepartmentId = Deparment.Id

--- outer join
select Name, Gender, Salary, DeparmentName
from Employees
full outer join Deparment
on Employees.DepartmentId = Deparment.Id

--- cross join
select Name, Gender, Salary, DeparmentName
from Employees
cross join Deparment

--- kuidas kuvada ainult need isikud , kellel on Departemnt NULL
select Name, Gender, Salary, DeparmentName
from Employees
left join Deparment
on Employees.DepartmentId = Deparment.Id
Where Employees.DepartmentId is null

--- teine variant
select Name, Gender, Salary, DeparmentName
from Employees
left join Deparment
on Employees.DepartmentId = Deparment.Id
where Deparment.Id is null

--- kuidas saame deprtment tabelis oleva rea kus on null
select Name, Gender, Salary, DeparmentName
from Employees
left join Deparment
on Employees.DepartmentId = Deparment.Id
where Employees.DepartmentId is null

--- full join 
select Name, Gender, Salary, DeparmentName
from Employees
full join Deparment
on Employees.DepartmentId = Deparment.Id
where Employees.DepartmentId is null
or Deparment.Id is null

select * from dbo.DimEmployee

--- tahan teada saada, mis tähendab SalesTerritoryKey DimEmployee tabelis 
--- inner join
select FirstName, LastName, SalesTerritoryRegion, SalesTerritoryGroup, SalesTerritoryCountry
from dbo.DimEmployee
inner join dbo.DimSalesTerritory
on DimSalesTerritory.SalesTerritoryKey = DimEmployee.SalesTerritoryKey

--- left join 
select FirstName, LastName, SalesTerritoryRegion, SalesTerritoryGroup, SalesTerritoryCountry
from dbo.DimEmployee
left join dbo.DimSalesTerritory
on DimSalesTerritory.SalesTerritoryKey = DimEmployee.SalesTerritoryKey
order by SalesTerritoryCountry

--- right join
select EnglishProductName, SpanishProductName, FrenchProductName, DealerPrice
from dbo.DimProduct
right join dbo.DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
order by EnglishProductName

--- outer join
select FirstName, LastName, Title, SalesAmount, OrderQuantity
from dbo.FactResellerSales
Full outer join dbo.DimEmployee
on FactResellerSales.EmployeeKey = DimEmployee.EmployeeKey
Order by Title desc

--- cross join 
select FirstName, LastName, Title, SalesAmount, OrderQuantity
from dbo.FactResellerSales
cross join dbo.DimEmployee

--- left join is null
select FirstName, LastName, Title, SalesAmount, OrderQuantity
from dbo.FactResellerSales
Full outer join dbo.DimEmployee
on FactResellerSales.EmployeeKey = DimEmployee.EmployeeKey
where dbo.FactResellerSales.DueDate is null

--- full join
select FirstName, LastName, Title, SalesAmount, OrderQuantity
from dbo.FactResellerSales
full join dbo.DimEmployee
on FactResellerSales.EmployeeKey = DimEmployee.EmployeeKey
where dbo.FactResellerSales.DueDate is null
or DueDate is null
