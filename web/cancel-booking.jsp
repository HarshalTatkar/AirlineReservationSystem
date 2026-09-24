<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.airline.utils.DatabaseConnection, com.airline.models.User" %>

<%
    User user = (User) session.getAttribute("loggedInUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String bookingIdStr = request.getParameter("bookingId");
    if (bookingIdStr == null || bookingIdStr.trim().isEmpty()) {
        response.sendRedirect("mybookings.jsp?err=Invalid Booking ID");
        return;
    }

    int bookingId = Integer.parseInt(bookingIdStr);

    Connection conn = null;
    try {
        conn = DatabaseConnection.getConnection();
        // First verify this booking belongs to the logged-in user and get the details
        String checkSql = "SELECT b.flight_id, b.status, b.flight_class, b.total_fare, b.pdf_generated FROM bookings b WHERE b.id = ? AND b.user_id = ?";
        PreparedStatement checkPst = conn.prepareStatement(checkSql);
        checkPst.setInt(1, bookingId);
        checkPst.setInt(2, user.getId());
        
        ResultSet rs = checkPst.executeQuery();
        if (rs.next()) {
            String status = rs.getString("status");
            if ("CANCELLED".equals(status)) {
                response.sendRedirect("mybookings.jsp?err=Booking is already cancelled");
                return;
            }
            if (rs.getBoolean("pdf_generated")) {
                response.sendRedirect("mybookings.jsp?err=Cannot cancel. Official ticket has already been issued.");
                return;
            }
            
            int flightId = rs.getInt("flight_id");
            double totalFare = rs.getDouble("total_fare");
            String flightClass = rs.getString("flight_class");
            double refund = totalFare * 0.50; // 50% refund

            // Update status to CANCELLED
            String updateBooking = "UPDATE bookings SET status = 'CANCELLED' WHERE id = ?";
            PreparedStatement pstBooking = conn.prepareStatement(updateBooking);
            pstBooking.setInt(1, bookingId);
            pstBooking.executeUpdate();

            // Increment available seats for specific class
            String seatCol = "";
            if ("Economy".equals(flightClass)) seatCol = "eco_seats";
            else if ("Business".equals(flightClass)) seatCol = "bus_seats";
            else if ("First".equals(flightClass)) seatCol = "first_seats";

            if (!seatCol.isEmpty()) {
                String updateFlight = "UPDATE flights SET " + seatCol + " = " + seatCol + " + 1 WHERE id = ?";
                PreparedStatement pstFlight = conn.prepareStatement(updateFlight);
                pstFlight.setInt(1, flightId);
                pstFlight.executeUpdate();
            }

            // Redirect back with success message
            String successMsg = "Booking Cancelled Successfully. A refund of Rs." + refund + " (50%) will be credited to your original payment method in 3-5 business days.";
            response.sendRedirect("mybookings.jsp?msg=" + java.net.URLEncoder.encode(successMsg, "UTF-8"));

        } else {
            response.sendRedirect("mybookings.jsp?err=Booking not found or you don't have permission to cancel it.");
        }
    } catch (Exception e) {
        response.sendRedirect("mybookings.jsp?err=Error processing cancellation: " + e.getMessage());
    } finally {
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
