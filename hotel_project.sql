create database hotel_reservation_db;
use hotel_reservation_db;

create table guests (
    guest_id varchar(20) primary key,
    guest_name varchar(100) not null,
    city varchar(50),
    guest_type varchar(20),
    preferred_room_type varchar(20),
    loyalty_tier varchar(20),
    account_since date
);
create table hotels (
    hotel_id varchar(20) primary key,
    hotel_name varchar(100) not null,
    city varchar(50),
    star_rating int,
    total_rooms int,
    opened_date date
);

create table rooms (
    room_id varchar(20) primary key,
    hotel_id varchar(20) not null,
    room_type varchar(20),
    floor_number int,
    max_occupancy int,
    price_per_night decimal(10,2),
    is_active varchar(3),
    constraint fk_rooms_hotel foreign key (hotel_id)references hotels(hotel_id)
);

create table bookings (
    booking_id varchar(20) primary key,
    guest_id varchar(20) not null,
    hotel_id varchar(20) not null,
    booking_date date,
    room_type_requested varchar(20),
    booking_channel varchar(30),
    nights_booked int,
    total_amount decimal(12,2),
    constraint fk_bookings_guest foreign key (guest_id)references guests(guest_id),
    constraint fk_bookings_hotel foreign key (hotel_id)references hotels(hotel_id)
);
create table staff (
    staff_id varchar(20) primary key,
    staff_name varchar(100) not null,
    hire_date date,
    rating decimal(3,2),
    department varchar(30),
    is_active varchar(3)
);

create table stays (
    stay_id varchar(20) primary key,
    booking_id varchar(20) not null,
    room_id varchar(20) not null,
    staff_id varchar(20) not null,
    check_in_date date,
    check_out_date date,
    status varchar(20),
    nights_stayed int,
    service_requests int,
    stay_duration_hrs int,
    constraint fk_stays_booking foreign key (booking_id)references bookings(booking_id),
    constraint fk_stays_room foreign key (room_id)references rooms(room_id),
    constraint fk_stays_staff foreign key (staff_id)references staff(staff_id)
);





select count(*) from guests;
select count(*) from hotels;
select count(*) from staff;
select count(*) from rooms;
select count(*) from bookings;
select count(*) from stays;

-- ----------------------Section-1.4-----------------------------------
-- Question-1:
-- From "guests" table we use "guest_id,guest_name" columns.
-- From "bookings" table we use "booking_id,guest_id" columns.
-- Question-2:
-- From "stays" table we use "stay_id,booking_id,check_in_date,check_out_date,status" columns.
-- Question-3:
-- From "guests" table we use "guest_id,guest_name,guest_type" columns.
-- From "bookings" table we use "booking_id,guest_id,booking_date,nights_booked,total_amount" columns.
-- Question-4:
-- From "bookings" table we use "booking_id,booking_channel,nights_booked,total_amount" columns.
-- From "stays" table we use "booking_id,nights_stayed" columns.
-- Question-5:
-- From "staff" table we use "staff_id,staff_name,department,rating" columns.
-- From "stays" table we use "stay_id,staff_id,status" columns.
-- Question-6:
-- From "rooms" table we use "room_id,room_type" columns.
-- From "stays" table we use "stay_id,room_id,nights_stayed,stay_duration_hrs" columns.
-- Question-7:
-- From "hotels" table we use "hotel_id,hotel_name,city,star_rating" columns.
-- From "bookings" table we use "booking_id,hotel_id,booking_date,nights_booked,total_amount" columns.
-- Question-8:
-- From "rooms" table we use "room_id,room_type,max_occupancy" columns.
-- From "stays" table we use "stay_id,room_id,service_requests,stay_duration_hrs" columns.
-- Question-9:
-- From "bookings" table we use "booking_id,booking_channel" columns.
-- From "stays" table we use "stay_id,booking_id,status,nights_stayed,check_in_date,check_out_date" columns.
-- Question-10:
-- From "guests" table we can use "guest_id,guest_name,guest_type" columns.
-- From "bookings" table we can use "booking_id,guests_id,hotel_id,booking_date,booking_channel,room_type_requested,nights_booked,total_amount" columns.
-- From "stays" table we can use "stay_id,booking_id,room_id,staff_id,check_in_date,check_out_date,status,nights_stayed,service_requests" columns.

-- ----------------------Section-3-----------------------------------
-- Question-1:
select count(*) as guest_cnt from guests;
-- Question-2:
select count(*) as bookings_count from bookings;
-- Question-3:
select count(*) as stays_count from stays;
-- Question-4:
select distinct room_type from rooms;
-- Question-5:
select count(staff_id) as staff_count from staff where is_active='Yes';
-- Question-6:
select distinct booking_channel from bookings;
-- Question-7:
select sum(total_amount) as ttl_amt from bookings;
-- Question-8:
select avg(nights_booked) as avg_ngts from bookings;

-- ----------------------Section-4.1-----------------------------------
-- Question-1:
select h.hotel_id,h.hotel_name,count(b.booking_id) as total_bookings from hotels h join bookings b on h.hotel_id = b.hotel_id group by h.hotel_id, h.hotel_name order by total_bookings desc;
-- Question-2:
select booking_channel,count(booking_id) as total_bookings from bookings group by booking_channel order by total_bookings desc;
-- Question-3:
select room_type_requested,count(booking_id) as book_cnt from bookings group by room_type_requested order by book_cnt desc;
-- Question-4:
select booking_date,count(booking_id) as total_bookings from bookings group by booking_date order by booking_date;
-- Question-5:
select year(booking_date) as booking_year,month(booking_date) as booking_month,count(booking_id) as total_bookings from bookings group by year(booking_date), month(booking_date) order by booking_year, booking_month;

-- ----------------------Section-4.2-----------------------------------
-- Question-1:
select g.guest_id, g.guest_name,count(b.booking_id) as total_bookings from guests g join bookings b on g.guest_id = b.guest_id group by g.guest_id, g.guest_name order by total_bookings desc;
-- Question-2:
select g.guest_id, g.guest_name,count(b.total_amount) as ttl_amt from guests g join bookings b on g.guest_id = b.guest_id group by g.guest_id, g.guest_name order by ttl_amt desc limit 1;
-- Question-3:
select g.guest_id,g.guest_name,h.hotel_name,b.booking_date,b.total_amount from bookings b join guests g on b.guest_id=g.guest_id join hotels h on b.hotel_id=h.hotel_id;
 -- Question-4:
 select g.guest_type,count(b.booking_id) as total_bookings,sum(b.nights_booked) as total_nights_booked,sum(b.total_amount) as total_booking_amount from guests g join bookings b on g.guest_id = b.guest_id group by g.guest_type;
 -- Question-5:
 select year(booking_date) as booking_year,month(booking_date) as booking_month,count(booking_id) as total_bookings,sum(total_amount) as total_booking_amount from bookings group by year(booking_date), month(booking_date) order by booking_year, booking_month;

-- ----------------------Section-4.3-----------------------------------
-- Question-1:
select b.hotel_id,s.status,count(s.stay_id) as total_stays from bookings b join stays s on b.booking_id = s.booking_id group by b.hotel_id, s.status;
-- Question-2:
select avg(nights_stayed) as average_nights, avg(stay_duration_hrs) as average_duration_hours from stays;
-- Question-3:
select status, count(stay_id) as total_stays from stays group by status;
-- Question-4:
select h.hotel_id,h.hotel_name,b.nights_booked,h.star_rating from hotels h join bookings b on h.hotel_id=b.hotel_id order by b.nights_booked desc,h.star_rating asc; 
-- Question-5:
select year(check_in_date) as year,month(check_in_date) as month,count(stay_id) as total_stays from stays group by year(check_in_date), month(check_in_date) order by year, month;

-- ----------------------Section-4.4-----------------------------------
-- Question-1:
select stf.staff_id,stf.staff_name,count(stay_id) as stays_cnt from staff stf join stays sty on stf.staff_id=sty.staff_id group by stf.staff_id,stf.staff_name;
-- Question-2:
select st.staff_name, s.status,count(s.stay_id) as total_stays from staff st join stays s on st.staff_id = s.staff_id group by st.staff_name, s.status order by st.staff_name;
-- Question-3:
select st.staff_id,st.staff_name,sum(sy.stay_duration_hrs) as total_duration_inHrs from staff st join stays sy on st.staff_id=sy.staff_id group by  st.staff_id,st.staff_name;
-- Question-4:
select room_type,sum(max_occupancy) as occupaid_rooms from rooms group by room_type;
-- Question-5:
select r.room_id,r.room_type,count(s.stay_id) as total_stays,avg(s.nights_stayed) as average_nights,sum(s.service_requests) as total_service_requests from rooms r join stays s on r.room_id = s.room_id group by r.room_id,r.room_type order by total_stays desc;

-- ----------------------Section-4.5-----------------------------------
-- Question-1:
select b.booking_id, b.hotel_id,b.booking_date,s.status from bookings b join stays s on b.booking_id = s.booking_id where s.status in ('Cancelled', 'No-show');
-- Question-2:xz
select status,count(stay_id) as total_stays from stays group by status order by total_stays desc;
-- Question-3:
select s.stay_id,b.booking_id,b.room_type_requested,s.service_requests,b.total_amount from stays s join bookings b on s.booking_id=b.booking_id order by service_requests desc;
-- Question-4:
select h.hotel_id,h.hotel_name,sum(s.status = 'Cancelled') as cancelled,sum(s.status = 'No-show') as no_show from hotels h join bookings b on h.hotel_id = b.hotel_id join stays s on b.booking_id = s.booking_id group by h.hotel_id, h.hotel_name order by cancelled,no_show;