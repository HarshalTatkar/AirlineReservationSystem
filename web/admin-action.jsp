<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.airline.utils.DatabaseConnection" %>

<%
    // Ensure admin is logged in
    if (session.getAttribute("adminLoggedIn") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    String action = request.getParameter("action");

    if ("add".equals(action)) {
        String flightNumber = request.getParameter("flightNumber");
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String priceStr = request.getParameter("price");
        String seatsStr = request.getParameter("seats");
        String departure = request.getParameter("departure"); // YYYY-MM-DD HH:MM:SS
        
        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            // arrival time will just be departure + 2 hours for simplicity
            String sql = "INSERT INTO flights (flight_number, origin, destination, departure_time, arrival_time, price, available_seats) VALUES (?, ?, ?, ?, TIMESTAMPADD(SQL_TSI_HOUR, 2, ?), ?, ?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, flightNumber);
            pst.setString(2, origin);
            pst.setString(3, destination);
            pst.setTimestamp(4, Timestamp.valueOf(departure));
            pst.setTimestamp(5, Timestamp.valueOf(departure)); // same parameter for the TIMESTAMPADD macro
            pst.setDouble(6, Double.parseDouble(priceStr));
            pst.setInt(7, Integer.parseInt(seatsStr));
            
            int rows = pst.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("admin-dashboard.jsp?msg=Flight added successfully");
            } else {
                response.sendRedirect("admin-dashboard.jsp?err=Failed to add flight");
            }
        } catch (Exception e) {
            response.sendRedirect("admin-dashboard.jsp?err=Database Error: " + e.getMessage());
        } finally {
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }

    } else if ("delete".equals(action)) {
        String flightIdStr = request.getParameter("flightId");
        
        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            // Delete associated bookings first to avoid foreign key constraints
            String sqlBookings = "DELETE FROM bookings WHERE flight_id = ?";
            PreparedStatement pstBookings = conn.prepareStatement(sqlBookings);
            pstBookings.setInt(1, Integer.parseInt(flightIdStr));
            pstBookings.executeUpdate();
            
            // Delete the flight
            String sql = "DELETE FROM flights WHERE id = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, Integer.parseInt(flightIdStr));
            int rows = pst.executeUpdate();
            
            if (rows > 0) {
                response.sendRedirect("admin-dashboard.jsp?msg=Flight deleted successfully");
            } else {
                response.sendRedirect("admin-dashboard.jsp?err=Failed to delete flight");
            }
        } catch (Exception e) {
            response.sendRedirect("admin-dashboard.jsp?err=Database Error: " + e.getMessage());
        } finally {
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    } else {
        response.sendRedirect("admin-dashboard.jsp");
    }
%>
