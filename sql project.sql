create database hotel;
use hotel;

CREATE TABLE Guests (
    guest_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255)
);
select*from guests;


-- Rooms Table
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Available'
);
select*from rooms;

-- Bookings Table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT,
    room_id INT,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
); select*from bookings;


-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
); select*from Payments;



INSERT INTO Guests (full_name, email, phone, address) VALUES
('Aarav Sharma', 'aarav.sharma@gmail.com', '9876501234', 'Delhi, India'),
('Isha Mehta', 'isha.mehta@gmail.com', '9823405678', 'Mumbai, India'),
('Rohan Verma', 'rohan.verma@gmail.com', '9898701122', 'Bengaluru, India'),
('Priya Kapoor', 'priya.kapoor@gmail.com', '9812304567', 'Chennai, India'),
('Vikram Singh', 'vikram.singh@gmail.com', '9845098765', 'Kolkata, India'),
('Sneha Patil', 'sneha.patil@gmail.com', '9876549876', 'Pune, India'),
('Karan Malhotra', 'karan.malhotra@gmail.com', '9898989898', 'Hyderabad, India'),
('Neha Joshi', 'neha.joshi@gmail.com', '9823456789', 'Ahmedabad, India'),
('Aditya Nair', 'aditya.nair@gmail.com', '9811112233', 'Kochi, India'),
('Simran Kaur', 'simran.kaur@gmail.com', '9877612345', 'Amritsar, India'),
('Gaurav Bansal', 'gaurav.bansal@gmail.com', '9856231470', 'Jaipur, India'),
('Meera Iyer', 'meera.iyer@gmail.com', '9845012345', 'Bengaluru, India'),
('Rahul Deshmukh', 'rahul.deshmukh@gmail.com', '9833456789', 'Nagpur, India'),
('Ananya Reddy', 'ananya.reddy@gmail.com', '9812233445', 'Hyderabad, India'),
('Devendra Kulkarni', 'devendra.kulkarni@gmail.com', '9825678901', 'Pune, India');
select*from guests;

INSERT INTO Rooms (room_number, room_type, price_per_night, status) VALUES
('101', 'Single', 2000.00, 'Available'),
('102', 'Double', 3500.00, 'Available'),
('103', 'Suite', 6000.00, 'Booked'),
('104', 'Single', 2200.00, 'Available'),
('105', 'Double', 3800.00, 'Available'),
('201', 'Suite', 7000.00, 'Maintenance'),
('202', 'Single', 2100.00, 'Booked'),
('203', 'Double', 4000.00, 'Available'),
('204', 'Suite', 7500.00, 'Available'),
('301', 'Single', 2300.00, 'Available'),
('302', 'Double', 3900.00, 'Booked'),
('303', 'Suite', 8000.00, 'Available'),
('401', 'Penthouse', 15000.00, 'Available'),
('402', 'Single', 2500.00, 'Available'),
('403', 'Double', 4200.00, 'Maintenance');

select*from rooms;


INSERT INTO Bookings (guest_id, room_id, check_in, check_out) VALUES
(1, 1, '2025-09-10', '2025-09-12'),
(2, 3, '2025-09-15', '2025-09-18'),
(3, 2, '2025-09-20', '2025-09-22'),
(4, 5, '2025-09-25', '2025-09-28'),
(5, 7, '2025-09-12', '2025-09-14'),
(6, 6, '2025-09-18', '2025-09-21'),
(7, 8, '2025-09-22', '2025-09-25'),
(8, 9, '2025-09-27', '2025-09-30'),
(9, 10, '2025-10-01', '2025-10-03'),
(10, 11, '2025-10-04', '2025-10-06'),
(11, 12, '2025-10-07', '2025-10-09'),
(12, 13, '2025-10-10', '2025-10-13'),
(13, 14, '2025-10-14', '2025-10-16'),
(14, 15, '2025-10-17', '2025-10-19'),
(15, 4, '2025-10-20', '2025-10-22');
select*from bookings;



INSERT INTO Payments (booking_id, amount, payment_method) VALUES
(1, 4000.00, 'UPI'),
(2, 18000.00, 'Credit Card'),
(3, 7000.00, 'Cash'),
(4, 11400.00, 'UPI'),
(5, 4200.00, 'Cash'),
(6, 21000.00, 'Credit Card'),
(7, 12000.00, 'UPI'),
(8, 22500.00, 'Cash'),
(9, 4600.00, 'Credit Card'),
(10, 7800.00, 'UPI'),
(11, 16000.00, 'Credit Card'),
(12, 24000.00, 'Cash'),
(13, 15000.00, 'UPI'),
(14, 8400.00, 'Credit Card'),
(15, 6600.00, 'Cash');
select*from Payments;


-- update
UPDATE Rooms
SET status = 'Booked'
WHERE room_number = '102';
select*from rooms;

START TRANSACTION;
SELECT * FROM Rooms
WHERE room_id = 5 AND status = 'Available'
FOR UPDATE;

-- Delete 
DELETE from payments
WHERE payment_method = 'credit card';
select*from payments;

select guest_id, UPPER (full_name) as upper_name
from guests;

select guest_id, lower(full_name) as lower_name
from guests;

select full_name,
length(full_name) as name_length
from guests;

-- order by price of room
SELECT *FROM Rooms
ORDER BY price_per_night DESC;

SELECT *FROM Rooms
ORDER BY price_per_night asc;

-- rooms and prices
select room_type,price_per_night
from rooms;

-- rooms total present of each type
select*from rooms;
select room_type, count(room_type)from rooms group by room_type;

-- max payment
select*from payments;
select max(amount) from payments;

select *from payments;
select min(amount) from payments;

-- sum amt
select*from payments;
select sum(amount) from payments;

--  sum only cash
select*from payments;
select sum(amount) from payments where payment_method ='cash';

select*from payments;
select sum(amount) from payments where payment_method ='upi';

-- amt and payment
select amount,payment_method
from payments;



-- order by date
select *from bookings
order by booking_date;



  
  
  -- to show guests booking via 
select g.full_name, p.payment_method
from guests g
join  Bookings b on  g.guest_id = b.guest_id
join payments p on b.booking_id = p.booking_id;



-- guest who have suite
select g.guest_id, g.full_name, g.email, r.room_type
FROM Guests g
JOIN Bookings b on g.guest_id = b.guest_id
JOIN Rooms r on  b.room_id = r.room_id
WHERE r.room_type = 'Suite'
limit 3;


-- amt more than avg by inner join
SELECT b.guest_id, p.amount
FROM Bookings b
JOIN Payments p ON b.booking_id = p.booking_id
WHERE p.amount > (
    SELECT AVG(amount) 
    FROM Payments
);

SELECT r.room_id, r.room_number, b.booking_id
FROM Rooms r
LEFT JOIN Bookings b 
ON r.room_id = b.room_id;

SELECT * 
FROM Guests
WHERE full_name LIKE 'A%';

-- logical operator
SELECT * 
FROM Rooms
WHERE status = 'Available' AND room_type = 'Suite';

SELECT * 
FROM Rooms
WHERE status = 'Available' OR price_per_night < 3000;

-- full join
SELECT *
FROM guests g
LEFT JOIN bookings b
    ON g.guest_id = b.guest_id
UNION
SELECT *
FROM guests g
RIGHT JOIN bookings b
    ON g.guest_id = b.guest_id;
  
  -- types of rooms 
    select count( distinct room_type )from rooms;
    
    SELECT room_type, COUNT(*) AS total_rooms
FROM rooms
GROUP BY room_type;

-- concat to show name and add
select full_name,address,
concat( full_name,'-',address) as details
from guests;

    SELECT 
    UPPER(CONCAT(g.full_name, ' - ', r.room_type))as guest_books
FROM Bookings b
JOIN Guests g ON b.guest_id = g.guest_id
JOIN Rooms r ON b.room_id = r.room_id;


select  g.full_name, g.email, b.check_in,b.check_out
from guests g
join bookings b on g.guest_id = b.guest_id
order by b.check_in desc limit 5;

select  g.full_name, g.email, b.check_in,b.check_out,
rank() over (order by b.check_out) as b_out
from guests g
join bookings b on g.guest_id = b.guest_id
order by b.check_out;

select  g.full_name, g.email, b.check_in,b.check_out,
dense_rank() over (order by b.check_out) as b_out
from guests g
join bookings b on g.guest_id = b.guest_id
order by b.check_out;

select distinct	room_type, status  from rooms where status ='available';












 


