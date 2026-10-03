create database if not exists insurence;

USE insurence;

Create table Person(
    driver_id  varchar(30) ,
    name varchar(30) not null, 
    address varchar(100),
    
    primary key(driver_id)
    );
    

describe Person;

insert into Person values
("id1" ,"suresh" ,"banglore"),
("id2" ,"ramesh" ,"mysore"),
("id3" ,"mahesh" ,"manglore");

select * from Person;

alter table Person add column phone_num int;

update Person set phone_num=123 where driver_id="id1";
ALTER table Person drop column phone_num;

alter table car modify model varchar(30) not null;

Create table car(
   reg_num varchar(30) primary key ,
   model char(30) not null,
   year int 
    );
    
    
    
Create table owns(
   driver_id  varchar(30), 
   reg_num varchar(30),
   
   primary key(driver_id,reg_num),
   foreign key(driver_id) references Person(driver_id),
   foreign key(reg_num) references car(reg_num)
   );
    
Create table Accident(
   report_num varchar(30),
   accident_date date,
   location char(30),
   
   primary key(report_num,accident_date,location)
   );    
   
Create table participated(
    driver_id  varchar(30),
    reg_num varchar(30),
	report_num varchar(30),
    damage_amount int,
    
    primary key(driver_id,reg_num,report_num),
    
    foreign key(driver_id) references Person(driver_id), 
    foreign key(reg_num) references car(reg_num), 
    foreign key(report_num) references Accident(report_num)
   );  
   
select * from participated; 

insert into car values
("KA7","BMW" ,2030),
("KA15","Porsche",2035),
("KA19","Mercedes",2040);



insert into Accident values
(12 ,"2003-01-01" , "Mysore"),
(15 ,"2004-04-05" , "banglore"),
(19 ,"2005-11-09" , "manglore");



insert into participated values
("id1" ,"KA7",12,10000),
("id2","KA15",15,25000),
("id3","KA19",19,35000);



insert into owns values
("id1" ,"KA7"),
("id2","KA15"),
("id3","KA19");


select * from participated;
select * from car;
select * from owns;


update participated set damage_amount=10000 where reg_num="KA7" and report_num=12;

update participated set damage_amount=25000 where reg_num="KA15";

select * from participated;

alter table Accident add column new_accident varchar(30); -- 5

select accident_date ,location from Accident; -- 6


select * from participated
where damage_amount >= 25000;           -- 7