
# AIRLINE RESERVATION SYSTEM
------------------------------

create database project;
use project;

create table flights (
    flightid int primary key auto_increment,
    airlinename varchar(100),
    source varchar(100),
    destination varchar(100),
    departuretime datetime,
    arrivaltime datetime,
    totalseats int
);

create table customers (
    customerid int primary key auto_increment,
    fullname varchar(100),
    email varchar(100),
    phonenumber varchar(15),
    passportnumber varchar(50)
);
create table bookings (
    bookingid int primary key auto_increment,
    customerid int,
    flightid int,
    bookingdate date,
    status varchar(20),  -- e.g., 'booked', 'cancelled'
    foreign key (customerid) references customers(customerid),
    foreign key (flightid) references flights(flightid)
);
create table seats (
    seatid int primary key auto_increment,
    flightid int,
    seatnumber varchar(10),
    isbooked boolean default false,
    bookingid int default null,
    foreign key (flightid) references flights(flightid),
    foreign key (bookingid) references bookings(bookingid)
);

insert into flights (airlinename, source, destination, departuretime, arrivaltime, totalseats) values
('IndiGo', 'Delhi', 'Mumbai', '2025-07-10 08:00:00', '2025-07-10 10:00:00', 180),
('Air India', 'Mumbai', 'Delhi', '2025-07-11 09:30:00', '2025-07-11 11:45:00', 200),
('SpiceJet', 'Delhi', 'Kolkata', '2025-07-12 06:00:00', '2025-07-12 09:00:00', 160),
('Vistara', 'Bangalore', 'Hyderabad', '2025-07-13 15:00:00', '2025-07-13 17:00:00', 170),
('GoAir', 'Delhi', 'Mumbai', '2025-07-14 10:00:00', '2025-07-14 12:15:00', 180),
('Akasa Air', 'Kolkata', 'Delhi', '2025-07-15 13:00:00', '2025-07-15 15:30:00', 150),
('IndiGo', 'Chennai', 'Goa', '2025-07-16 07:00:00', '2025-07-16 09:30:00', 140),
('SpiceJet', 'Ahmedabad', 'Delhi', '2025-07-17 19:00:00', '2025-07-17 21:00:00', 175),
('Air India', 'Delhi', 'Chennai', '2025-07-18 05:00:00', '2025-07-18 07:30:00', 160),
('GoAir', 'Mumbai', 'Goa', '2025-07-19 20:00:00', '2025-07-19 22:00:00', 155),
('Vistara', 'Hyderabad', 'Delhi', '2025-07-20 11:00:00', '2025-07-20 13:30:00', 190),
('IndiGo', 'Delhi', 'Pune', '2025-07-21 06:00:00', '2025-07-21 08:00:00', 165),
('Air India', 'Pune', 'Mumbai', '2025-07-22 09:00:00', '2025-07-22 10:15:00', 150),
('SpiceJet', 'Mumbai', 'Chennai', '2025-07-23 15:00:00', '2025-07-23 17:00:00', 145),
('GoAir', 'Chennai', 'Delhi', '2025-07-24 12:00:00', '2025-07-24 14:30:00', 160),
('Akasa Air', 'Delhi', 'Kolkata', '2025-07-25 16:00:00', '2025-07-25 19:00:00', 170),
('IndiGo', 'Delhi', 'Jaipur', '2025-07-26 06:00:00', '2025-07-26 07:00:00', 100),
('Air India', 'Ahmedabad', 'Goa', '2025-07-27 14:00:00', '2025-07-27 16:30:00', 175),
('SpiceJet', 'Goa', 'Mumbai', '2025-07-28 09:00:00', '2025-07-28 10:00:00', 160),
('GoAir', 'Delhi', 'Lucknow', '2025-07-29 08:00:00', '2025-07-29 09:00:00', 140);

insert into customers (fullname, email, phonenumber, passportnumber) values
('Rahul Sharma', 'rahul@gmail.com', '9876543210', 'P1234567'),
('Aditi Verma', 'aditi@gmail.com', '9123456780', 'P2345678'),
('Vikram Mehta', 'vikram@gmail.com', '9988776655', 'P3456789'),
('Sneha Roy', 'sneha@gmail.com', '9090909090', 'P4567890'),
('Ankit Das', 'ankit@gmail.com', '9000011111', 'P5678901'),
('Neha Singh', 'neha@gmail.com', '9112233445', 'P6789012'),
('Arjun Reddy', 'arjun@gmail.com', '9870011223', 'P7890123'),
('Pooja Nair', 'pooja@gmail.com', '9988007766', 'P8901234'),
('Karan Malhotra', 'karan@gmail.com', '9871234567', 'P9012345'),
('Isha Khan', 'isha@gmail.com', '9865321470', 'P0123456'),
('Yash Sinha', 'yash@gmail.com', '9822012345', 'P1112223'),
('Meera Patel', 'meera@gmail.com', '9810012346', 'P2223334'),
('Rohan Bhat', 'rohan@gmail.com', '9876054321', 'P3334445'),
('Jaya Menon', 'jaya@gmail.com', '9898098765', 'P4445556'),
('Saurav Das', 'saurav@gmail.com', '9801234567', 'P5556667'),
('Reena Dey', 'reena@gmail.com', '9832145678', 'P6667778'),
('Deepak Rao', 'deepak@gmail.com', '9856234567', 'P7778889'),
('Alia Sen', 'alia@gmail.com', '9845123456', 'P8889990'),
('Mohit Jain', 'mohit@gmail.com', '9812312312', 'P9990001'),
('Tina Kapoor', 'tina@gmail.com', '9833332211', 'P0001112');

insert into bookings (customerid, flightid, bookingdate, status) values
(1, 1, '2025-07-01', 'booked'),
(2, 1, '2025-07-01', 'booked'),
(3, 1, '2025-07-02', 'cancelled'),
(4, 2, '2025-07-02', 'booked'),
(5, 2, '2025-07-03', 'booked'),
(6, 2, '2025-07-03', 'booked'),
(7, 3, '2025-07-04', 'booked'),
(8, 3, '2025-07-04', 'cancelled'),
(9, 3, '2025-07-04', 'booked'),
(10, 4, '2025-07-05', 'booked'),
(11, 4, '2025-07-05', 'booked'),
(12, 5, '2025-07-06', 'booked'),
(13, 5, '2025-07-06', 'booked'),
(14, 5, '2025-07-06', 'cancelled'),
(15, 6, '2025-07-07', 'booked'),
(16, 6, '2025-07-07', 'booked'),
(17, 7, '2025-07-08', 'booked'),
(18, 8, '2025-07-09', 'booked'),
(19, 9, '2025-07-09', 'cancelled'),
(20, 10, '2025-07-10', 'booked');

insert into seats (flightid, seatnumber, isbooked, bookingid) values
(1, '1A', true, 1),
(1, '1B', true, 2),
(1, '1C', false, null),
(2, '2A', true, 4),
(2, '2B', true, 5),
(2, '2C', true, 6),
(3, '3A', true, 7),
(3, '3B', false, null),
(3, '3C', true, 9),
(4, '4A', true, 10),
(4, '4B', true, 11),
(5, '5A', true, 12),
(5, '5B', true, 13),
(5, '5C', false, null),
(6, '6A', true, 15),
(6, '6B', true, 16),
(7, '7A', true, 17),
(8, '8A', true, 18),
(9, '9A', false, null),
(10, '10A', true, 20);
select * from seats;


# available seats in the flights( not booked yet)
select s.seatnumber, f.flightid, f.airlinename, f.source, f.destination from seats s
join flights f on s.flightid = f.flightid
where s.isbooked = false;

# avaialable seats for specific flight
select seatnumber from seats
where flightid = 1 and isbooked = false;

# flights by destination
select * from flights
where source = 'Delhi' and destination = 'Mumbai';
 
# flights on range of date
select * from flights
where departuretime between '2025-07-10' and '2025-07-20';

# flights with available seats
select distinct f.flightid, f.airlinename, f.source, f.destination, f.departuretime from flights f
join seats s on f.flightid = s.flightid where s.isbooked = false;

# trigger - auto updation on seat status when ticket is canceled
delimiter //
create trigger cancel_booking_trigger
after update on bookings
for each row
begin
  if new.status = 'cancelled' then
    update seats
    set isbooked = false,
        bookingid = null
    where bookingid = new.bookingid;
  end if;
end //
delimiter ;

# customers booking history
select c.fullname, c.email, b.bookingid, f.airlinename, f.source, f.destination, b.status
from customers c
join bookings b on c.customerid = b.customerid
join flights f on b.flightid = f.flightid
order by c.customerid;

# number of bookings per flight
select f.flightid, f.airlinename, f.source, f.destination, count(b.bookingid) as total_bookings
from flights f
left join bookings b on f.flightid = b.flightid
group by f.flightid;

# booking counts with their status 
select status, count(*) as count
from bookings
group by status;

# VIEW for available flights
create view available_flights as
select distinct f.flightid, f.airlinename, f.source, f.destination, f.departuretime
from flights f
join seats s on f.flightid = s.flightid
where s.isbooked = false;

select * from available_flights where source = 'Delhi';




