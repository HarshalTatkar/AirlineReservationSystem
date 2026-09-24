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
        String ecoPriceStr = request.getParameter("ecoPrice");
        String ecoSeatsStr = request.getParameter("ecoSeats");
        String busPriceStr = request.getParameter("busPrice");
        String busSeatsStr = request.getParameter("busSeats");
        String firstPriceStr = request.getParameter("firstPrice");
        String firstSeatsStr = request.getParameter("firstSeats");
        String departureStr = request.getParameter("departure"); 
        // HTML datetime-local usually returns YYYY-MM-DDTHH:MM
        if (departureStr != null && departureStr.contains("T")) {
            departureStr = departureStr.replace("T", " ");
        }
        // Append seconds if missing
        if (departureStr != null && departureStr.length() == 16) {
            departureStr += ":00";
        }
        
        Timestamp depTimestamp = Timestamp.valueOf(departureStr);
        // arrival time will just be departure + 2 hours (in milliseconds)
        Timestamp arrTimestamp = new Timestamp(depTimestamp.getTime() + (2 * 60 * 60 * 1000));
        
        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            
            // Check for duplicate flight number
            String checkSql = "SELECT id FROM flights WHERE flight_number = ?";
            PreparedStatement checkPst = conn.prepareStatement(checkSql);
            checkPst.setString(1, flightNumber);
            ResultSet checkRs = checkPst.executeQuery();
            if (checkRs.next()) {
                response.sendRedirect("admin-dashboard.jsp?err=Flight Number '" + flightNumber + "' already exists. Please use a unique flight number.");
                return;
            }
            
            String sql = "INSERT INTO flights (flight_number, origin, destination, departure_time, arrival_time, eco_price, eco_seats, bus_price, bus_seats, first_price, first_seats) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, flightNumber);
            pst.setString(2, origin);
            pst.setString(3, destination);
            pst.setTimestamp(4, depTimestamp);
            pst.setTimestamp(5, arrTimestamp);
            pst.setDouble(6, Double.parseDouble(ecoPriceStr));
            pst.setInt(7, Integer.parseInt(ecoSeatsStr));
            pst.setDouble(8, Double.parseDouble(busPriceStr));
            pst.setInt(9, Integer.parseInt(busSeatsStr));
            pst.setDouble(10, Double.parseDouble(firstPriceStr));
            pst.setInt(11, Integer.parseInt(firstSeatsStr));
            
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
