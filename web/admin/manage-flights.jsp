<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Manage Flights - SkyWay Airlines</title>

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


            <!-- Page Heading -->

            <div class="admin-section-header">

                <div>

                    <h1>
                        Manage Flights
                    </h1>

                    <p>
                        Add, edit, search and manage airline flights.
                    </p>

                </div>

                <a href="add-edit-flight.jsp"
                   class="btn btn-primary">

                    + Add New Flight

                </a>

            </div>


            <!-- =========================
                 SEARCH AREA
                 ========================= -->

            <div class="flight-search-card">

                <form action="#" method="get">

                    <div class="flight-search-row">

                        <div class="form-group">

                            <label for="searchFlight">
                                Search Flight
                            </label>

                            <input type="text"
                                   id="searchFlight"
                                   name="searchFlight"
                                   class="form-control"
                                   placeholder="Flight number or airline">

                        </div>


                        <div class="form-group">

                            <label for="from">
                                From
                            </label>

                            <select id="from"
                                    name="from"
                                    class="form-control">

                                <option value="">
                                    All Cities
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

                            </select>

                        </div>


                        <div class="form-group">

                            <label for="to">
                                To
                            </label>

                            <select id="to"
                                    name="to"
                                    class="form-control">

                                <option value="">
                                    All Cities
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

                            </select>

                        </div>


                        <div class="form-group">

                            <label for="status">
                                Status
                            </label>

                            <select id="status"
                                    name="status"
                                    class="form-control">

                                <option>
                                    All
                                </option>

                                <option>
                                    Active
                                </option>

                                <option>
                                    Inactive
                                </option>

                            </select>

                        </div>


                        <div class="flight-search-button">

                            <button type="submit"
                                    class="btn btn-primary">

                                🔍 Search

                            </button>

                        </div>

                    </div>

                </form>

            </div>


            <!-- =========================
                 FLIGHTS TABLE
                 ========================= -->

            <div class="admin-section">

                <div class="admin-section-header">

                    <div>

                        <h2>
                            All Flights
                        </h2>

                        <p>
                            24 flights available in the system.
                        </p>

                    </div>

                </div>


                <div class="admin-table-wrapper">

                    <table class="admin-table">

                        <thead>

                            <tr>

                                <th>
                                    Flight
                                </th>

                                <th>
                                    Airline
                                </th>

                                <th>
                                    From
                                </th>

                                <th>
                                    To
                                </th>

                                <th>
                                    Departure
                                </th>

                                <th>
                                    Arrival
                                </th>

                                <th>
                                    Fare
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


                            <!-- Flight 1 -->

                            <tr>

                                <td>
                                    <strong>SW 101</strong>
                                </td>

                                <td>
                                    SkyWay Airlines
                                </td>

                                <td>
                                    Mumbai
                                </td>

                                <td>
                                    Delhi
                                </td>

                                <td>
                                    06:30 AM
                                </td>

                                <td>
                                    08:35 AM
                                </td>

                                <td>
                                    ₹4,999
                                </td>

                                <td>

                                    <span class="badge badge-success">
                                        Active
                                    </span>

                                </td>

                                <td>

                                    <div class="table-actions">

                                        <a href="add-edit-flight.jsp"
                                           class="btn btn-small btn-outline">

                                            Edit

                                        </a>

                                        <button type="button"
                                                class="btn btn-small btn-danger"
                                                onclick="deleteFlight('SW 101')">

                                            Delete

                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <!-- Flight 2 -->

                            <tr>

                                <td>
                                    <strong>SW 205</strong>
                                </td>

                                <td>
                                    SkyWay Airlines
                                </td>

                                <td>
                                    Delhi
                                </td>

                                <td>
                                    Mumbai
                                </td>

                                <td>
                                    10:15 AM
                                </td>

                                <td>
                                    12:25 PM
                                </td>

                                <td>
                                    ₹5,499
                                </td>

                                <td>

                                    <span class="badge badge-success">
                                        Active
                                    </span>

                                </td>

                                <td>

                                    <div class="table-actions">

                                        <a href="add-edit-flight.jsp"
                                           class="btn btn-small btn-outline">

                                            Edit

                                        </a>

                                        <button type="button"
                                                class="btn btn-small btn-danger"
                                                onclick="deleteFlight('SW 205')">

                                            Delete

                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <!-- Flight 3 -->

                            <tr>

                                <td>
                                    <strong>SW 309</strong>
                                </td>

                                <td>
                                    SkyWay Airlines
                                </td>

                                <td>
                                    Mumbai
                                </td>

                                <td>
                                    Bangalore
                                </td>

                                <td>
                                    02:00 PM
                                </td>

                                <td>
                                    03:45 PM
                                </td>

                                <td>
                                    ₹3,999
                                </td>

                                <td>

                                    <span class="badge badge-success">
                                        Active
                                    </span>

                                </td>

                                <td>

                                    <div class="table-actions">

                                        <a href="add-edit-flight.jsp"
                                           class="btn btn-small btn-outline">

                                            Edit

                                        </a>

                                        <button type="button"
                                                class="btn btn-small btn-danger"
                                                onclick="deleteFlight('SW 309')">

                                            Delete

                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <!-- Flight 4 -->

                            <tr>

                                <td>
                                    <strong>SW 412</strong>
                                </td>

                                <td>
                                    SkyWay Airlines
                                </td>

                                <td>
                                    Chennai
                                </td>

                                <td>
                                    Delhi
                                </td>

                                <td>
                                    05:30 PM
                                </td>

                                <td>
                                    08:15 PM
                                </td>

                                <td>
                                    ₹5,199
                                </td>

                                <td>

                                    <span class="badge badge-warning">
                                        Inactive
                                    </span>

                                </td>

                                <td>

                                    <div class="table-actions">

                                        <a href="add-edit-flight.jsp"
                                           class="btn btn-small btn-outline">

                                            Edit

                                        </a>

                                        <button type="button"
                                                class="btn btn-small btn-danger"
                                                onclick="deleteFlight('SW 412')">

                                            Delete

                                        </button>

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
                    The flight information shown here is sample
                    data for the frontend. Search, edit and delete
                    operations will become functional after backend
                    integration.
                </p>

            </div>

        </div>

    </main>


    <!-- Footer -->

    <jsp:include page="../footer.jsp" />


    <!-- =========================
         JAVASCRIPT
         ========================= -->

    <script>

        function deleteFlight(flightNumber) {

            var result = confirm(
                "Are you sure you want to delete flight "
                + flightNumber + "?"
            );

            if (result) {

                alert(
                    "Delete operation is currently frontend only. "
                    + "Backend integration is required."
                );

            }

        }

    </script>


</body>

</html>