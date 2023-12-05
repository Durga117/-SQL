-- 1 --
create database Travego;
show databases;
use Travego;

create table passenger(
Passenger_id int auto_increment primary key,
Passenger_name varchar(20),
Category varchar(20),
Gender varchar(20),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20));

create table price(
id int, 
Bus_type varchar(20), 
Distance int , 
Price int );

insert into Passenger(passenger_id,passenger_name,category,gender,boarding_city,destination_city,distance,bus_type)
values(1, 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
    (2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
    (3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
    (4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
    (5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
    (6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
    (7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
    (8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
    (9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');
    
select * from passenger;

insert into price(id,bus_type,distance,price)
values (1, 'Sleeper', 350, 770),
    (2, 'Sleeper', 500, 1100),
    (3, 'Sleeper', 600, 1320),
    (4, 'Sleeper', 700, 1540),
    (5, 'Sleeper', 1000, 2200),
    (6, 'Sleeper', 1200, 2640),
    (7, 'Sleeper', 1500, 2700),
    (8, 'Sitting', 500, 620),
    (9, 'Sitting', 600, 744),
    (10, 'Sitting', 700, 868),
    (11, 'Sitting', 1000, 1240),
    (12, 'Sitting', 1200, 1488),
    (13, 'Sitting', 1500, 1860);
    
select * from price;

-- 2 --
SELECT *
FROM Passenger
WHERE Gender = 'F' AND Distance >= 600;

SELECT COUNT(*) AS FemalePassengers
FROM Passenger
WHERE Gender = 'F' AND Distance >= 600;

select *
from passenger
where distance > 500 and Bus_type = 'Sleeper';

select *
from passenger
where passenger_name like 'S%';

SELECT 
    P.Passenger_name,
    P.Boarding_City,
    P.Destination_City,
    P.Bus_Type,
    PR.Price
FROM Passenger P
JOIN Price PR ON P.Bus_Type = PR.Bus_Type
WHERE P.Distance > PR.Distance;


SELECT Passenger_name, Price
FROM Passenger P
JOIN Price PR ON P.Bus_Type = PR.Bus_Type
WHERE P.Distance = 1000 AND P.Bus_Type = 'Sitting';


SELECT P.Bus_Type, PR.Price
FROM Passenger P
JOIN Price PR ON P.Bus_Type = PR.Bus_Type
WHERE
    P.Passenger_name = 'Pallavi'
    AND P.Boarding_City = 'Bengaluru'
    AND P.Destination_City = 'Panaji';


set sql_safe_updates = 0;
UPDATE Passenger
SET Category = 'Non-AC'
WHERE Bus_Type = 'Sleeper';

select * from passenger;

delete from passenger
where passenger_name = 'Piyush';

select * from passenger;
commit;


TRUNCATE TABLE Passenger;
select * from passenger;
/* The TRUNCATE TABLE statement removes all rows from a table, effectively resetting the table to an empty state. 
Unlike the DELETE statement, which removes rows one by one and logs each individual deletion, 
TRUNCATE TABLE is more efficient and is usually faster, as it deallocates the data pages rather than deleting rows.
After truncating the table, the number of rows will be zero, and the table will be empty.*/

DROP TABLE Passenger;

