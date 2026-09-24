<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Verify parameters came from booking form
    String flightId = request.getParameter("flightId");
    String totalFare = request.getParameter("totalFare");
    String flightClass = request.getParameter("flightClass");
    String numPassengers = request.getParameter("numPassengers");
    
    if (flightId == null || totalFare == null) {
        response.sendRedirect("index.jsp?error=Invalid booking session");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Payment - SkyWay Airlines</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="page-header">
        <div class="container">
            <h1>Secure Checkout</h1>
            <p>Please enter your payment details to finalize your booking.</p>
        </div>
    </section>

    <section class="section">
        <div class="container" style="max-width: 600px; margin: 0 auto;">
            
            <div class="card" style="margin-bottom: 30px;">
                <div class="card-header" style="text-align: center; border-bottom: none; padding-bottom: 0;">
                    <h2 style="color: #0f172a; margin-bottom: 5px;">Total Amount Due</h2>
                    <h1 style="color: #3b82f6; font-size: 36px; font-weight: 800;">₹<%= totalFare %></h1>
                    <p style="color: #64748b; font-size: 14px;">Flight Class: <%= flightClass %> | Passengers: <%= numPassengers %></p>
                </div>
            </div>

            <form action="process-booking.jsp" method="post" class="card">
                <!-- Forward all hidden parameters from booking.jsp -->
                <input type="hidden" name="flightId" value="<%= flightId %>">
                <input type="hidden" name="flightClass" value="<%= flightClass %>">
                <input type="hidden" name="totalFare" value="<%= totalFare %>">
                <input type="hidden" name="numPassengers" value="<%= numPassengers %>">
                
                <%
                    int num = Integer.parseInt(numPassengers);
                    for (int i = 1; i <= num; i++) {
                %>
                    <input type="hidden" name="passengerName_<%= i %>" value="<%= request.getParameter("passengerName_" + i) %>">
                    <input type="hidden" name="gender_<%= i %>" value="<%= request.getParameter("gender_" + i) %>">
                <%
                    }
                %>

                <h3 style="margin-bottom: 20px; color: #0f172a; display: flex; align-items: center; gap: 10px;">
                    💳 Credit / Debit Card
                </h3>

                <div class="form-group">
                    <label>Cardholder Name</label>
                    <input type="text" class="form-control" placeholder="Name on card" required>
                </div>

                <div class="form-group">
                    <label>Card Number</label>
                    <input type="text" class="form-control" placeholder="XXXX XXXX XXXX XXXX" maxlength="19" required>
                </div>

                <div class="form-row" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                    <div class="form-group">
                        <label>Expiry Date</label>
                        <input type="text" class="form-control" placeholder="MM/YY" maxlength="5" required>
                    </div>
                    <div class="form-group">
                        <label>CVV</label>
                        <input type="password" class="form-control" placeholder="123" maxlength="3" required>
                    </div>
                </div>
                
                <div class="alert alert-info" style="font-size: 12px; margin-top: 10px; margin-bottom: 25px;">
                    🔒 This is a secure, 256-bit encrypted connection.
                </div>

                <button type="submit" class="btn btn-primary btn-block" style="font-size: 16px; padding: 15px;">
                    Pay ₹<%= totalFare %> & Book Ticket
                </button>
            </form>
            
        </div>
    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>
