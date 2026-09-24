<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.airline.utils.DatabaseConnection" %>

<%
    String flightIdStr = request.getParameter("flightId");
    if (flightIdStr == null || flightIdStr.trim().isEmpty()) {
        response.sendRedirect("index.jsp?error=No flight selected");
        return;
    }
    int flightId = Integer.parseInt(flightIdStr);
    
    // Default values
    String flightNumber = "";
    String origin = "";
    String destination = "";
    double ecoPrice = 0, busPrice = 0, firstPrice = 0;
    int ecoSeats = 0, busSeats = 0, firstSeats = 0;
    
    Connection conn = null;
    try {
        conn = DatabaseConnection.getConnection();
        String sql = "SELECT * FROM flights WHERE id = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, flightId);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            flightNumber = rs.getString("flight_number");
            origin = rs.getString("origin");
            destination = rs.getString("destination");
            ecoPrice = rs.getDouble("eco_price");
            busPrice = rs.getDouble("bus_price");
            firstPrice = rs.getDouble("first_price");
            ecoSeats = rs.getInt("eco_seats");
            busSeats = rs.getInt("bus_seats");
            firstSeats = rs.getInt("first_seats");
        } else {
            response.sendRedirect("index.jsp?error=Flight not found");
            return;
        }
    } catch (Exception e) {
        response.sendRedirect("index.jsp?error=Database error: " + e.getMessage());
        return;
    } finally {
        if (conn != null) {
            try { conn.close(); } catch(Exception e) {}
        }
    }
%>

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
        .passenger-block { background: #f8fafc; padding: 20px; border-radius: 8px; margin-bottom: 20px; border: 1px solid #e2e8f0; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="page-header">
        <div class="container">
            <h1>Complete Your Booking</h1>
            <p>Select your class and enter passenger details.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 30px;">
                
                <!-- LEFT SIDE - FORM -->
                <div>
                    <form action="payment.jsp" method="post" id="bookingForm">
                        <input type="hidden" name="flightId" value="<%= flightId %>">
                        <input type="hidden" name="flightNumber" value="<%= flightNumber %>">
                        <input type="hidden" name="origin" value="<%= origin %>">
                        <input type="hidden" name="destination" value="<%= destination %>">
                        
                        <div class="card" style="margin-bottom: 30px;">
                            <div class="card-header">
                                <h3>Booking Configuration</h3>
                            </div>
                            
                            <div class="form-row" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                                <div class="form-group">
                                    <label>Flight Class</label>
                                    <select name="flightClass" id="flightClass" class="form-control" onchange="updateSummary()" required>
                                        <option value="Economy" data-price="<%= ecoPrice %>" data-seats="<%= ecoSeats %>">Economy (₹<%= ecoPrice %>) - <%= ecoSeats %> Seats Left</option>
                                        <option value="Business" data-price="<%= busPrice %>" data-seats="<%= busSeats %>">Business (₹<%= busPrice %>) - <%= busSeats %> Seats Left</option>
                                        <option value="First" data-price="<%= firstPrice %>" data-seats="<%= firstSeats %>">First Class (₹<%= firstPrice %>) - <%= firstSeats %> Seats Left</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Number of Passengers</label>
                                    <select name="numPassengers" id="numPassengers" class="form-control" onchange="generatePassengerFields()" required>
                                        <option value="1">1 Passenger</option>
                                        <option value="2">2 Passengers</option>
                                        <option value="3">3 Passengers</option>
                                        <option value="4">4 Passengers</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="card" style="margin-bottom: 30px;">
                            <div class="card-header">
                                <h3>Passenger Details</h3>
                            </div>
                            <div id="passengerContainer">
                                <!-- Passenger fields will be generated here -->
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

                        <!-- We pass totalFare to the payment page -->
                        <input type="hidden" name="totalFare" id="hiddenTotalFare" value="<%= ecoPrice %>">

                        <button type="submit" id="submitBtn" class="btn btn-primary btn-block" style="font-size: 16px;">💳 Proceed to Payment</button>
                    </form>
                </div>

                <!-- RIGHT SIDE - SUMMARY -->
                <div>
                    <div class="card" style="position: sticky; top: 100px;">
                        <h2 class="card-title" style="margin-bottom: 20px; font-size: 24px; font-weight: 800;">Booking Summary</h2>

                        <div class="summary-row">
                            <span class="summary-label">Route</span>
                            <span class="summary-value"><%= origin %> → <%= destination %></span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Flight</span>
                            <span class="summary-value"><%= flightNumber %></span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Class</span>
                            <span class="summary-value" id="summaryClass">Economy</span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Available Seats</span>
                            <span class="summary-value" id="summaryAvailableSeats"><%= ecoSeats %></span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Base Fare</span>
                            <span class="summary-value" id="summaryBaseFare">₹<%= ecoPrice %></span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Passengers</span>
                            <span class="summary-value" id="summaryCount">1</span>
                        </div>
                        <div class="total-row">
                            <span>Total</span>
                            <span id="summaryTotal">₹<%= ecoPrice %></span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

    <script>
        function updateSummary() {
            const classSelect = document.getElementById('flightClass');
            const selectedOption = classSelect.options[classSelect.selectedIndex];
            const price = parseFloat(selectedOption.getAttribute('data-price'));
            const seats = parseInt(selectedOption.getAttribute('data-seats'));
            const numPassSelect = document.getElementById('numPassengers');
            const submitBtn = document.getElementById('submitBtn');
            
            // Limit the number of passenger options based on available seats
            for (let i = 0; i < numPassSelect.options.length; i++) {
                let optValue = parseInt(numPassSelect.options[i].value);
                if (optValue > seats) {
                    numPassSelect.options[i].disabled = true;
                } else {
                    numPassSelect.options[i].disabled = false;
                }
            }
            
            // If the currently selected passenger count exceeds seats, reset it
            if (parseInt(numPassSelect.value) > seats) {
                if (seats > 0) {
                    numPassSelect.value = seats.toString();
                } else {
                    numPassSelect.value = "1";
                }
                generatePassengerFields();
            }

            // Disable submit button if sold out
            if (seats < 1) {
                submitBtn.disabled = true;
                submitBtn.innerText = "Class Sold Out";
                submitBtn.style.background = "#94a3b8";
            } else {
                submitBtn.disabled = false;
                submitBtn.innerText = "💳 Proceed to Payment";
                submitBtn.style.background = "#3b82f6";
            }
            
            const numPassengers = parseInt(numPassSelect.value);
            const total = price * numPassengers;

            document.getElementById('summaryClass').innerText = selectedOption.value;
            document.getElementById('summaryAvailableSeats').innerText = seats;
            document.getElementById('summaryBaseFare').innerText = "₹" + price.toFixed(2);
            document.getElementById('summaryCount').innerText = numPassengers;
            document.getElementById('summaryTotal').innerText = "₹" + total.toFixed(2);
            
            // Update hidden field for the next page
            document.getElementById('hiddenTotalFare').value = total.toFixed(2);
        }

        function generatePassengerFields() {
            const num = parseInt(document.getElementById('numPassengers').value);
            const container = document.getElementById('passengerContainer');
            container.innerHTML = '';

            for (let i = 1; i <= num; i++) {
                const block = document.createElement('div');
                block.className = 'passenger-block';
                block.innerHTML = `
                    <h4 style="margin-bottom: 15px; color: #0f172a;">Passenger ` + i + `</h4>
                    <div class="form-group">
                        <label>Full Name *</label>
                        <input type="text" name="passengerName_` + i + `" class="form-control" placeholder="Enter passenger name" required>
                    </div>
                    <div class="form-row" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                        <div class="form-group">
                            <label>Gender *</label>
                            <select name="gender_` + i + `" class="form-control" required>
                                <option value="">Select Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Date of Birth *</label>
                            <input type="date" name="dob_` + i + `" class="form-control" required>
                        </div>
                    </div>
                `;
                container.appendChild(block);
            }
            updateSummary();
        }

        // Initialize on load
        window.onload = function() {
            generatePassengerFields();
        };
    </script>
</body>
</html>