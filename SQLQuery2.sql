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

--- sama Id v��rtusega rida eo saa sisestada
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
-- v��rv�tme �henduse loomine kahe tabeli vahele
alter table Person add constraint tblPerson_Gender
foreign key (GenderId) references Gender(Id)


--- kui sisestad uue rea andmeid ja ei ole sisesta�ud Gender_id all v��rtust
--- see atumaatselt sisestab tabelisse v��rtu 3
alter table Person
add constraint DF_Person_GenderId
default 3 for GenderId

insert into Person (Id, Name, Email, GenderId)
values (9, 'Ironman', 'i@i.com')

select * from Person

---piirangu maha v�tmine
alter table Person
drop constraint DF_Person_GenderId

--- lisame uue veeru
alter table Person
add Age nvarchar(10)

--- lisame vanuse piirangu sisestamisel 
--- ei saa lisada suuremat v��rtust kui 801
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

--k�ik kes elvad Gothami linnas 
select * from Person where City = 'Gotham'
--k�ik, kes ei ela Gothami linnas 
select * from Person where City != 'Gotham'
--taine variant
select * from Person where not City = 'Gotham'
--kolmas variant 
select * Person where City 'Gotham'

--n�itab teatutud vanusega inimesi 
select * Person where Age = 800 or Age = 35 or Age = 27
select * Person where Age in (800, 35, 27)

--n'itab teatud vanusevahmikus olevaid inimesi
select * form Person where Age between 20 and 35

-- wildcard e n�itab k�ik g-t�hega linnad
select * from Person where City like 'g%'
--- n�itab k�ik emailid, milles on @ m�rk
select * from Person where Email like '%@%'

---n�itab k�iki, kellel ei ole @-m�rki emailis
select * form Person where Email not like '%@%'

---n�itab kellel on emailis ees ja peale @-m�rk
--- ainult �ks t�ht
select * form Person where Email like '_@_.com'


--- k�ik, kellel ei ole nimes esimene t�ht - W, A, C
select * form Person where Name like '[^WAC]%'

--- kes elvadGothamis ja New Yorkis 
Select * form Person where (City = 'Gotham' or City = 'New York')

--- k�ik kes elavad Gothamis ja New Yorkis ning 
--- alla 30 eluaastat
Select * form Person where
(City = 'Gotham' or City = 'New York')
and Age = 30

---kuvab t�hestikukulise j�rjekorras inimesi 
--- ja v�tab aluseks nime 

select * from Person order by Name
--- kuvab vastupidises j�rjekorras 
select * from Person order by Name desc

---v�tab kolm esimest rida
select top 3 * from Person 

--- 2 tund
--- muudab age muutuja int-ks ja n�itab vanulise j�rjekorras
select * from person order by CAST(Age as int)

--- k�ikide isikude koonvanus
select SUM(CAST(Age as int))

-- n�itab k�ike nooremat 
select MIN(CAST(Age as int)) from Person

---n�eme konkreetsetes linnades olevate isikute koondvanust
-- enne oli Age string, aga p�ringu ajal muutsime selle int-ks
select City, SUM(cast(Age as int)) as TotalAge from Person group by City

-- kuidas saab koodiga muuta tabeli andet��pi ja selle pikkust
alter table Person 
alter column Name nvarchar(25)

alter table Person 
alter column Age int

-- kuvab esimese reas v�lja toodud j�rjestuses ja muudab Age-i TotalAge-ks
-- teeb j�rjestuse vaatesse: City, GenderId ja j�rjestab omakorda City veeru
select City, GenderId, SUM(Age) as TotalAge from Person
group by City, GenderId order by City

--- nitab mitu rida on selles tabelis
select COUNT(*) from Person
select * from Person

-- veergude lugemine
select COUNT(*)
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Person'

--- n�itab tulemust mitu inimest GenderId v��rtusega 2 kindlas linnas
--- arbutab kokku vanuse
select GenderId, City, SUM(Age) as TotalAge, COUNT(Id) as [Total Person(s)]
from Person 
where GenderId = '2'
group by GenderId, City

--- n�itab, et mitu inimest on vanemad kui 41 ja kui palju igas linnas
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

select * from Employees