# Airline Reservation System

A Java EE based web application for searching, booking, and managing airline tickets. 

## Features
- User registration, login, and session management
- Flight search based on origin, destination, and available seats
- Ticket booking with automatic seat reduction
- "My Bookings" page to view history and cancel active bookings
- Admin dashboard to add and remove flights from the database

## Tech Stack
- **Frontend:** HTML, CSS, JSP (with JSTL and Scriptlets)
- **Backend:** Java Servlets
- **Database:** Apache Derby (Java DB)
- **Server Environment:** GlassFish 4.1.1 (via NetBeans IDE 8.2)

## Local Setup

1. Open the project in NetBeans 8.2.
2. Go to the **Services** tab and ensure the Java DB server is started.
3. Connect to the local Derby database (ensure the `users`, `flights`, and `bookings` tables are created according to the schema).
4. Right-click the project in NetBeans and select **Clean and Build**.
5. Click **Run** to automatically deploy the `.war` file to GlassFish and open it in your browser.

## Database Schema Overview
The system relies on 3 main tables:
- `users`: stores registered users (id, username, password, email, etc.)
- `flights`: stores flight schedules (id, flight_number, origin, destination, price, available_seats, departure_time)
- `bookings`: links a user to a flight (id, user_id, flight_id, passenger_name, status)
