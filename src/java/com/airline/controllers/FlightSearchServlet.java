package com.airline.controllers;

import com.airline.models.Flight;
import com.airline.utils.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FlightSearchServlet", urlPatterns = {"/FlightSearchServlet"})
public class FlightSearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String origin = request.getParameter("from");
        String destination = request.getParameter("to");

        List<Flight> flights = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                String sql;
                PreparedStatement pst;
                
                if (origin == null || origin.trim().isEmpty()) {
                    sql = "SELECT * FROM flights WHERE destination = ? AND available_seats > 0";
                    pst = conn.prepareStatement(sql);
                    pst.setString(1, destination);
                } else {
                    sql = "SELECT * FROM flights WHERE origin = ? AND destination = ? AND available_seats > 0";
                    pst = conn.prepareStatement(sql);
                    pst.setString(1, origin);
                    pst.setString(2, destination);
                }

                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    Flight flight = new Flight();
                    flight.setId(rs.getInt("id"));
                    flight.setFlightNumber(rs.getString("flight_number"));
                    flight.setOrigin(rs.getString("origin"));
                    flight.setDestination(rs.getString("destination"));
                    flight.setDepartureTime(rs.getTimestamp("departure_time"));
                    flight.setArrivalTime(rs.getTimestamp("arrival_time"));
                    flight.setPrice(rs.getDouble("price"));
                    flight.setAvailableSeats(rs.getInt("available_seats"));
                    
                    flights.add(flight);
                }
                
                // Store flight list in request attribute for the JSP to read
                request.setAttribute("flightList", flights);
                
                // Use RequestDispatcher to forward to results page (as per Practical 2a)
                RequestDispatcher dispatcher = request.getRequestDispatcher("flight-results.jsp");
                dispatcher.forward(request, response);
                
            } else {
                response.sendRedirect("index.jsp?error=Database connection failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=Database Error: " + e.getMessage());
        }
    }
}
