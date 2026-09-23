<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Common Header / Navigation -->
<header class="navbar">

    <div class="container">

        <!-- Logo -->
        <div class="logo">

            <div class="logo-icon">
                ✈
            </div>

            <div>
                <div class="logo-text">
                    SkyWay Airlines
                </div>

                <span class="logo-subtitle">
                    Airline Reservation System
                </span>
            </div>

        </div>


        <!-- Navigation -->
        <nav class="nav-links">

            <a href="${pageContext.request.contextPath}/index.jsp">
                Home
            </a>

            <a href="${pageContext.request.contextPath}/all-flights.jsp">
                All Flights
            </a>

            <c:choose>
                <c:when test="${not empty sessionScope.loggedInUser}">
                    <!-- User is logged in -->
                    <a href="${pageContext.request.contextPath}/mybookings.jsp">
                        My Bookings
                    </a>
                    
                    <span style="color: #64748b; font-weight: 500;">
                        Hello, ${sessionScope.loggedInUser.username}
                    </span>

                    <a href="${pageContext.request.contextPath}/LogoutServlet" class="nav-btn-outline">
                        Logout
                    </a>
                </c:when>
                <c:otherwise>
                    <!-- User is not logged in -->
                    <a href="${pageContext.request.contextPath}/login.jsp" class="nav-btn">
                        Login
                    </a>

                    <a href="${pageContext.request.contextPath}/register.jsp" class="nav-btn-outline">
                        Register
                    </a>
                </c:otherwise>
            </c:choose>

        </nav>

    </div>

</header>