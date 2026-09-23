package com.airline.controllers;

import com.airline.models.User;
import com.airline.utils.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            // User not logged in, redirect to login
            response.sendRedirect("login.jsp?error=Please login to book a flight");
            return;
        }

        User user = (User) session.getAttribute("loggedInUser");
        String flightIdStr = request.getParameter("flightId");
        String passengerName = request.getParameter("passengerName");

        if (flightIdStr == null || passengerName == null) {
            response.sendRedirect("index.jsp?error=Invalid booking details");
            return;
        }

        int flightId = Integer.parseInt(flightIdStr);

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                // Insert booking
                String sql = "INSERT INTO bookings (user_id, flight_id, passenger_name) VALUES (?, ?, ?)";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setInt(1, user.getId());
                pst.setInt(2, flightId);
                pst.setString(3, passengerName);

                int rowsAffected = pst.executeUpdate();
                if (rowsAffected > 0) {
                    // Reduce available seats
                    String updateSql = "UPDATE flights SET available_seats = available_seats - 1 WHERE id = ?";
                    PreparedStatement updatePst = conn.prepareStatement(updateSql);
                    updatePst.setInt(1, flightId);
                    updatePst.executeUpdate();

                    response.sendRedirect("booking-confirmation.jsp?msg=Booking Successful");
                } else {
                    response.sendRedirect("index.jsp?error=Booking Failed");
                }
            } else {
                response.sendRedirect("index.jsp?error=Database connection failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=Database Error: " + e.getMessage());
        }
    }
}
