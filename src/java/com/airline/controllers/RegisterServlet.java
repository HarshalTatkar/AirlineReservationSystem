package com.airline.controllers;

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

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                String sql = "INSERT INTO users (username, password, email, fullname, phone) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, password);
                pst.setString(3, email);
                pst.setString(4, fullname);
                pst.setString(5, phone);

                int rowsAffected = pst.executeUpdate();
                if (rowsAffected > 0) {
                    // Success, redirect to login
                    response.sendRedirect("login.jsp?msg=Registration Successful");
                } else {
                    // Failure
                    response.sendRedirect("register.jsp?error=Registration Failed");
                }
            } else {
                response.sendRedirect("register.jsp?error=Database connection failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Database Error: " + e.getMessage());
        }
    }
}
