<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Booking Confirmed - SkyWay Airlines</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <!-- =========================
         HEADER
         ========================= -->

    <jsp:include page="header.jsp" />


    <!-- =========================
         CONFIRMATION SECTION
         ========================= -->

    <section class="confirmation-section">

        <div class="container">

            <div class="confirmation-card">


                <!-- Success Icon -->

                <div class="confirmation-header">

                    <div class="success-icon">
                        ✓
                    </div>

                    <h1>
                        Booking Confirmed!
                    </h1>

                    <p>
                        Your flight reservation has been
                        successfully completed.
                    </p>

                </div>


                <!-- PNR -->

                <div class="pnr-box">

                    <div class="pnr-label">
                        Your Booking Reference / PNR
                    </div>

                    <div class="pnr-number">
                        SW7K29P
                    </div>

                    <p class="text-muted mt-10">
                        Please keep this PNR for future reference.
                    </p>

                </div>


                <!-- Flight Details -->

                <div class="card mb-20">

                    <div class="card-header">

                        <h2 class="card-title">
                            Flight Details
                        </h2>

                        <span class="badge badge-success">
                            CONFIRMED
                        </span>

                    </div>


                    <div class="info-grid">


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
                                Flight Number
                            </div>

                            <div class="info-value">
                                SW 101
                            </div>

                        </div>


                        <div class="info-item">

                            <div class="info-label">
                                From
                            </div>

                            <div class="info-value">
                                Mumbai (BOM)
                            </div>

                        </div>


                        <div class="info-item">

                            <div class="info-label">
                                To
                            </div>

                            <div class="info-value">
                                Delhi (DEL)
                            </div>

                        </div>


                        <div class="info-item">

                            <div class="info-label">
                                Departure
                            </div>

                            <div class="info-value">
                                15 Sep 2026, 06:30 AM
                            </div>

                        </div>


                        <div class="info-item">

                            <div class="info-label">
                                Arrival
                            </div>

                            <div class="info-value">
                                15 Sep 2026, 08:35 AM
                            </div>

                        </div>


                        <div class="info-item">

                            <div class="info-label">
                                Class
                            </div>

                            <div class="info-value">
                                Economy
                            </div>

                        </div>


                        <div class="info-item">

                            <div class="info-label">
                                Passenger
                            </div>

                            <div class="info-value">
                                1 Adult
                            </div>

                        </div>

                    </div>

                </div>


                <!-- Passenger Information -->

                <div class="card mb-20">

                    <h2 class="card-title">
                        Passenger Information
                    </h2>


                    <div class="info-grid">

                        <div class="info-item">

                            <div class="info-label">
                                Passenger Name
                            </div>

                            <div class="info-value">
                                John Doe
                            </div>

                        </div>


                        <div class="info-item">

                            <div class="info-label">
                                Email
                            </div>

                            <div class="info-value">
                                john@example.com
                            </div>

                        </div>


                        <div class="info-item">

                            <div class="info-label">
                                Phone
                            </div>

                            <div class="info-value">
                                +91 98765 43210
                            </div>

                        </div>


                        <div class="info-item">

                            <div class="info-label">
                                Seat
                            </div>

                            <div class="info-value">
                                To be assigned
                            </div>

                        </div>

                    </div>

                </div>


                <!-- Fare Details -->

                <div class="card mb-20">

                    <h2 class="card-title">
                        Fare Details
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


                    <div class="total-row">

                        <span>
                            Total Paid
                        </span>

                        <span>
                            ₹4,999
                        </span>

                    </div>

                </div>


                <!-- Important Information -->

                <div class="alert alert-success">

                    <strong>Success!</strong>

                    Your booking has been confirmed.
                    Please arrive at the airport at least
                    2 hours before domestic departure.

                </div>


                <!-- Action Buttons -->

                <div class="action-group"
                     style="justify-content:center;
                            margin-top:25px;">

                    <a href="mybookings.jsp"
                       class="btn btn-primary">

                        🎫 View My Bookings

                    </a>


                    <a href="index.jsp"
                       class="btn btn-outline">

                        🏠 Back to Home

                    </a>

                </div>

            </div>

        </div>

    </section>


    <!-- =========================
         FOOTER
         ========================= -->

    <jsp:include page="footer.jsp" />

</body>

</html>