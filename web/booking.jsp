<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Flight - SkyWay Airlines</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .summary-row { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #e2e8f0; }
        .summary-label { color: #64748b; }
        .summary-value { font-weight: 600; color: #0f172a; }
        .total-row { display: flex; justify-content: space-between; padding: 15px 0; margin-top: 10px; font-size: 20px; font-weight: 800; color: #3b82f6; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="page-header">
        <div class="container">
            <h1>Complete Your Booking</h1>
            <p>Enter passenger details to reserve your flight.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 30px;">
                
                <!-- LEFT SIDE - FORM -->
                <div>
                    <form action="${pageContext.request.contextPath}/BookingServlet" method="post">
                        <!-- Hidden field for flight ID passed from flight-results.jsp -->
                        <input type="hidden" name="flightId" value="${param.flightId}">
                        
                        <div class="card" style="margin-bottom: 30px;">
                            <div class="card-header">
                                <h3>Passenger Details</h3>
                            </div>
                            
                            <div class="form-group">
                                <label for="passengerName">Full Passenger Name *</label>
                                <input type="text" id="passengerName" name="passengerName" class="form-control" placeholder="Enter passenger name" required>
                            </div>
                            
                            <div class="form-row" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                                <div class="form-group">
                                    <label for="gender">Gender *</label>
                                    <select id="gender" name="gender" class="form-control" required>
                                        <option value="">Select Gender</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="dob">Date of Birth *</label>
                                    <input type="date" id="dob" name="dob" class="form-control" required>
                                </div>
                            </div>
                        </div>

                        <div class="card" style="margin-bottom: 30px;">
                            <div class="form-group">
                                <label style="display:flex; align-items:flex-start; gap:10px; font-weight:normal; font-size: 14px; color: #64748b;">
                                    <input type="checkbox" required>
                                    <span>I confirm that all passenger information entered above is correct and I agree to the airline's booking terms and conditions.</span>
                                </label>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block" style="font-size: 16px;">✈ Confirm Booking</button>
                    </form>
                </div>

                <!-- RIGHT SIDE - SUMMARY -->
                <div>
                    <div class="card" style="position: sticky; top: 100px;">
                        <h2 class="card-title" style="margin-bottom: 20px; font-size: 24px; font-weight: 800;">Booking Summary</h2>

                        <div class="summary-row">
                            <span class="summary-label">Airline</span>
                            <span class="summary-value">SkyWay Airlines</span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Flight</span>
                            <span class="summary-value">${param.flightNumber}</span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Route</span>
                            <span class="summary-value">${param.origin} → ${param.destination}</span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Base Fare</span>
                            <span class="summary-value">₹${param.price}</span>
                        </div>
                        <div class="total-row">
                            <span>Total</span>
                            <span>₹${param.price}</span>
                        </div>
                        <br>
                        <div class="alert alert-info" style="font-size: 13px; color: #64748b; background: #eff6ff; border: 1px solid #bfdbfe;">
                            Your total fare includes applicable taxes and service charges.
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>