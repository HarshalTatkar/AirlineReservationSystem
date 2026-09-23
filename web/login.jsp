<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Login - SkyWay Airlines</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <!-- Header -->
    <jsp:include page="header.jsp" />


    <!-- Login Section -->

    <section class="auth-section">

        <div class="auth-card">

            <div class="auth-header">

                <div class="auth-icon">
                    ✈️
                </div>

                <h2>
                    Welcome Back
                </h2>

                <p>
                    Login to manage your airline bookings
                </p>

            </div>


            <!-- Login Form -->

            <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                <c:if test="${not empty param.error}">
                    <div class="alert alert-error">
                        ${param.error}
                    </div>
                </c:if>
                <c:if test="${not empty param.msg}">
                    <div class="alert alert-success">
                        ${param.msg}
                    </div>
                </c:if>

                <!-- Username -->

                <div class="form-group">

                    <label for="username">
                        Username
                    </label>

                    <input type="text"
                           id="username"
                           name="username"
                           class="form-control"
                           placeholder="Enter your username"
                           required>

                </div>


                <!-- Password -->

                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input type="password"
                           id="password"
                           name="password"
                           class="form-control"
                           placeholder="Enter your password"
                           required>

                </div>


                <!-- Remember Me -->

                <div class="form-group">

                    <label style="display:flex;
                                  align-items:center;
                                  gap:8px;
                                  font-weight:normal;">

                        <input type="checkbox"
                               name="remember">

                        Remember me

                    </label>

                </div>


                <!-- Login Button -->

                <button type="submit"
                        class="btn btn-primary btn-block">

                    Login

                </button>

            </form>


            <!-- Register Link -->

            <div class="auth-footer">

                Don't have an account?

                <a href="${pageContext.request.contextPath}/register.jsp">

                    Create an Account

                </a>

                <br><br>

                <a href="${pageContext.request.contextPath}/admin-login.jsp" style="color: #64748b; font-size: 13px;">

                    Are you an administrator? Login here.

                </a>

            </div>

        </div>

    </section>


    <!-- Footer -->

    <jsp:include page="footer.jsp" />


</body>

</html>