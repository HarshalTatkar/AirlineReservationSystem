<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>SkyWay Airlines - Airline Reservation System</title>

    <!-- Main CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <!-- =========================
         HEADER
         ========================= -->

    <jsp:include page="header.jsp" />


    <!-- =========================
         HERO SECTION
         ========================= -->

    <section class="hero">

        <div class="container">

            <div class="hero-content">

                <h1 class="hero-title">

                    Fly Higher.
                    <span>Travel Smarter.</span>

                </h1>

                <p class="hero-description">

                    Search and explore available flights,
                    choose your preferred journey, and
                    make your travel reservation easily.

                </p>

                <a href="#search"
                   class="btn btn-primary">

                    🔍 Search Flights

                </a>

            </div>

        </div>

    </section>


    <!-- =========================
         FLIGHT SEARCH SECTION
         ========================= -->

    <section class="search-section"
             id="search">

        <div class="container">

            <div class="search-card">

                <h2 class="search-title">

                    🔎 Search Flights

                </h2>


                <!-- Search Form -->

                <form action="${pageContext.request.contextPath}/FlightSearchServlet"
                      method="get"
                      class="search-form">

                    <c:if test="${not empty param.error}">
                        <div class="alert alert-error" style="grid-column: 1 / -1;">
                            ${param.error}
                        </div>
                    </c:if>


                    <!-- From -->

                    <div class="form-group">

                        <label for="from">

                            From

                        </label>

                        <select id="from"
                                name="from"
                                class="form-control"
                                required>

                            <option value="">Select departure city</option>
                            <option value="Ahmedabad">Ahmedabad (AMD)</option>
                            <option value="Bangalore">Bangalore (BLR)</option>
                            <option value="Chennai">Chennai (MAA)</option>
                            <option value="Delhi">Delhi (DEL)</option>
                            <option value="Goa">Goa (GOI)</option>
                            <option value="Hyderabad">Hyderabad (HYD)</option>
                            <option value="Jaipur">Jaipur (JAI)</option>
                            <option value="Kochi">Kochi (COK)</option>
                            <option value="Kolkata">Kolkata (CCU)</option>
                            <option value="Mumbai">Mumbai (BOM)</option>
                            <option value="Pune">Pune (PNQ)</option>

                        </select>

                    </div>


                    <!-- To -->

                    <div class="form-group">

                        <label for="to">

                            To

                        </label>

                        <select id="to"
                                name="to"
                                class="form-control"
                                required>

                            <option value="">Select destination city</option>
                            <option value="Ahmedabad">Ahmedabad (AMD)</option>
                            <option value="Bangalore">Bangalore (BLR)</option>
                            <option value="Chennai">Chennai (MAA)</option>
                            <option value="Delhi">Delhi (DEL)</option>
                            <option value="Goa">Goa (GOI)</option>
                            <option value="Hyderabad">Hyderabad (HYD)</option>
                            <option value="Jaipur">Jaipur (JAI)</option>
                            <option value="Kochi">Kochi (COK)</option>
                            <option value="Kolkata">Kolkata (CCU)</option>
                            <option value="Mumbai">Mumbai (BOM)</option>
                            <option value="Pune">Pune (PNQ)</option>

                        </select>

                    </div>


                    <!-- Travel Date -->

                    <div class="form-group">

                        <label for="travelDate">

                            Travel Date

                        </label>

                        <input type="date"
                               id="travelDate"
                               name="travelDate"
                               class="form-control"
                               required>

                    </div>


                    <!-- Passengers -->

                    <div class="form-group">

                        <label for="passengers">

                            Passengers

                        </label>

                        <select id="passengers"
                                name="passengers"
                                class="form-control"
                                required>

                            <option value="1">
                                1 Passenger
                            </option>

                            <option value="2">
                                2 Passengers
                            </option>

                            <option value="3">
                                3 Passengers
                            </option>

                            <option value="4">
                                4 Passengers
                            </option>

                            <option value="5">
                                5 Passengers
                            </option>

                            <option value="6">
                                6 Passengers
                            </option>

                        </select>

                    </div>


                    <!-- Search Button -->

                    <div class="form-group">

                        <button type="submit"
                                class="btn btn-primary">

                            Search

                        </button>

                    </div>

                </form>

            </div>

        </div>

    </section>


    <!-- =========================
         WHY CHOOSE US
         ========================= -->

    <section class="section section-light">

        <div class="container">

            <h2 class="section-title">

                Why Choose SkyWay?

            </h2>

            <p class="section-subtitle">

                We make your flight reservation experience
                simple, convenient, and reliable.

            </p>


            <div class="feature-grid">


                <!-- Feature 1 -->

                <div class="feature-card">

                    <div class="feature-icon">

                        🔍

                    </div>

                    <h3>

                        Easy Flight Search

                    </h3>

                    <p>

                        Quickly search for flights using
                        your departure city, destination,
                        travel date, and passengers.

                    </p>

                </div>


                <!-- Feature 2 -->

                <div class="feature-card">

                    <div class="feature-icon">

                        ✈️

                    </div>

                    <h3>

                        Convenient Booking

                    </h3>

                    <p>

                        Select your preferred flight and
                        enter passenger details through
                        a simple booking process.

                    </p>

                </div>


                <!-- Feature 3 -->

                <div class="feature-card">

                    <div class="feature-icon">

                        🎫

                    </div>

                    <h3>

                        Easy Booking Management

                    </h3>

                    <p>

                        View your booking information and
                        keep track of your reservation
                        details in one place.

                    </p>

                </div>


            </div>

        </div>

    </section>


    <!-- =========================
         POPULAR DESTINATIONS
         ========================= -->

    <section class="section">

        <div class="container">

            <h2 class="section-title">

                Popular Destinations

            </h2>

            <p class="section-subtitle">

                Explore some of the popular routes
                available through our reservation system.

            </p>


            <div class="feature-grid">


                <!-- Mumbai -->

                <div class="feature-card">

                    <div class="feature-icon">

                        🌆

                    </div>

                    <h3>

                        Mumbai

                    </h3>

                    <p>

                        Gateway to India's financial
                        and entertainment capital.

                    </p>

                    <br>

                    <a href="${pageContext.request.contextPath}/FlightSearchServlet?to=Mumbai"
                       class="btn btn-outline">

                        View Flights

                    </a>

                </div>


                <!-- Delhi -->

                <div class="feature-card">

                    <div class="feature-icon">

                        🏛️

                    </div>

                    <h3>

                        Delhi

                    </h3>

                    <p>

                        Discover India's historic
                        capital and major landmarks.

                    </p>

                    <br>

                    <a href="${pageContext.request.contextPath}/FlightSearchServlet?to=Delhi"
                       class="btn btn-outline">

                        View Flights

                    </a>

                </div>


                <!-- Bangalore -->

                <div class="feature-card">

                    <div class="feature-icon">

                        🌇

                    </div>

                    <h3>

                        Bangalore

                    </h3>

                    <p>

                        Experience India's technology
                        and innovation hub.

                    </p>

                    <br>

                    <a href="${pageContext.request.contextPath}/FlightSearchServlet?to=Bangalore"
                       class="btn btn-outline">

                        View Flights

                    </a>

                </div>


            </div>

        </div>

    </section>


    <!-- =========================
         FOOTER
         ========================= -->

    <jsp:include page="footer.jsp" />


    <!-- =========================
         JAVASCRIPT
         ========================= -->

    <script src="${pageContext.request.contextPath}/js/validation.js"></script>

</body>

</html>