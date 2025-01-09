<%-- 
    Document   : home
    Created on : 11-Aug-2023, 21:46:46
    Author     : Anuranga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/home2.css">


        <title>ParkEase - Home</title>


    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">ParkEase</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="parking_area.jsp">Parking Area</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h1 class="hero-title">Welcome to ParkEase</h1>
                        <p class="hero-subtitle">Effortless Parking Management System</p>
                        <a href="parking_area.jsp" class="btn btn-primary btn-lg">Get Started</a>
                        <p class="customer-count">Join over 10,000 satisfied customers!</p>
                    </div>

                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features">
            <div class="container">
                <h2 class="section-title">Why Choose ParkEase?</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="feature-item">
                            <i class="fas fa-map-marker-alt"></i>
                            <h3 class="feature-title">Real-Time Space Availability</h3>
                            <p class="feature-description">Find available parking spots in real-time through our intuitive mobile app or website.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-item">
                            <i class="fas fa-credit-card"></i>
                            <h3 class="feature-title">Contactless Payments</h3>
                            <p class="feature-description">Make secure contactless payments, eliminating the need for cash or cards.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-item">
                            <i class="fas fa-calendar-check"></i>
                            <h3 class="feature-title">Reservation System</h3>
                            <p class="feature-description">Reserve parking spots in advance to ensure a stress-free arrival.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Reviews Section -->
        <section class="reviews">
            <div class="container">
                <h2 class="section-title">What Our Customers Say</h2>
                <div class="row">
                    <div class="col-md-6">
                        <div class="review-item">
                            <div class="review-header">
                                <img src="images/person1.jpg" alt="Customer 1" class="customer-image">
                                <div class="customer-info">
                                    <h4 class="customer-name">John Doe</h4>
                                    <p class="customer-location">New York, USA</p>
                                </div>
                            </div>
                            <p class="review-text">ParkEase has completely transformed my parking experience. I can easily find available spots and make quick payments. Highly recommended!</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="review-item">
                            <div class="review-header">
                                <img src="images/person1.jpg" alt="Customer 2" class="customer-image">
                                <div class="customer-info">
                                    <h4 class="customer-name">Jane Smith</h4>
                                    <p class="customer-location">London, UK</p>
                                </div>
                            </div>
                            <p class="review-text">I love the convenience of reserving parking spots in advance. It saves me so much time and stress. ParkEase is a game-changer!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section class="contact">
            <div class="container">
                <h2 class="section-title">Contact Us</h2>
                <div class="row">
                    <div class="col-md-6">
                        <p class="contact-description">Have any questions or need assistance? Feel free to get in touch with us.</p>
                        <ul class="contact-details">
                            <li><i class="fas fa-envelope"></i> Email: info@parkease.com</li>
                            <li><i class="fas fa-phone"></i> Phone: +1 123-456-7890</li>
                            <li><i class="fas fa-map-marker-alt"></i> Address: 123 Park Street, City, Country</li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <div class="social-icons">
                            <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <p>&copy; 2023 ParkEase. All rights reserved.</p>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

