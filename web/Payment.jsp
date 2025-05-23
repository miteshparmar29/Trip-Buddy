<%@ page import="java.sql.*, java.util.*, java.net.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Gateway | Trip Buddy</title>
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
            max-width: 1000px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        
        .checkout-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
        }
        
        @media (max-width: 900px) {
            .checkout-container {
                grid-template-columns: 1fr;
            }
        }
        
        .card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            padding: 2rem;
        }
        
        .section-title {
            font-size: 1.5rem;
            color: var(--secondary);
            margin-bottom: 1.5rem;
            border-bottom: 2px solid var(--primary-light);
            padding-bottom: 0.5rem;
            display: inline-block;
        }
        
        .booking-summary {
            margin-bottom: 2rem;
        }
        
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.8rem;
            padding-bottom: 0.8rem;
            border-bottom: 1px solid var(--medium-gray);
        }
        
        .summary-item:last-child {
            border-bottom: none;
        }
        
        .summary-label {
            font-weight: 600;
            color: var(--dark-gray);
        }
        
        .summary-value {
            color: var(--text);
        }
        
        .summary-total {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--secondary);
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 2px solid var(--medium-gray);
            display: flex;
            justify-content: space-between;
        }
        
        .payment-methods {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .payment-method {
            border: 2px solid var(--medium-gray);
            border-radius: 8px;
            padding: 1.5rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .payment-method:hover {
            border-color: var(--primary);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .payment-method.selected {
            border-color: var(--primary);
            background-color: rgba(0,119,182,0.05);
        }
        
        .payment-icon {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }
        
        .payment-icon img {
            height: 40px;
            margin-bottom: 0.5rem;
        }
        
        .payment-name {
            font-weight: 600;
            margin-bottom: 0.3rem;
        }
        
        .payment-description {
            font-size: 0.9rem;
            color: var(--dark-gray);
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--dark-gray);
        }
        
        .form-control {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid var(--medium-gray);
            border-radius: 6px;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 2px rgba(0,119,182,0.2);
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
            width: 100%;
            justify-content: center;
        }
        
        .btn:hover {
            background: linear-gradient(135deg, var(--primary-light), var(--primary));
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .btn-secondary {
            background: white;
            color: var(--primary);
            border: 2px solid var(--primary);
        }
        
        .btn-secondary:hover {
            background: white;
            color: var(--primary-light);
            border-color: var(--primary-light);
        }
        
        .secure-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 1.5rem;
            color: var(--dark-gray);
            font-size: 0.9rem;
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }
        
        .hidden {
            display: none;
        }
        
        .payment-form {
            margin-top: 1.5rem;
        }
        
        .payment-form.credit-card .card-info {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 1rem;
        }
        
        .payment-form.paypal {
            text-align: center;
        }
        
        .paypal-logo {
            max-width: 150px;
            margin: 1rem auto;
        }
        
        .payment-notes {
            font-size: 0.9rem;
            color: var(--dark-gray);
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid var(--medium-gray);
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
        
        /* Security badges */
        .security-badges {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1.5rem;
            margin-top: 2rem;
            flex-wrap: wrap;
        }
        
        .security-badge {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--dark-gray);
            font-size: 0.9rem;
            background-color: var(--light-gray);
            padding: 0.5rem 1rem;
            border-radius: 5px;
        }
        
        .security-badge i {
            color: var(--success);
        }
        
        /* Loading overlay */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,0.9);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            flex-direction: column;
            display: none;
        }
        
        .loader {
            border: 5px solid var(--light-gray);
            border-top: 5px solid var(--primary);
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
            margin-bottom: 1rem;
        }
        
        .processing-text {
            font-size: 1.2rem;
            color: var(--secondary);
            font-weight: 600;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="header-content">
            <div class="brand">Trip Buddy</div>
            <nav class="nav">
                <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
                <a href="#"><i class="fas fa-search"></i> Search</a>
                <a href="#"><i class="fas fa-user"></i> Account</a>
            </nav>
        </div>
    </header>

    <div class="container">
        <h1 class="section-title" style="font-size: 2rem; margin-bottom: 2rem;">Secure Checkout</h1>
        
        <%
            // Retrieve form data
            String hotelName = request.getParameter("hotelName");
            String checkin = request.getParameter("checkin");
            String checkout = request.getParameter("checkout");
            int guests = Integer.parseInt(request.getParameter("guests"));
            int rooms = Integer.parseInt(request.getParameter("rooms"));
            String roomType = request.getParameter("roomType");
            int pricePerNight = Integer.parseInt(request.getParameter("pricePerNight"));
            
            // Calculate number of nights
            java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
            java.util.Date checkinDate = format.parse(checkin);
            java.util.Date checkoutDate = format.parse(checkout);
            long diffInMillies = Math.abs(checkoutDate.getTime() - checkinDate.getTime());
            int nights = (int) (diffInMillies / (1000 * 60 * 60 * 24));
            
            // Calculate total cost
            int basePrice = pricePerNight * nights * rooms;
            int taxes = (int)(basePrice * 0.12); // 12% tax
            int serviceFee = (int)(basePrice * 0.05); // 5% service fee
            int totalPrice = basePrice + taxes + serviceFee;
            
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
        %>
        
        <div class="checkout-container">
            <div class="card">
                <h2 class="section-title">Booking Summary</h2>
                
                <div class="booking-summary">
                    <div class="summary-item">
                        <span class="summary-label">Hotel:</span>
                        <span class="summary-value"><%=hotelName%></span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Room Type:</span>
                        <span class="summary-value"><%=displayRoomType%></span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Check-in:</span>
                        <span class="summary-value"><%=checkin%></span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Check-out:</span>
                        <span class="summary-value"><%=checkout%></span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Guests:</span>
                        <span class="summary-value"><%=guests%></span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Rooms:</span>
                        <span class="summary-value"><%=rooms%></span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Nights:</span>
                        <span class="summary-value"><%=nights%></span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Price (per night):</span>
                        <span class="summary-value">₹<%=pricePerNight%></span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Base Price:</span>
                        <span class="summary-value">₹<%=basePrice%></span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Taxes (12%):</span>
                        <span class="summary-value">₹<%=taxes%></span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Service Fee (5%):</span>
                        <span class="summary-value">₹<%=serviceFee%></span>
                    </div>
                    
                    <div class="summary-total">
                        <span>Total:</span>
                        <span>₹<%=totalPrice%></span>
                    </div>
                </div>
                
                <div class="security-badges">
                    <div class="security-badge">
                        <i class="fas fa-lock"></i>
                        <span>Secure Payment</span>
                    </div>
                    
                    <div class="security-badge">
                        <i class="fas fa-shield-alt"></i>
                        <span>256-bit SSL Encrypted</span>
                    </div>
                    
                    <div class="security-badge">
                        <i class="fas fa-ban"></i>
                        <span>No Hidden Fees</span>
                    </div>
                </div>
            </div>
            
            <div class="card">
                <h2 class="section-title">Payment Method</h2>
                
                <div class="payment-methods">
                    <div class="payment-method" id="credit-card-method" onclick="selectPaymentMethod('credit-card')">
                        <div class="payment-icon">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <div class="payment-name">Credit Card</div>
                        <div class="payment-description">Pay securely with your credit card</div>
                    </div>
                    
                    <div class="payment-method" id="paypal-method" onclick="selectPaymentMethod('paypal')">
                        <div class="payment-icon">
                            <i class="fab fa-paypal"></i>
                        </div>
                        <div class="payment-name">PayPal</div>
                        <div class="payment-description">Fast and secure payment with PayPal</div>
                    </div>
                    
                    <div class="payment-method" id="google-pay-method" onclick="selectPaymentMethod('google-pay')">
                        <div class="payment-icon">
                            <i class="fab fa-google-pay"></i>
                        </div>
                        <div class="payment-name">Google Pay</div>
                        <div class="payment-description">Quick checkout with Google Pay</div>
                    </div>
                    
                    <div class="payment-method" id="apple-pay-method" onclick="selectPaymentMethod('apple-pay')">
                        <div class="payment-icon">
                            <i class="fab fa-apple-pay"></i>
                        </div>
                        <div class="payment-name">Apple Pay</div>
                        <div class="payment-description">Easy payment with Apple Pay</div>
                    </div>
                </div>
                
                <!-- Credit Card Form -->
                <form id="credit-card-form" class="payment-form credit-card hidden" action="PaymentSuccess.jsp" method="post">
                    <!-- Hidden fields to pass booking data -->
                    <input type="hidden" name="hotelName" value="<%=hotelName%>">
                    <input type="hidden" name="checkin" value="<%=checkin%>">
                    <input type="hidden" name="checkout" value="<%=checkout%>">
                    <input type="hidden" name="guests" value="<%=guests%>">
                    <input type="hidden" name="rooms" value="<%=rooms%>">
                    <input type="hidden" name="roomType" value="<%=roomType%>">
                    <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
                    <input type="hidden" name="nights" value="<%=nights%>">
                    <input type="hidden" name="paymentMethod" value="credit-card">
                    
                    <div class="form-group">
                        <label for="card-name">Name on Card</label>
                        <input type="text" id="card-name" class="form-control" placeholder="John Smith" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="card-number">Card Number</label>
                        <input type="text" id="card-number" class="form-control" placeholder="1234 5678 9012 3456" maxlength="19" required>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="expiry-date">Expiry Date</label>
                            <input type="text" id="expiry-date" class="form-control" placeholder="MM/YY" maxlength="5" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="cvv">CVV</label>
                            <input type="password" id="cvv" class="form-control" placeholder="123" maxlength="3" required>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn" onclick="showProcessing()">Pay ₹<%=totalPrice%> <i class="fas fa-lock"></i></button>
                </form>
                
                <!-- PayPal Form -->
                <form id="paypal-form" class="payment-form paypal hidden" action="PaymentSuccess.jsp" method="post">
                    <!-- Hidden fields to pass booking data -->
                    <input type="hidden" name="hotelName" value="<%=hotelName%>">
                    <input type="hidden" name="checkin" value="<%=checkin%>">
                    <input type="hidden" name="checkout" value="<%=checkout%>">
                    <input type="hidden" name="guests" value="<%=guests%>">
                    <input type="hidden" name="rooms" value="<%=rooms%>">
                    <input type="hidden" name="roomType" value="<%=roomType%>">
                    <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
                    <input type="hidden" name="nights" value="<%=nights%>">
                    <input type="hidden" name="paymentMethod" value="paypal">
                    
                    <div class="paypal-logo">
                        <i class="fab fa-paypal" style="font-size: 3rem; color: #0070ba;"></i>
                    </div>
                    
                    <p>You will be redirected to PayPal to complete your payment securely.</p>
                    <button type="submit" class="btn" onclick="showProcessing()">Continue to PayPal <i class="fas fa-external-link-alt"></i></button>
                </form>
                
                <!-- Google Pay Form -->
                <form id="google-pay-form" class="payment-form google-pay hidden" action="PaymentSuccess.jsp" method="post">
                    <!-- Hidden fields to pass booking data -->
                    <input type="hidden" name="hotelName" value="<%=hotelName%>">
                    <input type="hidden" name="checkin" value="<%=checkin%>">
                    <input type="hidden" name="checkout" value="<%=checkout%>">
                    <input type="hidden" name="guests" value="<%=guests%>">
                    <input type="hidden" name="rooms" value="<%=rooms%>">
                    <input type="hidden" name="roomType" value="<%=roomType%>">
                    <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
                    <input type="hidden" name="nights" value="<%=nights%>">
                    <input type="hidden" name="paymentMethod" value="google-pay">
                    
                    <div style="text-align: center; margin: 2rem 0;">
                        <i class="fab fa-google-pay" style="font-size: 4rem; color: #4285F4;"></i>
                    </div>
                    
                    <button type="submit" class="btn" onclick="showProcessing()">Pay with Google Pay <i class="fas fa-mobile-alt"></i></button>
                </form>
                
                <!-- Apple Pay Form -->
                <form id="apple-pay-form" class="payment-form apple-pay hidden" action="PaymentSuccess.jsp" method="post">
                    <!-- Hidden fields to pass booking data -->
                    <input type="hidden" name="hotelName" value="<%=hotelName%>">
                    <input type="hidden" name="checkin" value="<%=checkin%>">
                    <input type="hidden" name="checkout" value="<%=checkout%>">
                    <input type="hidden" name="guests" value="<%=guests%>">
                    <input type="hidden" name="rooms" value="<%=rooms%>">
                    <input type="hidden" name="roomType" value="<%=roomType%>">
                    <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
                    <input type="hidden" name="nights" value="<%=nights%>">
                    <input type="hidden" name="paymentMethod" value="apple-pay">
                    
                    <div style="text-align: center; margin: 2rem 0;">
                        <i class="fab fa-apple-pay" style="font-size: 4rem; color: #000;"></i>
                    </div>
                    
                    <button type="submit" class="btn" onclick="showProcessing()">Pay with Apple Pay <i class="fas fa-mobile-alt"></i></button>
                </form>
                
                <div class="payment-notes">
                    <p><i class="fas fa-info-circle"></i> By completing this booking, you agree to Trip Buddy's <a href="#">Terms & Conditions</a> and <a href="#">Privacy Policy</a>.</p>
                </div>
                
                <div class="secure-badge">
                    <i class="fas fa-lock"></i> All your data is secured and encrypted
                </div>
            </div>
        </div>
    </div>
    
    <!-- Loading Overlay -->
    <div class="overlay" id="processing-overlay">
        <div class="loader"></div>
        <div class="processing-text">Processing Payment...</div>
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
        // Card number formatting
        document.getElementById('card-number').addEventListener('input', function (e) {
            var target = e.target;
            var position = target.selectionEnd;
            var length = target.value.length;
            
            target.value = target.value.replace(/[^\d]/g, '').replace(/(.{4})/g, '$1 ').trim();
            
            target.selectionEnd = position += ((target.value.charAt(position - 1) === ' ' && target.value.charAt(length - 1) === ' ' && length !== position) ? 1 : 0);
        });
        
        // Expiry date formatting
        document.getElementById('expiry-date').addEventListener('input', function (e) {
            var target = e.target;
            var position = target.selectionEnd;
            var length = target.value.length;
            
            target.value = target.value.replace(/[^\d]/g, '').replace(/^(.{2})(.+)$/, '$1/$2');
            
            target.selectionEnd = position += ((target.value.charAt(position - 1) === '/' && target.value.charAt(length - 1) === '/' && length !== position) ? 1 : 0);
        });
        
        // CVV validation - numbers only
        document.getElementById('cvv').addEventListener('input', function (e) {
            e.target.value = e.target.value.replace(/[^\d]/g, '');
        });
        
        // Payment method selection
        function selectPaymentMethod(method) {
            // Hide all forms
            document.getElementById('credit-card-form').classList.add('hidden');
            document.getElementById('paypal-form').classList.add('hidden');
            document.getElementById('google-pay-form').classList.add('hidden');
            document.getElementById('apple-pay-form').classList.add('hidden');
            
            // Remove selected class from all methods
            document.getElementById('credit-card-method').classList.remove('selected');
            document.getElementById('paypal-method').classList.remove('selected');
            document.getElementById('google-pay-method').classList.remove('selected');
            document.getElementById('apple-pay-method').classList.remove('selected');
            
            // Show selected form
            document.getElementById(method + '-form').classList.remove('hidden');
            
            // Add selected class to chosen method
            document.getElementById(method + '-method').classList.add('selected');
        }
        
        // Initially select credit card method
        selectPaymentMethod('credit-card');
        
        // Show processing overlay
        function showProcessing() {
            document.getElementById('processing-overlay').style.display = 'flex';
            // Prevent default form submission and redirect manually after a delay
            event.preventDefault();
            
            // Get the form that was submitted
            const form = event.target.closest('form');
            
            // Simulate payment processing delay
            setTimeout(function() {
                form.submit();
            }, 2000);
        }
    </script>
</body>
</html>