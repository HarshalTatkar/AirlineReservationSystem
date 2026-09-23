<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Add / Edit Flight - SkyWay Airlines</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <!-- =========================
         ADMIN NAVBAR
         ========================= -->

    <header class="admin-navbar">

        <div class="admin-nav-container">

            <div class="admin-logo">

                ✈ SkyWay Airlines

                <span>Admin Panel</span>

            </div>

            <nav class="admin-nav-links">

                <a href="admin-dashboard.jsp">
                    Dashboard
                </a>

                <a href="manage-flights.jsp"
                   class="active">
                    Flights
                </a>

                <a href="manage-bookings.jsp">
                    Bookings
                </a>

                <a href="../index.jsp">
                    Website
                </a>

                <a href="admin-login.jsp"
                   class="admin-logout">
                    Logout
                </a>

            </nav>

        </div>

    </header>


    <!-- =========================
         MAIN CONTENT
         ========================= -->

    <main class="admin-dashboard">

        <div class="container">

            <div class="admin-section-header">

                <div>

                    <h1>
                        Add New Flight
                    </h1>

                    <p>
                        Enter the details of the new flight.
                    </p>

                </div>

                <a href="manage-flights.jsp"
                   class="btn btn-outline">

                    ← Back to Flights

                </a>

            </div>


            <!-- =========================
                 FLIGHT FORM
                 ========================= -->

            <div class="flight-form-card">

                <form action="#" method="post">


                    <!-- Flight Information -->

                    <div class="form-section-title">

                        <h2>
                            Flight Information
                        </h2>

                        <p>
                            Basic information about the flight.
                        </p>

                    </div>


                    <div class="form-row">


                        <div class="form-group">

                            <label for="flightNumber">
                                Flight Number *
                            </label>

                            <input type="text"
                                   id="flightNumber"
                                   name="flightNumber"
                                   class="form-control"
                                   placeholder="Example: SW 101"
                                   required>

                        </div>


                        <div class="form-group">

                            <label for="airline">
                                Airline *
                            </label>

                            <input type="text"
                                   id="airline"
                                   name="airline"
                                   class="form-control"
                                   value="SkyWay Airlines"
                                   required>

                        </div>

                    </div>


                    <!-- Route -->

                    <div class="form-section-title">

                        <h2>
                            Flight Route
                        </h2>

                    </div>


                    <div class="form-row">


                        <div class="form-group">

                            <label for="departureCity">
                                Departure City *
                            </label>

                            <select id="departureCity"
                                    name="departureCity"
                                    class="form-control"
                                    required>

                                <option value="">
                                    Select departure city
                                </option>

                                <option>
                                    Mumbai
                                </option>

                                <option>
                                    Delhi
                                </option>

                                <option>
                                    Bangalore
                                </option>

                                <option>
                                    Chennai
                                </option>

                                <option>
                                    Hyderabad
                                </option>

                                <option>
                                    Kolkata
                                </option>

                            </select>

                        </div>


                        <div class="form-group">

                            <label for="arrivalCity">
                                Arrival City *
                            </label>

                            <select id="arrivalCity"
                                    name="arrivalCity"
                                    class="form-control"
                                    required>

                                <option value="">
                                    Select arrival city
                                </option>

                                <option>
                                    Mumbai
                                </option>

                                <option>
                                    Delhi
                                </option>

                                <option>
                                    Bangalore
                                </option>

                                <option>
                                    Chennai
                                </option>

                                <option>
                                    Hyderabad
                                </option>

                                <option>
                                    Kolkata
                                </option>

                            </select>

                        </div>

                    </div>


                    <!-- Date and Time -->

                    <div class="form-section-title">

                        <h2>
                            Schedule
                        </h2>

                    </div>


                    <div class="form-row">


                        <div class="form-group">

                            <label for="flightDate">
                                Flight Date *
                            </label>

                            <input type="date"
                                   id="flightDate"
                                   name="flightDate"
                                   class="form-control"
                                   required>

                        </div>


                        <div class="form-group">

                            <label for="departureTime">
                                Departure Time *
                            </label>

                            <input type="time"
                                   id="departureTime"
                                   name="departureTime"
                                   class="form-control"
                                   required>

                        </div>


                        <div class="form-group">

                            <label for="arrivalTime">
                                Arrival Time *
                            </label>

                            <input type="time"
                                   id="arrivalTime"
                                   name="arrivalTime"
                                   class="form-control"
                                   required>

                        </div>

                    </div>


                    <!-- Aircraft -->

                    <div class="form-row">


                        <div class="form-group">

                            <label for="aircraft">
                                Aircraft Type *
                            </label>

                            <select id="aircraft"
                                    name="aircraft"
                                    class="form-control"
                                    required>

                                <option value="">
                                    Select aircraft
                                </option>

                                <option>
                                    Airbus A320
                                </option>

                                <option>
                                    Boeing 737
                                </option>

                                <option>
                                    Airbus A321
                                </option>

                            </select>

                        </div>


                        <div class="form-group">

                            <label for="duration">
                                Flight Duration *
                            </label>

                            <input type="text"
                                   id="duration"
                                   name="duration"
                                   class="form-control"
                                   placeholder="Example: 2h 15m"
                                   required>

                        </div>

                    </div>


                    <!-- Seats and Fare -->

                    <div class="form-section-title">

                        <h2>
                            Seats & Fare
                        </h2>

                    </div>


                    <div class="form-row">


                        <div class="form-group">

                            <label for="totalSeats">
                                Total Seats *
                            </label>

                            <input type="number"
                                   id="totalSeats"
                                   name="totalSeats"
                                   class="form-control"
                                   placeholder="Example: 180"
                                   min="1"
                                   required>

                        </div>


                        <div class="form-group">

                            <label for="availableSeats">
                                Available Seats *
                            </label>

                            <input type="number"
                                   id="availableSeats"
                                   name="availableSeats"
                                   class="form-control"
                                   placeholder="Example: 180"
                                   min="0"
                                   required>

                        </div>


                        <div class="form-group">

                            <label for="fare">
                                Ticket Fare (₹) *
                            </label>

                            <input type="number"
                                   id="fare"
                                   name="fare"
                                   class="form-control"
                                   placeholder="Example: 4999"
                                   min="0"
                                   required>

                        </div>

                    </div>


                    <!-- Status -->

                    <div class="form-section-title">

                        <h2>
                            Flight Status
                        </h2>

                    </div>


                    <div class="form-group">

                        <label for="flightStatus">
                            Status *
                        </label>

                        <select id="flightStatus"
                                name="flightStatus"
                                class="form-control"
                                required>

                            <option value="Active">
                                Active
                            </option>

                            <option value="Inactive">
                                Inactive
                            </option>

                        </select>

                    </div>


                    <!-- Buttons -->

                    <div class="flight-form-actions">

                        <a href="manage-flights.jsp"
                           class="btn btn-outline">

                            Cancel

                        </a>


                        <button type="submit"
                                class="btn btn-primary"
                                onclick="saveFlight(event)">

                            💾 Save Flight

                        </button>

                    </div>

                </form>

            </div>


            <!-- Information -->

            <div class="admin-info-box">

                <h3>
                    Frontend Preview
                </h3>

                <p>
                    This form is currently for frontend
                    demonstration. The Save Flight button does
                    not store information because database and
                    backend integration have not been added yet.
                </p>

            </div>

        </div>

    </main>


    <!-- Footer -->

    <jsp:include page="../footer.jsp" />


    <!-- JavaScript -->

    <script>

        function saveFlight(event) {

            event.preventDefault();

            alert(
                "Flight details submitted successfully! " +
                "Backend integration is required to save " +
                "this flight permanently."
            );

        }

    </script>

</body>

</html>