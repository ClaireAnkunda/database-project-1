-- Active: 1728572818452@@127.0.0.1@3306@bus_booking
create table Bus_station(
    station_ID INT,
    station_name varchar(40),
    location_name varchar(40),
    Number_platform INT,
    operating_hours INT,
    contact INT,
    primary key(station_ID)
    );
create table Buses(
    bus_ID INT,
    Bus_number INT,
    bus_type varchar(40),
    capacity INT,
    manufacturer varchar(40),
    primary key(bus_ID)
);
create table Routes(
    route_ID INT,
    start_station INT,
    end_station INT,
    total_distance DECIMAL(5, 2),
    travel_time varchar(40),
    route_type varchar(40),
    primary key(route_ID),
    Foreign Key (start_station) REFERENCES Bus_station(station_ID),
    Foreign Key (end_station) REFERENCES Bus_station(station_ID)
);
create table schedules(
    schedule_ID INT,
    route_ID INT,
    bus_ID INT,
    depature_time TIME,
    arrival_time TIME,
    bus_status varchar(40),
    primary key(schedule_ID),
    Foreign Key (route_ID) REFERENCES Routes(route_ID),
    Foreign Key (bus_ID) REFERENCES Buses(bus_ID) 
);
create table Drivers(
    driver_ID INT,
    driver_name varchar(40),
    license_number INT,
    contact INT,
    employment_status varchar(40),
    primary key(driver_ID)
);
create table Tickets(
    ticket_ID INT,
    passenger_name varchar(40),
    route_ID INT,
    bus_ID INT,
    ticket_price varchar(40),
    seat_number INT,
    purchase_date DATE,
    payment_status varchar(40),
    primary key(ticket_ID),
    Foreign Key (route_ID) REFERENCES Routes(route_ID),
    Foreign Key (bus_ID) REFERENCES Buses(bus_ID)
);
create table Passenger(
    passenger_ID INT,
    passenger_name varchar(40),
    email varchar(40),
    primary key(passenger_ID)
);
DESC passenger;
SELECT * FROM passenger;
ALTER TABLE routes MODIFY total_distance VARCHAR(40);

insert into bus_station VALUES('1','north station','city A','5','24','65434789');
insert into bus_station VALUES('2','south station','city B','10','12','65489011');
insert into bus_station VALUES('3','east station','city C','6','10','65422005');
insert into bus_station VALUES('4','west station','city D','25','12','65433399');
insert into bus_station VALUES('5','southeast station','city E','7','24','65422890');
insert into bus_station VALUES('6','northwest station','city F','17','14','65433889');

insert into buses VALUES('11','410','standard','64','toyota');
insert into buses values('12','411','standard','60','volvo');
insert into buses values('13','412','electric','48','yutong');
insert into buses VALUES('14','413','double decker','76','scania');
insert into buses values('15','414','standard','60','scania');
insert into buses VALUES('16','415','electric','60','mercedes');
insert into buses values('17','416','double decker','74','tesla');
insert into buses VALUES('9','417','standard','60','Isuzu');

insert into routes VALUES('1','1','2','10km','2 hours','local');
insert into routes values('2','2','3','50km','2 hrs and 30mins','local');
insert into routes VALUES('3','3','4','80km','2hrs and 45mins','highway');
insert into routes VALUES('4','4','5','70km','3hours','express');
insert into routes values('5','5','6','100km','3hours','express');

insert into schedules VALUES('1','1','1','10:20','6:00','on time');
insert into schedules values('2','2','2','10:40','11:00','on time');
insert into schedules VALUES('3','3','3','6:20','8:15','delayed');
insert into schedules VALUES('4','4','4','5:40','7:00','cancelled');
insert into schedules VALUES('5','5','5','11:00','11:10','on time');

insert into  drivers VALUES('1','Bob kizito','0001','256774410','active');
insert into drivers VALUES('2','Mark williams','0002','256789012','active');
insert into drivers VALUES('3','Ian lukwago','0003','256745900','active');
insert into drivers VALUES('4','John Musiima','0004','256784491','active');
insert into drivers VALUES('5','George Ham','0005','256745332','leave');

insert into tickets VALUES('1','Kirabo Trisha','1','1','70,000ugx','06','2024-10-01','paid');
insert into tickets VALUES('2','Mirundi Dilan','2','2','100,000ugx','03','2024-10-11','paid');
insert into tickets values('3','Bayinzi Gloria','3','3','50,000ugx','010','2024-10-15','pending');
insert into tickets VALUES('4','Murungi Anita','4','4','60,000ugx','08','2024-09-28','paid');
insert into tickets VALUES('5','Alinda Shawn','5','5','200,000ugx','016','2024-10-19','pending');

insert into passenger VALUES('1','Kirabo Tisha','kirabotrisha@gmail.com');
insert into passenger VALUES('2','Achieng Estella','achiengestella@gmail.com');
insert into passenger VALUES('3','Murungi Anita','murungianita@gmail.com');
insert into passenger VALUES('4','kasolo Linda','kasololinda@gmail.com');
insert into passenger VALUES('5','Atulinda Chris','atulindachris@gmail.com');
insert into passenger VALUES('6','luwede Millan','luwedemillian@gmail.com');
insert into passenger VALUES('7','Wendi Yusuf','wendiyusuf@gmail.com');
insert into passenger VALUES('8','Birungi Mark','birungimark@gmail.com');
insert into passenger VALUES('9','Tugume Ivan','tugumeivan@gmail.com');
insert into passenger VALUES('10','Hadin Shine','hadinshine@gmail.com');
SELECT*FROM passenger;
DELETE FROM buses WHERE `bus_ID`='17';