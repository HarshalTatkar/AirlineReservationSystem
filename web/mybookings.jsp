<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.airline.utils.DatabaseConnection, com.airline.models.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings - SkyWay Airlines</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="page-header">
        <div class="container">
            <h1>My Bookings</h1>
            <p>View and manage your flight reservations.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">

            <%
                User user = (User) session.getAttribute("loggedInUser");
                if (user == null) {
            %>
                <div class="alert alert-error">
                    Please log in to view your bookings.
                </div>
            <%
                } else {
                    String msg = request.getParameter("msg");
                    if (msg != null) {
            %>
                        <div class="alert alert-success">
                            <%= msg %>
                        </div>
            <%
                    }
                    
                    String err = request.getParameter("err");
                    if (err != null) {
            %>
                        <div class="alert alert-error">
                            <%= err %>
                        </div>
            <%
                    }

                    Connection conn = null;
                    try {
                        conn = DatabaseConnection.getConnection();
                        String sql = "SELECT b.id AS booking_id, b.status, b.passenger_name, b.booking_date, " +
                                     "f.flight_number, f.origin, f.destination, f.departure_time, f.arrival_time, f.price " +
                                     "FROM bookings b JOIN flights f ON b.flight_id = f.id " +
                                     "WHERE b.user_id = ? ORDER BY b.id DESC";
                        PreparedStatement pst = conn.prepareStatement(sql);
                        pst.setInt(1, user.getId());
                        ResultSet rs = pst.executeQuery();
                        
                        boolean hasBookings = false;
                        
                        while(rs.next()) {
                            hasBookings = true;
                            String status = rs.getString("status");
                            if (status == null) status = "CONFIRMED"; // fallback if schema doesn't have default
                            
                            String badgeClass = status.equals("CANCELLED") ? "sold-out" : "seats-available";
            %>
                            <div class="booking-card" style="background:#fff; border-radius:15px; padding:25px; margin-bottom:20px; box-shadow:0 4px 15px rgba(0,0,0,0.03); border:1px solid #e2e8f0;">
                                <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #e2e8f0; padding-bottom:15px; margin-bottom:15px;">
                                    <div>
                                        <span style="font-size:12px; color:#64748b; text-transform:uppercase; letter-spacing:1px; font-weight:600;">Booking Reference</span>
                                        <h3 style="color:#0f172a; margin-top:5px;">#SW<%= rs.getInt("booking_id") %></h3>
                                    </div>
                                    <span class="<%= badgeClass %>"><%= status %></span>
                                </div>
                                
                                <div style="display:flex; gap:30px; align-items:center;">
                                    <div style="flex:1;">
                                        <div style="color:#64748b; font-size:13px; font-weight:600;"><%= rs.getString("flight_number") %></div>
                                        <div style="font-size:20px; font-weight:800; color:#0f172a;"><%= rs.getString("origin") %> → <%= rs.getString("destination") %></div>
                                        <div style="color:#64748b; font-size:14px; margin-top:5px;">Departure: <%= rs.getTimestamp("departure_time") %></div>
                                    </div>
                                    
                                    <div style="flex:1; border-left:1px solid #e2e8f0; padding-left:30px;">
                                        <div style="margin-bottom:8px;"><span style="color:#64748b;">Passenger:</span> <strong><%= rs.getString("passenger_name") %></strong></div>
                                        <div style="margin-bottom:8px;"><span style="color:#64748b;">Total Fare:</span> <strong>₹<%= rs.getDouble("price") %></strong></div>
                                        <div><span style="color:#64748b;">Booked On:</span> <strong><%= rs.getTimestamp("booking_date") %></strong></div>
                                    </div>
                                    
                                    <div style="display:flex; flex-direction:column; gap:10px; align-items:flex-end;">
                                        <a href="booking-confirmation.jsp" class="btn btn-outline" style="padding:8px 20px; border:2px solid #3b82f6; color:#3b82f6; border-radius:8px;">View Details</a>
                                        
                                        <% if (!"CANCELLED".equals(status)) { %>
                                            <a href="cancel-booking.jsp?bookingId=<%= rs.getInt("booking_id") %>" class="btn" style="background:#ef4444; color:#fff; padding:8px 20px; border-radius:8px;" onclick="return confirm('Are you sure you want to cancel this booking? Cancellation charges may apply.');">Cancel Booking</a>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
            <%
                        }
                        
                        if (!hasBookings) {
            %>
                            <div class="alert alert-info" style="background:#eff6ff; color:#3b82f6; border:1px solid #bfdbfe;">
                                You don't have any bookings yet. <a href="index.jsp" style="font-weight:700; text-decoration:underline;">Book a flight now!</a>
                            </div>
            <%
                        }
                    } catch (Exception e) {
            %>
                        <div class="alert alert-error">
                            Error loading bookings: <%= e.getMessage() %>
                        </div>
            <%
                    } finally {
                        if (conn != null) try { conn.close(); } catch (Exception e) {}
                    }
                }
            %>

        </div>
    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>