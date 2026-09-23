<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - SkyWay Airlines</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="auth-section">
        <div class="auth-card">
            <div class="auth-header">
                <h2>Admin Portal</h2>
                <p>Login to manage flights and system settings.</p>
            </div>

            <%
                String error = request.getParameter("error");
                if (error != null) {
            %>
                <div class="alert alert-error">
                    <%= error %>
                </div>
            <%
                }
            %>

            <form action="admin-dashboard.jsp" method="post">
                <div class="form-group" style="margin-bottom: 20px;">
                    <label for="username">Admin Username</label>
                    <input type="text" id="username" name="username" class="form-control" required placeholder="Enter admin username">
                </div>

                <div class="form-group" style="margin-bottom: 25px;">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required placeholder="Enter password">
                </div>

                <button type="submit" class="btn btn-primary btn-block">
                    Access Dashboard
                </button>
            </form>
        </div>
    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>
