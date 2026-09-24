<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.airline.utils.DatabaseConnection, com.airline.models.User" %>

<%
    User user = (User) session.getAttribute("loggedInUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String idsParam = request.getParameter("bookingIds");
    if (idsParam == null || idsParam.isEmpty()) {
        response.sendRedirect("mybookings.jsp");
        return;
    }

    String[] idArray = idsParam.split(",");
    
    Connection conn = null;
    try {
        conn = DatabaseConnection.getConnection();
        
        // Lock the tickets
        String updateSql = "UPDATE bookings SET pdf_generated = TRUE WHERE id = ? AND user_id = ?";
        PreparedStatement updatePst = conn.prepareStatement(updateSql);
        for (String idStr : idArray) {
            updatePst.setInt(1, Integer.parseInt(idStr.trim()));
            updatePst.setInt(2, user.getId());
            updatePst.executeUpdate();
        }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Official E-Tickets - SkyWay Airlines</title>
    <style>
        body { font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; background: #f1f5f9; padding: 20px; }
        .ticket { background: #fff; width: 800px; margin: 0 auto 30px; border-radius: 12px; overflow: hidden; box-shadow: 0 10px 25px rgba(0,0,0,0.1); border: 2px solid #e2e8f0; page-break-after: always; }
        .ticket-header { background: #0f172a; color: #fff; padding: 20px 30px; display: flex; justify-content: space-between; align-items: center; }
        .ticket-header h1 { margin: 0; font-size: 24px; letter-spacing: 2px; }
        .ticket-body { padding: 30px; display: flex; }
        .ticket-main { flex: 2; border-right: 2px dashed #cbd5e1; padding-right: 30px; }
        .ticket-stub { flex: 1; padding-left: 30px; }
        
        .info-group { margin-bottom: 20px; }
        .info-label { font-size: 11px; color: #64748b; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 5px; }
        .info-value { font-size: 18px; color: #0f172a; font-weight: 700; }
        
        .route { display: flex; justify-content: space-between; align-items: center; margin: 30px 0; padding: 20px; background: #f8fafc; border-radius: 8px; }
        .route h2 { margin: 0; font-size: 32px; color: #3b82f6; }
        .barcode { text-align: center; margin-top: 30px; font-family: 'Courier New', Courier, monospace; letter-spacing: 5px; font-size: 24px; color: #0f172a; }
        
        @media print {
            body { background: #fff; padding: 0; }
            .ticket { box-shadow: none; border: 2px solid #000; }
            .no-print { display: none !important; }
        }
    </style>
</head>
<body>
    
    <div class="no-print" style="text-align: center; margin-bottom: 20px;">
        <button onclick="window.print()" style="padding: 10px 20px; font-size: 16px; cursor: pointer; background: #3b82f6; color: white; border: none; border-radius: 6px;">Print / Save as PDF</button>
        <a href="mybookings.jsp" style="display: inline-block; margin-left: 15px; padding: 10px 20px; font-size: 16px; color: #3b82f6; text-decoration: none;">Return to Dashboard</a>
    </div>

<%
        // Fetch and display tickets
        String sql = "SELECT b.id AS booking_id, b.passenger_name, b.flight_class, b.total_fare, " +
                     "f.flight_number, f.origin, f.destination, f.departure_time, f.arrival_time " +
                     "FROM bookings b JOIN flights f ON b.flight_id = f.id " +
                     "WHERE b.id = ? AND b.user_id = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        
        for (String idStr : idArray) {
            pst.setInt(1, Integer.parseInt(idStr.trim()));
            pst.setInt(2, user.getId());
            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
%>
                <div class="ticket">
                    <div class="ticket-header">
                        <h1>SKYWAY AIRLINES</h1>
                        <div>BOARDING PASS</div>
                    </div>
                    <div class="ticket-body">
                        <div class="ticket-main">
                            <div class="info-group">
                                <div class="info-label">Passenger Name</div>
                                <div class="info-value"><%= rs.getString("passenger_name").toUpperCase() %></div>
                            </div>
                            
                            <div class="route">
                                <div>
                                    <div class="info-label">From</div>
                                    <h2><%= rs.getString("origin").toUpperCase() %></h2>
                                </div>
                                <div style="font-size: 24px; color: #cbd5e1;">✈</div>
                                <div style="text-align: right;">
                                    <div class="info-label">To</div>
                                    <h2><%= rs.getString("destination").toUpperCase() %></h2>
                                </div>
                            </div>
                            
                            <div style="display: flex; gap: 40px;">
                                <div class="info-group">
                                    <div class="info-label">Flight</div>
                                    <div class="info-value"><%= rs.getString("flight_number") %></div>
                                </div>
                                <div class="info-group">
                                    <div class="info-label">Departure</div>
                                    <div class="info-value"><%= rs.getTimestamp("departure_time") %></div>
                                </div>
                                <div class="info-group">
                                    <div class="info-label">Class</div>
                                    <div class="info-value"><%= rs.getString("flight_class") %></div>
                                </div>
                            </div>
                        </div>
                        <div class="ticket-stub">
                            <div class="info-group">
                                <div class="info-label">Booking Ref</div>
                                <div class="info-value">#SW<%= rs.getInt("booking_id") %></div>
                            </div>
                            <div class="info-group">
                                <div class="info-label">Fare Paid</div>
                                <div class="info-value">₹<%= rs.getDouble("total_fare") %></div>
                            </div>
                            <div class="info-group">
                                <div class="info-label">Status</div>
                                <div class="info-value" style="color: #10b981;">NON-REFUNDABLE</div>
                            </div>
                            <div class="barcode">
                                ||| | |||| | || |
                            </div>
                        </div>
                    </div>
                </div>
<%
            }
        }
%>
    <script>
        // Auto trigger print dialog
        window.onload = function() {
            setTimeout(function() {
                window.print();
            }, 500);
        };
    </script>
</body>
</html>
<%
    } catch (Exception e) {
        out.println("Error generating tickets: " + e.getMessage());
    } finally {
        if (conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>
