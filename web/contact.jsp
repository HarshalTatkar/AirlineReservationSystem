<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Contact Us - SkyWay Airlines</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="contact-page">

        <div class="container">

            <div class="page-heading">

                <h1>Contact Us</h1>

                <p>
                    We're here to help. Get in touch with SkyWay Airlines.
                </p>

            </div>


            <div class="contact-layout">


                <!-- Contact Information -->

                <div class="contact-info-card">

                    <h2>
                        Get In Touch
                    </h2>

                    <p>
                        Have questions about your flight or booking?
                        Contact our support team.
                    </p>


                    <div class="contact-item">

                        <div class="contact-icon">
                            📞
                        </div>

                        <div>

                            <h3>
                                Phone
                            </h3>

                            <p>
                                +91 1800 123 4567
                            </p>

                        </div>

                    </div>


                    <div class="contact-item">

                        <div class="contact-icon">
                            ✉
                        </div>

                        <div>

                            <h3>
                                Email
                            </h3>

                            <p>
                                support@skywayairlines.com
                            </p>

                        </div>

                    </div>


                    <div class="contact-item">

                        <div class="contact-icon">
                            📍
                        </div>

                        <div>

                            <h3>
                                Office
                            </h3>

                            <p>
                                Mumbai, Maharashtra, India
                            </p>

                        </div>

                    </div>

                </div>


                <!-- Contact Form -->

                <div class="contact-form-card">

                    <h2>
                        Send Us a Message
                    </h2>

                    <form action="#" method="post">


                        <div class="form-group">

                            <label for="name">
                                Full Name
                            </label>

                            <input type="text"
                                   id="name"
                                   name="name"
                                   class="form-control"
                                   placeholder="Enter your name"
                                   required>

                        </div>


                        <div class="form-group">

                            <label for="email">
                                Email Address
                            </label>

                            <input type="email"
                                   id="email"
                                   name="email"
                                   class="form-control"
                                   placeholder="Enter your email"
                                   required>

                        </div>


                        <div class="form-group">

                            <label for="subject">
                                Subject
                            </label>

                            <input type="text"
                                   id="subject"
                                   name="subject"
                                   class="form-control"
                                   placeholder="Enter subject"
                                   required>

                        </div>


                        <div class="form-group">

                            <label for="message">
                                Message
                            </label>

                            <textarea id="message"
                                      name="message"
                                      class="form-control"
                                      rows="6"
                                      placeholder="Write your message..."
                                      required></textarea>

                        </div>


                        <button type="button"
                                class="btn btn-primary"
                                onclick="sendMessage()">

                            ✉ Send Message

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </main>


    <jsp:include page="footer.jsp" />


    <script>

        function sendMessage() {

            alert(
                "Thank you! Your message has been submitted. " +
                "Backend integration is required to send it permanently."
            );

        }

    </script>

</body>

</html>