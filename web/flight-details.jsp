<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Flight Details - SkyWay Airlines</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <!-- Header -->
    <jsp:include page="header.jsp" />


    <!-- Page Header -->

    <section class="page-header">

        <div class="container">

            <h1>
                Flight Details
            </h1>

            <p>
                Review your selected flight before booking.
            </p>

        </div>

    </section>


    <!-- Flight Details -->

    <section class="section">

        <div class="container">

            <div class="details-layout">


                <!-- =========================
                     LEFT SIDE
                     ========================= -->

                <div>


                    <!-- Flight Route Card -->

                    <div class="card mb-20">

                        <div class="card-header">

                            <h2 class="card-title">
                                SkyWay Airlines
                            </h2>

                            <span class="badge badge-info">
                                SW 101
                            </span>

                        </div>


                        <div class="detail-route">


                            <div class="detail-time">

                                <h2>
                                    06:30
                                </h2>

                                <p>
                                    Mumbai (BOM)
                                </p>

                                <p>
                                    15 Sep 2026
                                </p>

                            </div>


                            <div class="detail-arrow">
                                ✈
                            </div>


                            <div class="detail-time">

                                <h2>
                                    08:35
                                </h2>

                                <p>
                                    Delhi (DEL)
                                </p>

                                <p>
                                    15 Sep 2026
                                </p>

                            </div>

                        </div>


                        <!-- Flight Information -->

                        <h3 class="card-title">
                            Flight Information
                        </h3>


                        <div class="info-grid">


                            <div class="info-item">

                                <div class="info-label">
                                    Flight Number
                                </div>

                                <div class="info-value">
                                    SW 101
                                </div>

                            </div>


                            <div class="info-item">

                                <div class="info-label">
                                    Airline
                                </div>

                                <div class="info-value">
                                    SkyWay Airlines
                                </div>

                            </div>


                            <div class="info-item">

                                <div class="info-label">
                                    Departure
                                </div>

                                <div class="info-value">
                                    06:30 AM
                                </div>

                            </div>


                            <div class="info-item">

                                <div class="info-label">
                                    Arrival
                                </div>

                                <div class="info-value">
                                    08:35 AM
                                </div>

                            </div>


                            <div class="info-item">

                                <div class="info-label">
                                    Duration
                                </div>

                                <div class="info-value">
                                    2 Hours 05 Minutes
                                </div>

                            </div>


                            <div class="info-item">

                                <div class="info-label">
                                    Travel Class
                                </div>

                                <div class="info-value">
                                    Economy
                                </div>

                            </div>


                            <div class="info-item">

                                <div class="info-label">
                                    Available Seats
                                </div>

                                <div class="info-value">
                                    18 Seats
                                </div>

                            </div>


                            <div class="info-item">

                                <div class="info-label">
                                    Baggage
                                </div>

                                <div class="info-value">
                                    15 KG
                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- Important Information -->

                    <div class="alert alert-info">

                        <strong>Important:</strong>

                        Please verify your journey details,
                        travel date, and passenger information
                        before proceeding with the reservation.

                    </div>

                </div>


                <!-- =========================
                     RIGHT SIDE
                     ========================= -->

                <div>


                    <!-- Fare Summary -->

                    <div class="booking-summary">

                        <h2 class="summary-title">
                            Fare Summary
                        </h2>


                        <div class="summary-row">

                            <span class="summary-label">
                                Base Fare
                            </span>

                            <span class="summary-value">
                                ₹4,200
                            </span>

                        </div>


                        <div class="summary-row">

                            <span class="summary-label">
                                Taxes & Fees
                            </span>

                            <span class="summary-value">
                                ₹799
                            </span>

                        </div>


                        <div class="summary-row">

                            <span class="summary-label">
                                Passenger
                            </span>

                            <span class="summary-value">
                                1
                            </span>

                        </div>


                        <div class="total-row">

                            <span>
                                Total
                            </span>

                            <span>
                                ₹4,999
                            </span>

                        </div>


                        <br>


                        <!-- Book Button -->

                        <a href="booking.jsp"
                           class="btn btn-success btn-block">

                            ✈ Book This Flight

                        </a>


                        <br>


                        <a href="flight-results.jsp"
                           class="btn btn-outline btn-block">

                            ← Back to Flights

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </section>


    <!-- Footer -->

    <jsp:include page="footer.jsp" />

</body>

</html>