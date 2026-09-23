<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Create Account - SkyWay Airlines</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <!-- Header -->
    <jsp:include page="header.jsp" />


    <!-- Registration Section -->

    <section class="auth-section">

        <div class="auth-card">

            <div class="auth-header">

                <div class="auth-icon">
                    🧑‍💼
                </div>

                <h2>
                    Create Your Account
                </h2>

                <p>
                    Register with SkyWay Airlines
                </p>

            </div>


            <!-- Registration Form -->

            <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
                <c:if test="${not empty param.error}">
                    <div class="alert alert-error">
                        ${param.error}
                    </div>
                </c:if>

                <!-- Username -->
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Choose a username" required>
                </div>

                <!-- Full Name -->

                <div class="form-group">

                    <label for="fullname">
                        Full Name
                    </label>

                    <input type="text"
                           id="fullname"
                           name="fullname"
                           class="form-control"
                           placeholder="Enter your full name"
                           required>

                </div>


                <!-- Email -->

                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input type="email"
                           id="email"
                           name="email"
                           class="form-control"
                           placeholder="Enter your email address"
                           required>

                </div>


                <!-- Phone -->

                <div class="form-group">

                    <label for="phone">
                        Phone Number
                    </label>

                    <input type="tel"
                           id="phone"
                           name="phone"
                           class="form-control"
                           placeholder="Enter your phone number"
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
                           placeholder="Create a password"
                           required>

                </div>


                <!-- Confirm Password -->

                <div class="form-group">

                    <label for="confirmPassword">
                        Confirm Password
                    </label>

                    <input type="password"
                           id="confirmPassword"
                           name="confirmPassword"
                           class="form-control"
                           placeholder="Confirm your password"
                           required>

                </div>


                <!-- Terms -->

                <div class="form-group">

                    <label style="display:flex;
                                  align-items:flex-start;
                                  gap:8px;
                                  font-weight:normal;">

                        <input type="checkbox"
                               name="terms"
                               required>

                        <span>
                            I agree to the Terms & Conditions
                            and Privacy Policy.
                        </span>

                    </label>

                </div>


                <!-- Register Button -->

                <button type="submit"
                        class="btn btn-primary btn-block">

                    Create Account

                </button>

            </form>


            <!-- Login Link -->

            <div class="auth-footer">

                Already have an account?

                <a href="${pageContext.request.contextPath}/login.jsp">

                    Login Here

                </a>

            </div>

        </div>

    </section>


    <!-- Footer -->

    <jsp:include page="footer.jsp" />

</body>

</html>