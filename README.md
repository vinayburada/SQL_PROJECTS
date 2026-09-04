# 🏨 Hotel Reservation Database & SQL Analysis Project

## 📌 Project Overview

The **Hotel Reservation Database & SQL Analysis Project** is a relational database project developed using **MySQL** to manage and analyze hotel reservation data.

The project simulates a real-world hotel reservation system where information about **guests, hotels, rooms, bookings, staff, and stays** is stored in different relational tables.

The main objective of this project is to use SQL to:

* Design a relational database
* Create tables and relationships
* Store and manage hotel reservation data
* Perform data exploration
* Analyze bookings and guest behavior
* Analyze hotel and room performance
* Analyze staff performance
* Analyze stay status and cancellations
* Generate meaningful business insights using SQL queries

---

# 🎯 Project Objectives

The major objectives of this project are:

1. Create a structured hotel reservation database.
2. Understand relationships between multiple tables.
3. Use Primary Keys and Foreign Keys.
4. Perform basic SQL data exploration.
5. Use aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`.
6. Use `GROUP BY` and `ORDER BY` for analysis.
7. Use different types of SQL `JOIN` operations.
8. Perform date-based analysis using `YEAR()` and `MONTH()`.
9. Analyze customer booking behavior.
10. Analyze hotel and room performance.
11. Analyze staff workload and performance.
12. Identify cancelled and no-show bookings.
13. Generate business-oriented insights from reservation data.

---

# 🛠️ Technologies Used

* **MySQL**
* **SQL**
* **Git**
* **GitHub**

---

# 🗂️ Database Name

```sql
CREATE DATABASE hotel_reservation_db;

USE hotel_reservation_db;
```

---

# 🏗️ Database Structure

The database contains **6 main tables**:

```text
                    ┌──────────────┐
                    │    GUESTS    │
                    └──────┬───────┘
                           │
                           │ guest_id
                           ▼
                    ┌──────────────┐
                    │   BOOKINGS   │
                    └──────┬───────┘
                           │
                           │ booking_id
                           ▼
                    ┌──────────────┐
                    │    STAYS     │
                    └───┬────┬─────┘
                        │    │
                 room_id│    │staff_id
                        ▼    ▼
                 ┌────────┐ ┌────────┐
                 │ ROOMS  │ │ STAFF  │
                 └───┬────┘ └────────┘
                     │
                     │ hotel_id
                     ▼
                 ┌─────────┐
                 │ HOTELS  │
                 └─────────┘
```

---

# 📊 Database Tables

## 1. Guests

The `guests` table stores information about hotel customers.

### Important Columns

| Column                | Description             |
| --------------------- | ----------------------- |
| `guest_id`            | Unique guest identifier |
| `guest_name`          | Guest name              |
| `city`                | Guest's city            |
| `guest_type`          | Type/category of guest  |
| `preferred_room_type` | Preferred room type     |
| `loyalty_tier`        | Guest loyalty level     |
| `account_since`       | Account creation date   |

Primary Key:

```sql
guest_id
```

---

## 2. Hotels

The `hotels` table stores information about hotels.

| Column        | Description             |
| ------------- | ----------------------- |
| `hotel_id`    | Unique hotel identifier |
| `hotel_name`  | Hotel name              |
| `city`        | Hotel location          |
| `star_rating` | Hotel star rating       |
| `total_rooms` | Total rooms             |
| `opened_date` | Hotel opening date      |

Primary Key:

```sql
hotel_id
```

---

## 3. Rooms

The `rooms` table stores information about hotel rooms.

| Column            | Description                |
| ----------------- | -------------------------- |
| `room_id`         | Unique room identifier     |
| `hotel_id`        | Hotel associated with room |
| `room_type`       | Type of room               |
| `floor_number`    | Floor number               |
| `max_occupancy`   | Maximum number of guests   |
| `price_per_night` | Room price per night       |
| `is_active`       | Room availability status   |

Primary Key:

```sql
room_id
```

Foreign Key:

```sql
hotel_id → hotels.hotel_id
```

---

## 4. Bookings

The `bookings` table stores reservation information.

| Column                | Description                |
| --------------------- | -------------------------- |
| `booking_id`          | Unique booking identifier  |
| `guest_id`            | Guest who made the booking |
| `hotel_id`            | Booked hotel               |
| `booking_date`        | Booking date               |
| `room_type_requested` | Requested room type        |
| `booking_channel`     | Booking source/channel     |
| `nights_booked`       | Number of nights booked    |
| `total_amount`        | Total booking amount       |

Primary Key:

```sql
booking_id
```

Foreign Keys:

```sql
guest_id → guests.guest_id
hotel_id → hotels.hotel_id
```

---

## 5. Staff

The `staff` table stores hotel employee information.

| Column       | Description             |
| ------------ | ----------------------- |
| `staff_id`   | Unique staff identifier |
| `staff_name` | Staff member name       |
| `hire_date`  | Hiring date             |
| `rating`     | Staff rating            |
| `department` | Staff department        |
| `is_active`  | Active/inactive status  |

Primary Key:

```sql
staff_id
```

---

## 6. Stays

The `stays` table stores information about actual hotel stays.

| Column              | Description                |
| ------------------- | -------------------------- |
| `stay_id`           | Unique stay identifier     |
| `booking_id`        | Related booking            |
| `room_id`           | Room used                  |
| `staff_id`          | Staff responsible for stay |
| `check_in_date`     | Check-in date              |
| `check_out_date`    | Check-out date             |
| `status`            | Stay status                |
| `nights_stayed`     | Actual nights stayed       |
| `service_requests`  | Number of service requests |
| `stay_duration_hrs` | Stay duration in hours     |

Primary Key:

```sql
stay_id
```

Foreign Keys:

```sql
booking_id → bookings.booking_id
room_id → rooms.room_id
staff_id → staff.staff_id
```

---

# 🔗 Table Relationships

The database uses **Primary Key and Foreign Key relationships** to maintain data integrity.

### Guests → Bookings

One guest can make multiple bookings.

```text
guests.guest_id
        ↓
bookings.guest_id
```

### Hotels → Rooms

One hotel can contain multiple rooms.

```text
hotels.hotel_id
        ↓
rooms.hotel_id
```

### Hotels → Bookings

A hotel can receive multiple bookings.

```text
hotels.hotel_id
        ↓
bookings.hotel_id
```

### Bookings → Stays

A booking can be associated with a stay.

```text
bookings.booking_id
        ↓
stays.booking_id
```

### Rooms → Stays

A room can be used for multiple stays over time.

```text
rooms.room_id
        ↓
stays.room_id
```

### Staff → Stays

A staff member can handle multiple stays.

```text
staff.staff_id
        ↓
stays.staff_id
```

---

# 🔑 SQL Concepts Used

This project covers several important SQL concepts.

### Database & Table Creation

```sql
CREATE DATABASE
CREATE TABLE
```

### Constraints

```sql
PRIMARY KEY
FOREIGN KEY
NOT NULL
```

### Data Retrieval

```sql
SELECT
```

### Filtering

```sql
WHERE
```

### Removing Duplicates

```sql
DISTINCT
```

### Aggregate Functions

```sql
COUNT()
SUM()
AVG()
```

### Grouping

```sql
GROUP BY
```

### Sorting

```sql
ORDER BY
```

### Limiting Results

```sql
LIMIT
```

### Joining Tables

```sql
JOIN
```

### Date Functions

```sql
YEAR()
MONTH()
```

### Conditional Analysis

```sql
IN
```

---

# 🔍 Section 1 — Data Exploration

The first stage of the project focuses on understanding the available data.

For example:

```sql
SELECT COUNT(*) FROM guests;
SELECT COUNT(*) FROM hotels;
SELECT COUNT(*) FROM staff;
SELECT COUNT(*) FROM rooms;
SELECT COUNT(*) FROM bookings;
SELECT COUNT(*) FROM stays;
```

These queries help determine the number of records available in each table.

---

# 📈 Section 2 — Basic SQL Analysis

## Total Number of Guests

```sql
SELECT COUNT(*) AS guest_cnt
FROM guests;
```

This calculates the total number of guests in the database.

---

## Total Bookings

```sql
SELECT COUNT(*) AS bookings_count
FROM bookings;
```

This calculates the total number of bookings.

---

## Total Stays

```sql
SELECT COUNT(*) AS stays_count
FROM stays;
```

This calculates the total number of stays.

---

## Available Room Types

```sql
SELECT DISTINCT room_type
FROM rooms;
```

This identifies the different room types available.

---

## Active Staff Count

```sql
SELECT COUNT(staff_id) AS staff_count
FROM staff
WHERE is_active = 'Yes';
```

This calculates the number of currently active staff members.

---

## Booking Channels

```sql
SELECT DISTINCT booking_channel
FROM bookings;
```

This identifies the different channels through which bookings were made.

---

## Total Booking Revenue

```sql
SELECT SUM(total_amount) AS ttl_amt
FROM bookings;
```

This calculates the total booking revenue.

---

## Average Nights Booked

```sql
SELECT AVG(nights_booked) AS avg_ngts
FROM bookings;
```

This calculates the average number of nights booked.

---

# 🏨 Section 3 — Hotel & Booking Analysis

## Bookings by Hotel

```sql
SELECT
    h.hotel_id,
    h.hotel_name,
    COUNT(b.booking_id) AS total_bookings
FROM hotels h
JOIN bookings b
    ON h.hotel_id = b.hotel_id
GROUP BY h.hotel_id, h.hotel_name
ORDER BY total_bookings DESC;
```

### Purpose

This query identifies hotels with the highest number of bookings.

### Business Use

Management can identify high-performing hotels and understand booking demand.

---

# 📱 Bookings by Booking Channel

```sql
SELECT
    booking_channel,
    COUNT(booking_id) AS total_bookings
FROM bookings
GROUP BY booking_channel
ORDER BY total_bookings DESC;
```

### Purpose

This determines which booking channel generates the most reservations.

---

# 🛏️ Most Requested Room Types

```sql
SELECT
    room_type_requested,
    COUNT(booking_id) AS book_cnt
FROM bookings
GROUP BY room_type_requested
ORDER BY book_cnt DESC;
```

### Purpose

This identifies customer demand for different room types.

---

# 📅 Daily Booking Analysis

```sql
SELECT
    booking_date,
    COUNT(booking_id) AS total_bookings
FROM bookings
GROUP BY booking_date
ORDER BY booking_date;
```

This helps analyze booking activity over time.

---

# 📊 Monthly Booking Analysis

```sql
SELECT
    YEAR(booking_date) AS booking_year,
    MONTH(booking_date) AS booking_month,
    COUNT(booking_id) AS total_bookings
FROM bookings
GROUP BY
    YEAR(booking_date),
    MONTH(booking_date)
ORDER BY
    booking_year,
    booking_month;
```

### Purpose

This identifies monthly booking trends and seasonality.

---

# 👤 Guest Analysis

## Bookings Per Guest

```sql
SELECT
    g.guest_id,
    g.guest_name,
    COUNT(b.booking_id) AS total_bookings
FROM guests g
JOIN bookings b
    ON g.guest_id = b.guest_id
GROUP BY
    g.guest_id,
    g.guest_name
ORDER BY total_bookings DESC;
```

This identifies frequent customers.

---

# 💰 Guest with Highest Booking Amount

```sql
SELECT
    g.guest_id,
    g.guest_name,
    SUM(b.total_amount) AS total_amount
FROM guests g
JOIN bookings b
    ON g.guest_id = b.guest_id
GROUP BY
    g.guest_id,
    g.guest_name
ORDER BY total_amount DESC
LIMIT 1;
```

This identifies the guest who generated the highest booking revenue.

---

# 🏨 Guest + Hotel Booking Details

```sql
SELECT
    g.guest_id,
    g.guest_name,
    h.hotel_name,
    b.booking_date,
    b.total_amount
FROM bookings b
JOIN guests g
    ON b.guest_id = g.guest_id
JOIN hotels h
    ON b.hotel_id = h.hotel_id;
```

This combines guest, hotel, and booking information.

---

# 👥 Guest Type Analysis

```sql
SELECT
    g.guest_type,
    COUNT(b.booking_id) AS total_bookings,
    SUM(b.nights_booked) AS total_nights_booked,
    SUM(b.total_amount) AS total_booking_amount
FROM guests g
JOIN bookings b
    ON g.guest_id = b.guest_id
GROUP BY g.guest_type;
```

### Purpose

This compares booking behavior and revenue across different guest types.

---

# 📅 Monthly Revenue Analysis

```sql
SELECT
    YEAR(booking_date) AS booking_year,
    MONTH(booking_date) AS booking_month,
    COUNT(booking_id) AS total_bookings,
    SUM(total_amount) AS total_booking_amount
FROM bookings
GROUP BY
    YEAR(booking_date),
    MONTH(booking_date)
ORDER BY
    booking_year,
    booking_month;
```

This helps management understand monthly revenue trends.

---

# 🛎️ Stay Analysis

## Stays by Hotel and Status

```sql
SELECT
    b.hotel_id,
    s.status,
    COUNT(s.stay_id) AS total_stays
FROM bookings b
JOIN stays s
    ON b.booking_id = s.booking_id
GROUP BY
    b.hotel_id,
    s.status;
```

This shows stay status distribution for each hotel.

---

## Average Stay Duration

```sql
SELECT
    AVG(nights_stayed) AS average_nights,
    AVG(stay_duration_hrs) AS average_duration_hours
FROM stays;
```

This calculates average stay duration.

---

## Stay Status Distribution

```sql
SELECT
    status,
    COUNT(stay_id) AS total_stays
FROM stays
GROUP BY status;
```

This identifies the number of stays by status.

---

# 🏨 Hotel Stay Analysis

```sql
SELECT
    h.hotel_id,
    h.hotel_name,
    b.nights_booked,
    h.star_rating
FROM hotels h
JOIN bookings b
    ON h.hotel_id = b.hotel_id
ORDER BY
    b.nights_booked DESC,
    h.star_rating ASC;
```

This helps compare hotel ratings with booking duration.

---

# 📆 Monthly Stay Analysis

```sql
SELECT
    YEAR(check_in_date) AS year,
    MONTH(check_in_date) AS month,
    COUNT(stay_id) AS total_stays
FROM stays
GROUP BY
    YEAR(check_in_date),
    MONTH(check_in_date)
ORDER BY
    year,
    month;
```

This identifies monthly stay trends.

---

# 👨‍💼 Staff Performance Analysis

## Number of Stays Handled by Staff

```sql
SELECT
    stf.staff_id,
    stf.staff_name,
    COUNT(stay_id) AS stays_cnt
FROM staff stf
JOIN stays sty
    ON stf.staff_id = sty.staff_id
GROUP BY
    stf.staff_id,
    stf.staff_name;
```

This measures staff workload.

---

## Staff Stay Status

```sql
SELECT
    st.staff_name,
    s.status,
    COUNT(s.stay_id) AS total_stays
FROM staff st
JOIN stays s
    ON st.staff_id = s.staff_id
GROUP BY
    st.staff_name,
    s.status
ORDER BY st.staff_name;
```

This provides a detailed view of staff-associated stay statuses.

---

## Total Stay Duration Handled by Staff

```sql
SELECT
    st.staff_id,
    st.staff_name,
    SUM(sy.stay_duration_hrs) AS total_duration_inHrs
FROM staff st
JOIN stays sy
    ON st.staff_id = sy.staff_id
GROUP BY
    st.staff_id,
    st.staff_name;
```

This measures the total number of stay hours handled by each staff member.

---

# 🛏️ Room Analysis

## Maximum Occupancy by Room Type

```sql
SELECT
    room_type,
    SUM(max_occupancy) AS occupaid_rooms
FROM rooms
GROUP BY room_type;
```

This compares room capacity across different room types.

---

## Room Performance

```sql
SELECT
    r.room_id,
    r.room_type,
    COUNT(s.stay_id) AS total_stays,
    AVG(s.nights_stayed) AS average_nights,
    SUM(s.service_requests) AS total_service_requests
FROM rooms r
JOIN stays s
    ON r.room_id = s.room_id
GROUP BY
    r.room_id,
    r.room_type
ORDER BY total_stays DESC;
```

This identifies rooms with high usage and service demand.

---

# ❌ Cancellation & No-Show Analysis

## Cancelled and No-Show Bookings

```sql
SELECT
    b.booking_id,
    b.hotel_id,
    b.booking_date,
    s.status
FROM bookings b
JOIN stays s
    ON b.booking_id = s.booking_id
WHERE s.status IN ('Cancelled', 'No-show');
```

This identifies bookings that were cancelled or marked as no-show.

---

## Stay Status Ranking

```sql
SELECT
    status,
    COUNT(stay_id) AS total_stays
FROM stays
GROUP BY status
ORDER BY total_stays DESC;
```

This identifies the most common stay statuses.

---

# 🧹 Service Request Analysis

```sql
SELECT
    s.stay_id,
    b.booking_id,
    b.room_type_requested,
    s.service_requests,
    b.total_amount
FROM stays s
JOIN bookings b
    ON s.booking_id = b.booking_id
ORDER BY service_requests DESC;
```

This identifies stays with the highest number of service requests.

### Business Use

Hotels can use this information to:

* Improve customer service
* Identify high-demand services
* Allocate staff efficiently
* Understand customer requirements

---

# ❌ Hotel Cancellation & No-Show Analysis

```sql
SELECT
    h.hotel_id,
    h.hotel_name,
    SUM(s.status = 'Cancelled') AS cancelled,
    SUM(s.status = 'No-show') AS no_show
FROM hotels h
JOIN bookings b
    ON h.hotel_id = b.hotel_id
JOIN stays s
    ON b.booking_id = s.booking_id
GROUP BY
    h.hotel_id,
    h.hotel_name
ORDER BY
    cancelled,
    no_show;
```

This compares cancellation and no-show activity across hotels.

---

# 📚 SQL Skills Demonstrated

Through this project, I practiced and demonstrated:

* Database creation
* Table creation
* Primary Keys
* Foreign Keys
* Constraints
* Data relationships
* SELECT statements
* WHERE filtering
* DISTINCT
* INNER JOIN
* GROUP BY
* ORDER BY
* LIMIT
* COUNT()
* SUM()
* AVG()
* YEAR()
* MONTH()
* IN operator
* Aggregate analysis
* Business-oriented SQL analysis

---

# 💡 Business Questions Answered

This project answers practical business questions such as:

### Customer Analysis

* How many guests are registered?
* Which guests make the most bookings?
* Which guest generates the highest revenue?
* How do different guest types behave?

### Hotel Analysis

* Which hotel receives the most bookings?
* How many bookings does each hotel receive?
* How do hotel ratings compare with booking duration?
* Which hotels have more cancellations?

### Room Analysis

* What room types are available?
* Which room types are most requested?
* Which rooms have the highest number of stays?
* Which rooms receive the most service requests?

### Booking Analysis

* How many bookings are made?
* Which booking channel is most popular?
* What is the total booking revenue?
* What is the average number of nights booked?
* How does booking activity change by month?

### Staff Analysis

* How many active staff members are available?
* Which staff members handle the most stays?
* What is the total duration handled by each staff member?
* What are the stay statuses associated with staff?

### Stay Analysis

* How many stays are completed?
* What is the average stay duration?
* What are the common stay statuses?
* How many cancellations and no-shows occur?

---

# 📈 Business Insights

The analysis can help hotel management understand:

### 1. Customer Behavior

Frequent guests can be identified and targeted with loyalty programs and personalized offers.

### 2. Revenue Performance

Total and monthly booking revenue can help management understand financial performance.

### 3. Booking Channel Performance

The most successful booking channels can be identified, helping hotels optimize their marketing strategy.

### 4. Room Demand

Popular room types can be identified to improve room allocation and pricing decisions.

### 5. Staff Workload

Staff members handling a high number of stays or long durations can be identified for better workforce planning.

### 6. Customer Service

Service-request data can help management understand customer needs and improve service quality.

### 7. Cancellation Management

Hotels can identify cancellation and no-show patterns and develop strategies to reduce lost revenue.

---

# 📁 Suggested Repository Structure

```text
SQL_PROJECT/
│
├── hotel_reservation.sql
├── guests.csv
├── hotels.csv
├── rooms.csv
├── bookings.csv
├── staff.csv
├── stays.csv
└── README.md
```

### File Description

| File                    | Description                            |
| ----------------------- | -------------------------------------- |
| `hotel_reservation.sql` | Database creation and analysis queries |
| `guests.csv`            | Guest data                             |
| `hotels.csv`            | Hotel data                             |
| `rooms.csv`             | Room data                              |
| `bookings.csv`          | Booking data                           |
| `staff.csv`             | Staff data                             |
| `stays.csv`             | Stay data                              |
| `README.md`             | Project documentation                  |

---

# ▶️ How to Run the Project

### Step 1 — Install MySQL

Install MySQL Server and MySQL Workbench.

### Step 2 — Open the SQL File

Open:

```text
hotel_reservation.sql
```

in MySQL Workbench.

### Step 3 — Create the Database

Run:

```sql
CREATE DATABASE hotel_reservation_db;

USE hotel_reservation_db;
```

### Step 4 — Create Tables

Execute the table creation queries.

### Step 5 — Load Data

Load the CSV data into the corresponding tables.

### Step 6 — Execute Analysis Queries

Run the SQL analysis queries to explore the database and answer business questions.

---

# 🧠 Key Learning Outcome

This project helped me understand how SQL can be used not only for storing and retrieving data, but also for **solving real-world business problems**.

I gained practical experience in:

```text
Database Design
      ↓
Data Relationships
      ↓
SQL Queries
      ↓
Data Aggregation
      ↓
Data Analysis
      ↓
Business Insights
```

---

# 👨‍💻 Author

**Vinay Kumar**

Aspiring Data Analyst | SQL | Python | Excel | Power BI | Pandas | NumPy

I am currently building my skills in data analytics and working on practical projects to strengthen my SQL, Python, Excel, Power BI, and data analysis capabilities.

---

# ⭐ Project Highlights

✅ Relational database design
✅ 6 interconnected tables
✅ Primary & Foreign Keys
✅ Hotel reservation data analysis
✅ Guest behavior analysis
✅ Booking analysis
✅ Revenue analysis
✅ Room analysis
✅ Staff performance analysis
✅ Stay and cancellation analysis
✅ Date-based analysis
✅ Aggregate functions
✅ SQL JOIN operations
✅ Business-focused SQL queries

---

## 📌 Conclusion

The **Hotel Reservation Database & SQL Analysis Project** demonstrates how SQL can be used to design a relational database and transform hotel reservation data into useful business information.

The project provides a strong practical foundation in **SQL, relational database concepts, data analysis, and business problem-solving**, which are essential skills for a **Data Analyst** role.
