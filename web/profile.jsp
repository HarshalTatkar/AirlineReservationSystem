<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My Profile - SkyWay Airlines</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <!-- Header -->

    <jsp:include page="header.jsp" />


    <!-- Profile Page -->

    <main class="profile-page">

        <div class="container">


            <!-- Page Heading -->

            <div class="page-heading">

                <h1>
                    My Profile
                </h1>

                <p>
                    Manage your personal information and account details.
                </p>

            </div>


            <!-- Profile Layout -->

            <div class="profile-layout">


                <!-- Profile Card -->

                <div class="profile-card">

                    <div class="profile-avatar">
                        👤
                    </div>

                    <h2>
                        John Doe
                    </h2>

                    <p>
                        john.doe@email.com
                    </p>

                    <a href="my-bookings.jsp"
                       class="btn btn-outline">

                        My Bookings

                    </a>

                </div>


                <!-- Profile Information -->

                <div class="profile-details-card">

                    <div class="profile-section-title">

                        <h2>
                            Personal Information
                        </h2>

                        <p>
                            Your account information.
                        </p>

                    </div>


                    <form action="#" method="post">


                        <div class="form-row">


                            <div class="form-group">

                                <label for="firstName">
                                    First Name
                                </label>

                                <input type="text"
                                       id="firstName"
                                       name="firstName"
                                       class="form-control"
                                       value="John">

                            </div>


                            <div class="form-group">

                                <label for="lastName">
                                    Last Name
                                </label>

                                <input type="text"
                                       id="lastName"
                                       name="lastName"
                                       class="form-control"
                                       value="Doe">

                            </div>

                        </div>


                        <div class="form-row">


                            <div class="form-group">

                                <label for="email">
                                    Email Address
                                </label>

                                <input type="email"
                                       id="email"
                                       name="email"
                                       class="form-control"
                                       value="john.doe@email.com">

                            </div>


                            <div class="form-group">

                                <label for="phone">
                                    Phone Number
                                </label>

                                <input type="tel"
                                       id="phone"
                                       name="phone"
                                       class="form-control"
                                       value="+91 98765 43210">

                            </div>

                        </div>


                        <div class="form-group">

                            <label for="address">
                                Address
                            </label>

                            <textarea id="address"
                                      name="address"
                                      class="form-control"
                                      rows="4">Mumbai, Maharashtra, India</textarea>

                        </div>


                        <div class="form-row">


                            <div class="form-group">

                                <label for="city">
                                    City
                                </label>

                                <input type="text"
                                       id="city"
                                       name="city"
                                       class="form-control"
                                       value="Mumbai">

                            </div>


                            <div class="form-group">

                                <label for="country">
                                    Country
                                </label>

                                <input type="text"
                                       id="country"
                                       name="country"
                                       class="form-control"
                                       value="India">

                            </div>

                        </div>


                        <!-- Buttons -->

                        <div class="profile-actions">

                            <button type="button"
                                    class="btn btn-outline"
                                    onclick="resetProfile()">

                                Reset

                            </button>


                            <button type="button"
                                    class="btn btn-primary"
                                    onclick="updateProfile()">

                                💾 Update Profile

                            </button>

                        </div>

                    </form>

                </div>

            </div>


            <!-- Account Information -->

            <div class="account-info-card">

                <h2>
                    Account Information
                </h2>

                <div class="account-info-grid">


                    <div>

                        <span>
                            Account Status
                        </span>

                        <strong class="profile-status">
                            Active
                        </strong>

                    </div>


                    <div>

                        <span>
                            Member Since
                        </span>

                        <strong>
                            August 2026
                        </strong>

                    </div>


                    <div>

                        <span>
                            Total Bookings
                        </span>

                        <strong>
                            5
                        </strong>

                    </div>


                </div>

            </div>

        </div>

    </main>


    <!-- Footer -->

    <jsp:include page="footer.jsp" />


    <!-- JavaScript -->

    <script>

        function updateProfile() {

            alert(
                "Profile updated successfully! " +
                "Backend integration is required to save " +
                "the changes permanently."
            );

        }


        function resetProfile() {

            var result = confirm(
                "Are you sure you want to reset the form?"
            );

            if (result) {

                location.reload();

            }

        }

    </script>

</body>

</html>