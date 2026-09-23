<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Flights - SkyWay Airlines</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="page-header">
        <div class="container">
            <h1>Available Flights</h1>
            <p>Choose the flight that best suits your journey.</p>
        </div>
    </section>

    <section class="results-section">
        <div class="container">

            <!-- Search Summary -->
            <div class="card" style="margin-bottom: 30px;">
                <div class="card-header" style="margin-bottom: 0;">
                    <div>
                        <h2 class="card-title" style="margin-bottom: 5px;">
                            ${param.origin} → ${param.destination}
                        </h2>
                        <p style="color: #64748b; font-weight: 500;">
                            Travel Date: ${param.travelDate} &nbsp; | &nbsp; ${param.passengers} Passenger(s)
                        </p>
                    </div>
                    <a href="index.jsp#search" class="btn btn-outline">Modify Search</a>
                </div>
            </div>

            <!-- Results Header -->
            <div class="results-header">
                <div>
                    <h2>Available Flights</h2>
                    <span class="results-count">
                        <c:choose>
                            <c:when test="${not empty flightList}">
                                ${flightList.size()} flights found
                            </c:when>
                            <c:otherwise>
                                0 flights found
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </div>

            <!-- Dynamic Flight Results -->
            <c:choose>
                <c:when test="${not empty flightList}">
                    <c:forEach var="flight" items="${flightList}">
                        <div class="flight-card">
                            <div class="flight-main" style="width: 100%;">
                                <!-- Airline -->
                                <div class="airline-info">
                                    <div class="airline-logo">✈</div>
                                    <div>
                                        <div class="airline-name">SkyWay Airlines</div>
                                        <div class="flight-number">${flight.flightNumber}</div>
                                    </div>
                                </div>

                                <!-- Route -->
                                <div class="flight-route">
                                    <div class="route-endpoint">
                                        <div class="time">${flight.departureTime.toString().substring(11, 16)}</div>
                                        <div class="city">${flight.origin}</div>
                                    </div>
                                    <div class="route-line"></div>
                                    <div class="route-endpoint">
                                        <div class="time">${flight.arrivalTime.toString().substring(11, 16)}</div>
                                        <div class="city">${flight.destination}</div>
                                    </div>
                                </div>

                                <!-- Price -->
                                <div class="flight-price">
                                    <div class="price">₹${flight.price}</div>
                                    <div class="price-label">per passenger</div>
                                    <div class="seats-available">${flight.availableSeats} seats available</div>
                                    <br>
                                    <form action="${pageContext.request.contextPath}/booking.jsp" method="post">
                                        <input type="hidden" name="flightId" value="${flight.id}">
                                        <input type="hidden" name="flightNumber" value="${flight.flightNumber}">
                                        <input type="hidden" name="origin" value="${flight.origin}">
                                        <input type="hidden" name="destination" value="${flight.destination}">
                                        <input type="hidden" name="price" value="${flight.price}">
                                        <button type="submit" class="btn btn-primary btn-small">Book Now</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-error">
                        No flights found for this route. Please try modifying your search.
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>