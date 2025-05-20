<%@ page import="java.sql.*, java.util.*, java.net.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Success | Trip Buddy</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #0077b6;
            --primary-light: #00b4d8;
            --secondary: #023e8a;
            --accent: #ffd166;
            --text: #333;
            --light-gray: #f5f5f5;
            --medium-gray: #e0e0e0;
            --dark-gray: #555;
            --success: #38b000;
            --error: #d90429;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-gray);
            color: var(--text);
            line-height: 1.6;
        }
        
        .header {
            background: linear-gradient(to right, var(--secondary), var(--primary));
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .brand {
            font-size: 1.8rem;
            font-weight: 700;
            letter-spacing: 1px;
        }
        
        .nav a {
            color: white;
            text-decoration: none;
            margin-left: 1.5rem;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .nav a:hover {
            color: var(--accent);
        }
        
        .container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        
        .success-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            padding: 2rem;
            text-align: center;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 0.6s ease-out forwards;
            animation-delay: 2.8s;
        }
        
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .success-animation {
            height: 150px;
            position: relative;
            margin: 2rem auto;
        }
        
        .checkmark {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            display: block;
            stroke-width: 4;
            stroke: var(--success);
            stroke-miterlimit: 10;
            margin: 0 auto;
            box-shadow: 0 0 0 var(--success);
            animation: fill 0.4s ease-in-out 0.4s forwards, scale 0.3s ease-in-out 0.9s both;
            position: relative;
            z-index: 2;
        }
        
        .checkmark__circle {
            stroke-dasharray: 166;
            stroke-dashoffset: 166;
            stroke-width: 4;
            stroke-miterlimit: 10;
            stroke: var(--success);
            fill: none;
            animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards;
        }
        
        .checkmark__check {
            transform-origin: 50% 50%;
            stroke-dasharray: 48;
            stroke-dashoffset: 48;
            animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards;
        }
        
        @keyframes stroke {
            100% {
                stroke-dashoffset: 0;
            }
        }
        
        @keyframes scale {
            0%, 100% {
                transform: none;
            }
            50% {
                transform: scale3d(1.1, 1.1, 1);
            }
        }
        
        @keyframes fill {
            100% {
                box-shadow: inset 0px 0px 0px 50px rgba(56, 176, 0, 0.1);
            }
        }
        
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            opacity: 0;
        }
        
        @keyframes confetti-fall {
            0% {
                transform: translateY(-100px) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(300px) rotate(720deg);
                opacity: 0;
            }
        }
        
        /* Processing animation */
        .processing-container {
            width: 100%;
            max-width: 600px;
            margin: 2rem auto;
            text-align: center;
            position: relative;
            height: 300px;
            opacity: 1;
            animation: fadeOut 0.4s ease-out forwards;
            animation-delay: 2.5s;
        }
        
        @keyframes fadeOut {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
                display: none;
            }
        }
        
        .processing-text {
            font-size: 1.5rem;
            color: var(--secondary);
            font-weight: 600;
            margin-bottom: 1.5rem;
        }
        
        .processing-animation {
            position: relative;
            width: 100%;
            height: 100px;
        }
        
        .card-icon {
            position: absolute;
            left: 20%;
            top: 50%;
            transform: translateY(-50%);
            font-size: 2.5rem;
            color: var(--primary);
            opacity: 0;
            animation: cardSlide 0.6s ease-out forwards;
        }
        
        .processing-loader {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 5px solid var(--medium-gray);
            border-top-color: var(--primary);
            animation: spin 1s linear infinite;
        }
        
        .check-icon {
            position: absolute;
            right: 20%;
            top: 50%;
            transform: translateY(-50%);
            font-size: 2.5rem;
            color: var(--success);
            opacity: 0;
            animation: checkSlide 0.6s ease-out forwards;
            animation-delay: 2s;
        }
        
        @keyframes cardSlide {
            0% {
                left: 0;
                opacity: 0;
            }
            100% {
                left: 20%;
                opacity: 1;
            }
        }
        
        @keyframes checkSlide {
            0% {
                right: 0;
                opacity: 0;
            }
            100% {
                right: 20%;
                opacity: 1;
            }
        }
        
        @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }
        
        .status-updates {
            margin-top: 2rem;
            text-align: left;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .status-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            opacity: 0;
            animation: fadeInStatus 0.4s ease-out forwards;
        }
        
        .status-item:nth-child(1) {
            animation-delay: 0.3s;
        }
        
        .status-item:nth-child(2) {
            animation-delay: 1.0s;
        }
        
        .status-item:nth-child(3) {
            animation-delay: 1.7s;
        }
        
        .status-icon {
            margin-right: 1rem;
            color: var(--success);
            font-size: 1.2rem;
        }
        
        .status-text {
            font-size: 1rem;
            color: var(--dark-gray);
        }
        
        @keyframes fadeInStatus {
            0% {
                opacity: 0;
                transform: translateY(10px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .success-title {
            font-size: 2rem;
            color: var(--success);
            margin-bottom: 1rem;
            font-weight: 700;
        }
        
        .success-subtitle {
            font-size: 1.2rem;
            color: var(--secondary);
            margin-bottom: 2rem;
        }
        
        .booking-id {
            background-color: var(--light-gray);
            padding: 0.8rem 1.5rem;
            border-radius: 30px;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 2rem;
        }
        
        .booking-details {
            margin: 2rem 0;
            text-align: left;
            border-top: 1px solid var(--medium-gray);
            padding-top: 1.5rem;
        }
        
        .detail-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--light-gray);
        }
        
        .detail-label {
            font-weight: 600;
            color: var(--dark-gray);
        }
        
        .btn {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
        }
        
        .btn:hover {
            background: linear-gradient(135deg, var(--primary-light), var(--primary));
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .footer {
            background-color: var(--secondary);
            color: white;
            padding: 2rem 0;
            margin-top: 3rem;
        }
        
        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
        }
        
        .footer-title {
            font-size: 1.2rem;
            margin-bottom: 1rem;
            color: var(--accent);
        }
        
        .footer-links {
            list-style: none;
        }
        
        .footer-links li {
            margin-bottom: 0.5rem;
        }
        
        .footer-links a {
            color: white;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .footer-links a:hover {
            color: var(--accent);
            margin-left: 5px;
        }
        
        .copyright {
            text-align: center;
            padding: 1.5rem 0;
            background-color: rgba(0,0,0,0.1);
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="header-content">
            <div class="brand">Trip Buddy</div>
            <nav class="nav">
                <a href="Home.jsp"><i class="fas fa-home"></i> Home</a>
                <a href="#"><i class="fas fa-search"></i> Search</a>
                <a href="#"><i class="fas fa-user"></i> Account</a>
            </nav>
        </div>
    </header>

    <div class="container">
        <%
            // Retrieve form data
            String hotelName = request.getParameter("hotelName");
            String checkin = request.getParameter("checkin");
            String checkout = request.getParameter("checkout");
            int guests = Integer.parseInt(request.getParameter("guests"));
            int rooms = Integer.parseInt(request.getParameter("rooms"));
            String roomType = request.getParameter("roomType");
            int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
            int nights = Integer.parseInt(request.getParameter("nights"));
            String paymentMethod = request.getParameter("paymentMethod");
            
            // Format room type for display
            String displayRoomType = "";
            switch(roomType) {
                case "standard":
                    displayRoomType = "Standard Room";
                    break;
                case "deluxe":
                    displayRoomType = "Deluxe Room";
                    break;
                case "suite":
                    displayRoomType = "Executive Suite";
                    break;
                case "family":
                    displayRoomType = "Family Room";
                    break;
                default:
                    displayRoomType = roomType;
            }
            
            // Generate booking ID
            String bookingId = "TB" + (int)(Math.random() * 100000000);
            
            // Format payment method for display
            String displayPaymentMethod = "";
            switch(paymentMethod) {
                case "credit-card":
                    displayPaymentMethod = "Credit Card";
                    break;
                case "paypal":
                    displayPaymentMethod = "PayPal";
                    break;
                case "google-pay":
                    displayPaymentMethod = "Google Pay";
                    break;
                case "apple-pay":
                    displayPaymentMethod = "Apple Pay";
                    break;
                default:
                    displayPaymentMethod = paymentMethod;
            }
        %>
        
        <!-- Processing Animation -->
        <div class="processing-container">
            <div class="processing-text">Processing Your Payment</div>
            
            <div class="processing-animation">
                <div class="card-icon">
                    <% if(paymentMethod.equals("credit-card")) { %>
                        <i class="fas fa-credit-card"></i>
                    <% } else if(paymentMethod.equals("paypal")) { %>
                        <i class="fab fa-paypal"></i>
                    <% } else if(paymentMethod.equals("google-pay")) { %>
                        <i class="fab fa-google-pay"></i>
                    <% } else if(paymentMethod.equals("apple-pay")) { %>
                        <i class="fab fa-apple-pay"></i>
                    <% } %>
                </div>
                <div class="processing-loader"></div>
                <div class="check-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
            </div>
            
            <div class="status-updates">
                <div class="status-item">
                    <div class="status-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="status-text">Verifying payment details...</div>
                </div>
                
                <div class="status-item">
                    <div class="status-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="status-text">Processing payment...</div>
                </div>
                
                <div class="status-item">
                    <div class="status-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="status-text">Confirming reservation...</div>
                </div>
            </div>
        </div>
        
        <!-- Success Card -->
        <div class="success-card">
            <div class="success-animation">
                <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                    <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none"/>
                    <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/>
                </svg>
                
                <!-- Adding confetti animation -->
                <div id="confetti-container"></div>
            </div>
            
            <h1 class="success-title">Payment Successful!</h1>
            <p class="success-subtitle">Your reservation has been confirmed</p>
            
            <div class="booking-id">
                Booking ID: <%=bookingId%>
            </div>
            
            <div class="booking-details">
                <div class="detail-item">
                    <span class="detail-label">Hotel:</span>
                    <span><%=hotelName%></span>
                </div>
                
                <div class="detail-item">
                    <span class="detail-label">Room Type:</span>
                    <span><%=displayRoomType%></span>
                </div>
                
                <div class="detail-item">
                    <span class="detail-label">Stay:</span>
                    <span><%=checkin%> to <%=checkout%> (<%=nights%> nights)</span>
                </div>
                
                <div class="detail-item">
                    <span class="detail-label">Guests:</span>
                    <span><%=guests%></span>
                </div>
                
                <div class="detail-item">
                    <span class="detail-label">Rooms:</span>
                    <span><%=rooms%></span>
                </div>
                
                <div class="detail-item">
                    <span class="detail-label">Payment Method:</span>
                    <span><%=displayPaymentMethod%></span>
                </div>
                
                <div class="detail-item" style="border-bottom: 2px solid var(--medium-gray);">
                    <span class="detail-label">Total Amount:</span>
                    <span style="font-weight: 700; color: var(--secondary); font-size: 1.1rem;">₹<%=totalPrice%></span>
                </div>
            </div>
            
            <p style="margin-bottom: 2rem;">A confirmation email has been sent to your registered email address.</p>
            
            <a href="Home.jsp" class="btn">
                Back to Home <i class="fas fa-home"></i>
            </a>
        </div>
    </div>
    
    <footer class="footer">
        <div class="footer-content">
            <div>
                <h3 class="footer-title">About Trip Buddy</h3>
                <ul class="footer-links">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Press Center</a></li>
                    <li><a href="#">Investor Relations</a></li>
                </ul>
            </div>
            
            <div>
                <h3 class="footer-title">Support</h3>
                <ul class="footer-links">
                    <li><a href="#">Help Center</a></li>
                    <li><a href="#">Safety Information</a></li>
                    <li><a href="#">Cancellation Options</a></li>
                    <li><a href="#">COVID-19 Response</a></li>
                </ul>
            </div>
            
            <div>
                <h3 class="footer-title">Legal</h3>
                <ul class="footer-links">
                    <li><a href="#">Terms & Conditions</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Cookie Policy</a></li>
                    <li><a href="#">Guest Policies</a></li>
                </ul>
            </div>
            
            <div>
                <h3 class="footer-title">Contact Us</h3>
                <ul class="footer-links">
                    <li><i class="fas fa-phone"></i> +1 (800) 123-4567</li>
                    <li><i class="fas fa-envelope"></i> support@tripbuddy.com</li>
                    <li><i class="fas fa-map-marker-alt"></i> 123 Luxury Avenue, Suite 500</li>
                </ul>
            </div>
        </div>
        
        <div class="copyright">
            &copy; 2025 Trip Buddy. All rights reserved.
        </div>
    </footer>
    
    <script>
        // Create confetti animation
        function createConfetti() {
            const container = document.getElementById('confetti-container');
            const colors = ['#ffd166', '#00b4d8', '#0077b6', '#023e8a', '#38b000'];
            
            for (let i = 0; i < 50; i++) {
                const confetti = document.createElement('div');
                confetti.className = 'confetti';
                confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                confetti.style.left = Math.random() * 100 + '%';
                confetti.style.animationDuration = (Math.random() * 3 + 2) + 's';
                confetti.style.animationDelay = Math.random() * 1 + 's';
                confetti.style.animationName = 'confetti-fall';
                confetti.style.animationTimingFunction = 'ease-in-out';
                confetti.style.animationFillMode = 'forwards';
                
                container.appendChild(confetti);
            }
        }
        
        // Execute confetti animation after a delay
        setTimeout(createConfetti, 3000);
    </script>
</body>
</html>