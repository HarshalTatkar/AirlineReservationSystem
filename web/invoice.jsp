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
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmed - SkyWay Airlines</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="page-header" style="background: #10b981; color: white;">
        <div class="container">
            <h1>Booking Successful!</h1>
            <p>Your payment has been received and your seats are reserved.</p>
        </div>
    </section>

    <section class="section">
        <div class="container" style="max-width: 600px; margin: 0 auto; text-align: center;">
            
            <div class="card" style="margin-bottom: 30px;">
                <h2 style="color: #0f172a; margin-bottom: 15px;">What's Next?</h2>
                <p style="color: #64748b; margin-bottom: 25px; line-height: 1.6;">
                    Your booking references have been created. You can cancel these bookings from your Dashboard for a 50% refund, <strong>UNLESS</strong> you generate the official PDF E-Tickets. 
                    <br><br>
                    <span style="color: #ef4444; font-weight: 600;">Once official PDFs are generated, the booking is locked and strictly non-refundable.</span>
                </p>

                <form action="lock-tickets.jsp" method="post">
                    <input type="hidden" name="bookingIds" value="<%= idsParam %>">
                    <button type="submit" class="btn btn-primary btn-block" style="font-size: 16px; background: #0f172a;">
                        📄 Generate Official PDF Tickets
                    </button>
                </form>

                <br>
                <a href="mybookings.jsp" class="btn btn-outline btn-block">Go to My Bookings</a>
            </div>

        </div>
    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>
