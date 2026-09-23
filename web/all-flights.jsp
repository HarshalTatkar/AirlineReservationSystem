<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, com.airline.utils.DatabaseConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Flights - SkyWay Airlines</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="page-header">
        <div class="container">
            <h1>General Dashboard</h1>
            <p>View all available flights across all routes.</p>
        </div>
    </section>

    <section class="results-section">
        <div class="container">

            <div class="results-header">
                <div>
                    <h2>Available Flights</h2>
                </div>
            </div>

            <% 
                Connection conn = null;
                try {
                    conn = DatabaseConnection.getConnection();
                    if (conn != null) {
                        String sql = "SELECT * FROM flights WHERE available_seats > 0 ORDER BY departure_time ASC";
                        PreparedStatement pst = conn.prepareStatement(sql);
                        ResultSet rs = pst.executeQuery();
                        
                        boolean hasFlights = false;

                        while (rs.next()) {
                            hasFlights = true;
            %>
                            <div class="flight-card">
                                <div class="flight-main" style="width: 100%;">
                                    <div class="airline-info">
                                        <div class="airline-logo">✈</div>
                                        <div>
                                            <div class="airline-name">SkyWay Airlines</div>
                                            <div class="flight-number"><%= rs.getString("flight_number") %></div>
                                        </div>
                                    </div>

                                    <div class="flight-route">
                                        <div class="route-endpoint">
                                            <div class="time"><%= rs.getTimestamp("departure_time").toString().substring(11, 16) %></div>
                                            <div class="city"><%= rs.getString("origin") %></div>
                                        </div>
                                        <div class="route-line"></div>
                                        <div class="route-endpoint">
                                            <div class="time"><%= rs.getTimestamp("arrival_time").toString().substring(11, 16) %></div>
                                            <div class="city"><%= rs.getString("destination") %></div>
                                        </div>
                                    </div>

                                    <div class="flight-price">
                                        <div class="price">₹<%= rs.getDouble("price") %></div>
                                        <div class="price-label">per passenger</div>
                                        <div class="seats-available"><%= rs.getInt("available_seats") %> seats available</div>
                                        <br>
                                        <form action="${pageContext.request.contextPath}/booking.jsp" method="post">
                                            <input type="hidden" name="flightId" value="<%= rs.getInt("id") %>">
                                            <input type="hidden" name="flightNumber" value="<%= rs.getString("flight_number") %>">
                                            <input type="hidden" name="origin" value="<%= rs.getString("origin") %>">
                                            <input type="hidden" name="destination" value="<%= rs.getString("destination") %>">
                                            <input type="hidden" name="price" value="<%= rs.getDouble("price") %>">
                                            <button type="submit" class="btn btn-primary btn-small">Book Now</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
            <%
                        }
                        
                        if (!hasFlights) {
            %>
                            <div class="alert alert-error">
                                No flights available at the moment.
                            </div>
            <%
                        }
                    } else {
            %>
                        <div class="alert alert-error">
                            Database connection failed.
                        </div>
            <%
                    }
                } catch (Exception e) {
            %>
                    <div class="alert alert-error">
                        Error retrieving flights: <%= e.getMessage() %>
                    </div>
            <%
                } finally {
                    if (conn != null) try { conn.close(); } catch (Exception e) {}
                }
            %>

        </div>
    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>
