<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.airline.utils.DatabaseConnection, com.airline.models.User, java.util.ArrayList" %>

<%
    User user = (User) session.getAttribute("loggedInUser");
    if (user == null) {
        response.sendRedirect("login.jsp?error=Please login to book a flight");
        return;
    }

    String flightIdStr = request.getParameter("flightId");
    String flightClass = request.getParameter("flightClass");
    String totalFareStr = request.getParameter("totalFare");
    String numPassengersStr = request.getParameter("numPassengers");

    if (flightIdStr == null || numPassengersStr == null) {
        response.sendRedirect("index.jsp?error=Invalid booking details");
        return;
    }

    int flightId = Integer.parseInt(flightIdStr);
    int numPassengers = Integer.parseInt(numPassengersStr);
    double totalFare = Double.parseDouble(totalFareStr);
    double perPassengerFare = totalFare / numPassengers;

    ArrayList<Integer> generatedIds = new ArrayList<Integer>();

    Connection conn = null;
    try {
        conn = DatabaseConnection.getConnection();
        conn.setAutoCommit(false); // Start transaction

        // 1. Check and reduce seat count for the specific class
        String seatCol = "";
        if ("Economy".equals(flightClass)) seatCol = "eco_seats";
        else if ("Business".equals(flightClass)) seatCol = "bus_seats";
        else if ("First".equals(flightClass)) seatCol = "first_seats";

        // Verify seats
        String checkSql = "SELECT " + seatCol + " FROM flights WHERE id = ?";
        PreparedStatement checkPst = conn.prepareStatement(checkSql);
        checkPst.setInt(1, flightId);
        ResultSet checkRs = checkPst.executeQuery();
        if (checkRs.next()) {
            if (checkRs.getInt(1) < numPassengers) {
                conn.rollback();
                response.sendRedirect("index.jsp?error=Not enough seats available in the selected class.");
                return;
            }
        }

        String updateSql = "UPDATE flights SET " + seatCol + " = " + seatCol + " - ? WHERE id = ?";
        PreparedStatement updatePst = conn.prepareStatement(updateSql);
        updatePst.setInt(1, numPassengers);
        updatePst.setInt(2, flightId);
        updatePst.executeUpdate();

        // 2. Insert bookings for each passenger
        String insertSql = "INSERT INTO bookings (user_id, flight_id, passenger_name, flight_class, total_fare) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement insertPst = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);
        
        for (int i = 1; i <= numPassengers; i++) {
            String pName = request.getParameter("passengerName_" + i);
            insertPst.setInt(1, user.getId());
            insertPst.setInt(2, flightId);
            insertPst.setString(3, pName);
            insertPst.setString(4, flightClass);
            insertPst.setDouble(5, perPassengerFare);
            insertPst.executeUpdate();
            
            ResultSet rsKeys = insertPst.getGeneratedKeys();
            if (rsKeys.next()) {
                generatedIds.add(rsKeys.getInt(1));
            }
        }

        conn.commit(); // Commit transaction
        
        // Build comma separated string of IDs
        StringBuilder idsParam = new StringBuilder();
        for (int i = 0; i < generatedIds.size(); i++) {
            idsParam.append(generatedIds.get(i));
            if (i < generatedIds.size() - 1) idsParam.append(",");
        }

        response.sendRedirect("invoice.jsp?bookingIds=" + idsParam.toString());

    } catch (Exception e) {
        if (conn != null) {
            try { conn.rollback(); } catch(Exception ex) {}
        }
        response.sendRedirect("index.jsp?error=Error processing payment: " + e.getMessage());
    } finally {
        if (conn != null) {
            try { 
                conn.setAutoCommit(true);
                conn.close(); 
            } catch(Exception e) {}
        }
    }
%>
