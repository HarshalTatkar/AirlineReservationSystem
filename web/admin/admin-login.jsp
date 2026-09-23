<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Login - SkyWay Airlines</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <!-- Header -->

    <jsp:include page="../header.jsp" />


    <!-- Admin Login -->

    <section class="admin-login-section">

        <div class="admin-login-card">

            <div class="admin-login-icon">
                🔐
            </div>

            <h1>
                Admin Login
            </h1>

            <p class="admin-login-subtitle">
                Sign in to manage the airline reservation system.
            </p>


            <!-- Login Form -->

            <form action="#" method="post">


                <!-- Username -->

                <div class="form-group">

                    <label for="username">
                        Username
                    </label>

                    <input type="text"
                           id="username"
                           name="username"
                           class="form-control"
                           placeholder="Enter admin username"
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
                           placeholder="Enter admin password"
                           required>

                </div>


                <!-- Remember -->

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


                <!-- Login -->

                <button type="submit"
                        class="btn btn-primary btn-block">

                    🔐 Login as Admin

                </button>

            </form>


            <!-- Back -->

            <div class="auth-footer">

                <a href="../index.jsp">

                    ← Back to Airline Homepage

                </a>

            </div>

        </div>

    </section>


    <!-- Footer -->

    <jsp:include page="../footer.jsp" />

</body>

</html>