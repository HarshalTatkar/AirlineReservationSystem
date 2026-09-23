<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Manage Bookings - SkyWay Airlines</title>

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

                <a href="manage-flights.jsp">
                    Flights
                </a>

                <a href="manage-bookings.jsp"
                   class="active">
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


            <!-- Page Heading -->

            <div class="admin-section-header">

                <div>

                    <h1>
                        Manage Bookings
                    </h1>

                    <p>
                        View and manage passenger reservations.
                    </p>

                </div>

            </div>


            <!-- =========================
                 BOOKING STATISTICS
                 ========================= -->

            <div class="admin-stats-grid">

                <div class="admin-stat-card">

                    <div class="admin-stat-icon">
                        🎫
                    </div>

                    <div>

                        <span class="admin-stat-label">
                            Total Bookings
                        </span>

                        <h2>
                            156
                        </h2>

                    </div>

                </div>


                <div class="admin-stat-card">

                    <div class="admin-stat-icon">
                        ✓
                    </div>

                    <div>

                        <span class="admin-stat-label">
                            Confirmed
                        </span>

                        <h2>
                            132
                        </h2>

                    </div>

                </div>


                <div class="admin-stat-card">

                    <div class="admin-stat-icon">
                        ⏳
                    </div>

                    <div>

                        <span class="admin-stat-label">
                            Pending
                        </span>

                        <h2>
                            16
                        </h2>

                    </div>

                </div>


                <div class="admin-stat-card">

                    <div class="admin-stat-icon">
                        ✕
                    </div>

                    <div>

                        <span class="admin-stat-label">
                            Cancelled
                        </span>

                        <h2>
                            8
                        </h2>

                    </div>

                </div>

            </div>


            <!-- =========================
                 SEARCH / FILTER
                 ========================= -->

            <div class="booking-filter-card">

                <form action="#" method="get">

                    <div class="booking-filter-row">


                        <div class="form-group">

                            <label for="bookingSearch">
                                Search Booking
                            </label>

                            <input type="text"
                                   id="bookingSearch"
                                   name="bookingSearch"
                                   class="form-control"
                                   placeholder="PNR or passenger name">

                        </div>


                        <div class="form-group">

                            <label for="bookingStatus">
                                Status
                            </label>

                            <select id="bookingStatus"
                                    name="bookingStatus"
                                    class="form-control">

                                <option>
                                    All Status
                                </option>

                                <option>
                                    Confirmed
                                </option>

                                <option>
                                    Pending
                                </option>

                                <option>
                                    Cancelled
                                </option>

                            </select>

                        </div>


                        <div class="form-group">

                            <label for="bookingDate">
                                Travel Date
                            </label>

                            <input type="date"
                                   id="bookingDate"
                                   name="bookingDate"
                                   class="form-control">

                        </div>


                        <div class="booking-filter-button">

                            <button type="submit"
                                    class="btn btn-primary">

                                🔍 Search

                            </button>

                        </div>

                    </div>

                </form>

            </div>


            <!-- =========================
                 BOOKINGS TABLE
                 ========================= -->

            <div class="admin-section">

                <div class="admin-section-header">

                    <div>

                        <h2>
                            All Bookings
                        </h2>

                        <p>
                            Latest passenger reservations.
                        </p>

                    </div>

                </div>


                <div class="admin-table-wrapper">

                    <table class="admin-table">

                        <thead>

                            <tr>

                                <th>
                                    PNR
                                </th>

                                <th>
                                    Passenger
                                </th>

                                <th>
                                    Flight
                                </th>

                                <th>
                                    Route
                                </th>

                                <th>
                                    Travel Date
                                </th>

                                <th>
                                    Amount
                                </th>

                                <th>
                                    Status
                                </th>

                                <th>
                                    Actions
                                </th>

                            </tr>

                        </thead>


                        <tbody>


                            <!-- Booking 1 -->

                            <tr>

                                <td>
                                    <strong>
                                        SW7K29P
                                    </strong>
                                </td>

                                <td>
                                    John Doe
                                </td>

                                <td>
                                    SW 101
                                </td>

                                <td>
                                    Mumbai → Delhi
                                </td>

                                <td>
                                    15 Sep 2026
                                </td>

                                <td>
                                    ₹4,999
                                </td>

                                <td>

                                    <span class="badge badge-success">
                                        Confirmed
                                    </span>

                                </td>

                                <td>

                                    <div class="table-actions">

                                        <a href="../booking-confirmation.jsp"
                                           class="btn btn-small btn-outline">

                                            View

                                        </a>

                                        <button type="button"
                                                class="btn btn-small btn-danger"
                                                onclick="cancelBooking('SW7K29P')">

                                            Cancel

                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <!-- Booking 2 -->

                            <tr>

                                <td>
                                    <strong>
                                        SW4M82Q
                                    </strong>
                                </td>

                                <td>
                                    Rahul Sharma
                                </td>

                                <td>
                                    SW 205
                                </td>

                                <td>
                                    Delhi → Mumbai
                                </td>

                                <td>
                                    18 Sep 2026
                                </td>

                                <td>
                                    ₹5,499
                                </td>

                                <td>

                                    <span class="badge badge-success">
                                        Confirmed
                                    </span>

                                </td>

                                <td>

                                    <div class="table-actions">

                                        <a href="../booking-confirmation.jsp"
                                           class="btn btn-small btn-outline">

                                            View

                                        </a>

                                        <button type="button"
                                                class="btn btn-small btn-danger"
                                                onclick="cancelBooking('SW4M82Q')">

                                            Cancel

                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <!-- Booking 3 -->

                            <tr>

                                <td>
                                    <strong>
                                        SW9P41M
                                    </strong>
                                </td>

                                <td>
                                    Priya Patel
                                </td>

                                <td>
                                    SW 309
                                </td>

                                <td>
                                    Mumbai → Bangalore
                                </td>

                                <td>
                                    20 Sep 2026
                                </td>

                                <td>
                                    ₹3,999
                                </td>

                                <td>

                                    <span class="badge badge-warning">
                                        Pending
                                    </span>

                                </td>

                                <td>

                                    <div class="table-actions">

                                        <a href="../booking-confirmation.jsp"
                                           class="btn btn-small btn-outline">

                                            View

                                        </a>

                                        <button type="button"
                                                class="btn btn-small btn-danger"
                                                onclick="cancelBooking('SW9P41M')">

                                            Cancel

                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <!-- Booking 4 -->

                            <tr>

                                <td>
                                    <strong>
                                        SW2T67R
                                    </strong>
                                </td>

                                <td>
                                    Anjali Mehta
                                </td>

                                <td>
                                    SW 412
                                </td>

                                <td>
                                    Chennai → Delhi
                                </td>

                                <td>
                                    22 Sep 2026
                                </td>

                                <td>
                                    ₹5,199
                                </td>

                                <td>

                                    <span class="badge badge-danger">
                                        Cancelled
                                    </span>

                                </td>

                                <td>

                                    <div class="table-actions">

                                        <a href="../booking-confirmation.jsp"
                                           class="btn btn-small btn-outline">

                                            View

                                        </a>

                                    </div>

                                </td>

                            </tr>


                        </tbody>

                    </table>

                </div>

            </div>


            <!-- Information -->

            <div class="admin-info-box">

                <h3>
                    Frontend Preview
                </h3>

                <p>
                    Booking records shown on this page are sample
                    frontend data. Search, cancellation and booking
                    management will become fully functional after
                    backend and database integration.
                </p>

            </div>

        </div>

    </main>


    <!-- Footer -->

    <jsp:include page="../footer.jsp" />


    <!-- JavaScript -->

    <script>

        function cancelBooking(pnr) {

            var result = confirm(
                "Are you sure you want to cancel booking "
                + pnr + "?"
            );

            if (result) {

                alert(
                    "Booking cancellation is currently "
                    + "frontend only. Backend integration "
                    + "is required."
                );

            }

        }

    </script>

</body>

</html>