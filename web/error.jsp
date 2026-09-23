<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Error - SkyWay Airlines</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <!-- Header -->

    <jsp:include page="header.jsp" />


    <!-- Error Section -->

    <section class="error-section">

        <div class="container">

            <div class="error-card">


                <!-- Error Icon -->

                <div class="error-icon">
                    !
                </div>


                <h1>
                    Something Went Wrong
                </h1>


                <p>
                    We're sorry, but we couldn't complete
                    your request at this time.
                </p>


                <p class="error-message">

                    Please try again or return to the
                    homepage.

                </p>


                <!-- Buttons -->

                <div class="action-group"
                     style="justify-content:center;
                            margin-top:25px;">

                    <a href="index.jsp"
                       class="btn btn-primary">

                        🏠 Back to Home

                    </a>


                    <a href="flight-results.jsp"
                       class="btn btn-outline">

                        🔄 Search Flights

                    </a>

                </div>

            </div>

        </div>

    </section>


    <!-- Footer -->

    <jsp:include page="footer.jsp" />

</body>

</html>