<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard - SkyWay Airlines</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <!-- =========================
         ADMIN HEADER
         ========================= -->

    <header class="admin-navbar">

        <div class="admin-nav-container">

            <div class="admin-logo">

                ✈ SkyWay Airlines

                <span>
                    Admin Panel
                </span>

            </div>


            <nav class="admin-nav-links">

                <a href="admin-dashboard.jsp"
                   class="active">

                    Dashboard

                </a>

                <a href="manage-flights.jsp">

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
         DASHBOARD
         ========================= -->

    <main class="admin-dashboard">

        <div class="container">


            <!-- Page Heading -->

            <div class="admin-page-heading">

                <div>

                    <h1>
                        Dashboard
                    </h1>

                    <p>
                        Welcome to the SkyWay Airlines
                        administration panel.
                    </p>

                </div>

            </div>


            <!-- =========================
                 STATISTICS
                 ========================= -->

            <div class="admin-stats-grid">


                <!-- Flights -->

                <div class="admin-stat-card">

                    <div class="admin-stat-icon">
                        ✈
                    </div>

                    <div>

                        <span class="admin-stat-label">
                            Total Flights
                        </span>

                        <h2>
                            24
                        </h2>

                    </div>

                </div>


                <!-- Bookings -->

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


                <!-- Passengers -->

                <div class="admin-stat-card">

                    <div class="admin-stat-icon">
                        👥
                    </div>

                    <div>

                        <span class="admin-stat-label">
                            Total Passengers
                        </span>

                        <h2>
                            238
                        </h2>

                    </div>

                </div>


                <!-- Revenue -->

                <div class="admin-stat-card">

                    <div class="admin-stat-icon">
                        ₹
                    </div>

                    <div>

                        <span class="admin-stat-label">
                            Total Revenue
                        </span>

                        <h2>
                            ₹7.85L
                        </h2>

                    </div>

                </div>

            </div>


            <!-- =========================
                 QUICK ACTIONS
                 ========================= -->

            <div class="admin-section">

                <div class="admin-section-header">

                    <div>

                        <h2>
                            Quick Actions
                        </h2>

                        <p>
                            Manage your airline reservation system.
                        </p>

                    </div>

                </div>


                <div class="admin-actions-grid">


                    <a href="manage-flights.jsp"
                       class="admin-action-card">

                        <div class="admin-action-icon">
                            ✈️
                        </div>

                        <h3>
                            Manage Flights
                        </h3>

                        <p>
                            Add, edit, remove and view available flights.
                        </p>

                    </a>


                    <a href="add-edit-flight.jsp"
                       class="admin-action-card">

                        <div class="admin-action-icon">
                            ➕
                        </div>

                        <h3>
                            Add New Flight
                        </h3>

                        <p>
                            Create a new flight and add it to the system.
                        </p>

                    </a>


                    <a href="manage-bookings.jsp"
                       class="admin-action-card">

                        <div class="admin-action-icon">
                            🎫
                        </div>

                        <h3>
                            Manage Bookings
                        </h3>

                        <p>
                            View and manage passenger reservations.
                        </p>

                    </a>

                </div>

            </div>


            <!-- =========================
                 RECENT BOOKINGS
                 ========================= -->

            <div class="admin-section">

                <div class="admin-section-header">

                    <div>

                        <h2>
                            Recent Bookings
                        </h2>

                        <p>
                            Latest reservations in the system.
                        </p>

                    </div>

                    <a href="manage-bookings.jsp"
                       class="btn btn-outline">

                        View All

                    </a>

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
                                    Date
                                </th>

                                <th>
                                    Amount
                                </th>

                                <th>
                                    Status
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
                                    Mumbai → Delhi
                                </td>

                                <td>
                                    20 Sep 2026
                                </td>

                                <td>
                                    ₹4,799
                                </td>

                                <td>

                                    <span class="badge badge-warning">
                                        Pending
                                    </span>

                                </td>

                            </tr>


                        </tbody>

                    </table>

                </div>

            </div>


            <!-- =========================
                 SYSTEM INFORMATION
                 ========================= -->

            <div class="admin-info-box">

                <h3>
                    System Information
                </h3>

                <p>
                    This administration dashboard is currently
                    displaying sample frontend data. Flight,
                    passenger, booking and revenue information
                    will become dynamic after backend and
                    database integration.
                </p>

            </div>

        </div>

    </main>


    <!-- =========================
         FOOTER
         ========================= -->

    <jsp:include page="../footer.jsp" />


</body>

</html>