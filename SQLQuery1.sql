create database Machine

create table Car
(
Id int not null primary key,
Color nvarchar(10),
EnginePower nvarchar(10),
CarTypeId int
)

create table CarType
(
Id int not null primary key,
Type nvarchar(10) not null
)

insert into CarType (Id, Type)
values (1, 'Sport')
insert into CarType (Id, Type)
values (2, 'Sedan')
insert into CarType (Id, Type)
values (3, 'SUV')
insert into CarType (Id, Type)
values (4, 'Coupe')
insert into CarType (Id, Type)
values (5, 'Unknown')

select * from CarType

Insert into Car (Id, Color, EnginePower, CarTypeId)
values (1, 'Black', '300 HP', 1)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (2, 'White', '100 HP', 2)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (3, 'Green', '200 HP', 3)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (4, 'Blue', '150 HP', 4)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (5, 'Black', '100 HP', 4)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (6, 'Yellow', '400 HP', 1)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (7, 'White', '500 HP', 1)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (8, 'Grey', '50 HP', 2)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (9, 'Blue', '75 HP ', 2)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (10, 'Grey', '350 HP', 1)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (11, 'Yellow', '250 HP', 3)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (12, 'White', '125 HP', 4)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (13, 'Red', '450 HP', 1)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (14, 'Red', '275 HP', 1)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (15, 'Brown', '175 HP', 3)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (16, 'Green', '100 HP', 4)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (17, 'Blue', '200 HP', 3)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (18, 'Grey', '75 HP', 2)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (19, 'Grey', '50 HP', 2)
Insert into Car (Id, Color, EnginePower, CarTypeId)
values (20, 'Black', '600 HP', 1)

select * from Car
