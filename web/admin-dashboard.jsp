<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, com.airline.utils.DatabaseConnection" %>

<%
    // Check authentication if it's a POST request from login
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        if ("admin".equals(user) && "admin123".equals(pass)) {
            session.setAttribute("adminLoggedIn", true);
        } else {
            response.sendRedirect("admin-login.jsp?error=Invalid credentials");
            return;
        }
    }

    // Check if admin session exists
    if (session.getAttribute("adminLoggedIn") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - SkyWay Airlines</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .admin-panel { padding: 50px 0; }
        .admin-card { background: #ffffff; border-radius: 12px; padding: 30px; box-shadow: 0 4px 15px rgba(0,0,0,0.03); border: 1px solid #e2e8f0; margin-bottom: 30px; }
        .flights-table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .flights-table th, .flights-table td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #e2e8f0; }
        .flights-table th { background: #f8fafc; font-weight: 600; color: #64748b; text-transform: uppercase; font-size: 13px; }
        .flights-table tr:hover { background: #f0f4ff; }
        .btn-sm { padding: 6px 12px; font-size: 13px; border-radius: 6px; }
        .btn-danger { background: #ef4444; color: white; border: none; cursor: pointer; }
        .btn-danger:hover { background: #dc2626; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="page-header" style="padding: 50px 0 30px;">
        <div class="container">
            <h1>Admin Dashboard</h1>
            <p>Manage flights and system parameters</p>
        </div>
    </section>

    <section class="admin-panel">
        <div class="container">
            
            <%
                String msg = request.getParameter("msg");
                if (msg != null) {
            %>
                <div class="alert alert-success">
                    <%= msg %>
                </div>
            <%
                }
            %>
            
            <%
                String err = request.getParameter("err");
                if (err != null) {
            %>
                <div class="alert alert-error">
                    <%= err %>
                </div>
            <%
                }
            %>

            <!-- Add Flight Form -->
            <div class="admin-card">
                <h3 style="margin-bottom: 20px; color: #0f172a;">Add New Flight</h3>
                <form action="admin-action.jsp" method="post" style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 15px; align-items: end;">
                    <input type="hidden" name="action" value="add">
                    
                    <div class="form-group">
                        <label>Flight Number</label>
                        <input type="text" name="flightNumber" class="form-control" required placeholder="e.g. SW101">
                    </div>
                    <div class="form-group">
                        <label>Origin</label>
                        <input type="text" name="origin" class="form-control" required placeholder="e.g. Mumbai">
                    </div>
                    <div class="form-group">
                        <label>Destination</label>
                        <input type="text" name="destination" class="form-control" required placeholder="e.g. Delhi">
                    </div>
                    <div class="form-group">
                        <label>Price (₹)</label>
                        <input type="number" name="price" class="form-control" required step="0.01">
                    </div>
                    <div class="form-group">
                        <label>Available Seats</label>
                        <input type="number" name="seats" class="form-control" required>
                    </div>
                    <div class="form-group" style="grid-column: span 2;">
                        <label>Departure Time (YYYY-MM-DD HH:MM:SS)</label>
                        <input type="text" name="departure" class="form-control" required placeholder="2026-10-15 10:00:00">
                    </div>
                    <div class="form-group" style="grid-column: span 1;">
                        <label>&nbsp;</label>
                        <button type="submit" class="btn btn-primary" style="width: 100%; height: 52px;">Add Flight</button>
                    </div>
                </form>
            </div>

            <!-- List Flights -->
            <div class="admin-card">
                <h3 style="color: #0f172a;">All Flights Database</h3>
                <table class="flights-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Flight No.</th>
                            <th>Origin</th>
                            <th>Destination</th>
                            <th>Departure</th>
                            <th>Price</th>
                            <th>Seats</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            Connection conn = null;
                            try {
                                conn = DatabaseConnection.getConnection();
                                if (conn != null) {
                                    String sql = "SELECT * FROM flights ORDER BY id DESC";
                                    PreparedStatement pst = conn.prepareStatement(sql);
                                    ResultSet rs = pst.executeQuery();
                                    while (rs.next()) {
                        %>
                                        <tr>
                                            <td><%= rs.getInt("id") %></td>
                                            <td><strong><%= rs.getString("flight_number") %></strong></td>
                                            <td><%= rs.getString("origin") %></td>
                                            <td><%= rs.getString("destination") %></td>
                                            <td><%= rs.getTimestamp("departure_time") %></td>
                                            <td>₹<%= rs.getDouble("price") %></td>
                                            <td><%= rs.getInt("available_seats") %></td>
                                            <td>
                                                <form action="admin-action.jsp" method="post" style="margin:0;">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="flightId" value="<%= rs.getInt("id") %>">
                                                    <button type="submit" class="btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this flight?');">Delete</button>
                                                </form>
                                            </td>
                                        </tr>
                        <%
                                    }
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='8'>Error loading flights: " + e.getMessage() + "</td></tr>");
                            } finally {
                                if (conn != null) try { conn.close(); } catch (Exception e) {}
                            }
                        %>
                    </tbody>
                </table>
            </div>

        </div>
    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>
