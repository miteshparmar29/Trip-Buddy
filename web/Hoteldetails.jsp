<%@ page import="java.sql.*, java.util.*, java.net.*, java.util.Base64" %>
<%@ page import="db.DBConnector" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
       session =request.getSession(false);
      String useremail=(String) session.getAttribute("useremail");
   
      
  if(useremail!=null)
  {
      
  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Details |  Trip Buddy</title>
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
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        
        .hotel-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }
        
        .hotel-image {
            width: 100%;
            height: 450px;
            object-fit: cover;
        }
        
        .hotel-details {
            padding: 2rem;
        }
        
        .hotel-name {
            font-size: 2.2rem;
            color: var(--primary);
            margin-bottom: 1rem;
            font-weight: 700;
        }
        
        .rating {
            color: var(--accent);
            margin-bottom: 1rem;
            font-size: 1.2rem;
        }
        
        .amenities {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin: 1.5rem 0;
        }
        
        .amenity {
            background-color: var(--light-gray);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .amenity i {
            color: var(--primary);
        }
        
        .description {
            margin: 1.5rem 0;
            color: var(--dark-gray);
            line-height: 1.7;
        }
        
        .booking-form {
            margin-top: 2rem;
            padding: 2rem;
            background-color: var(--light-gray);
            border-radius: 12px;
            box-shadow: inset 0 0 10px rgba(0,0,0,0.05);
        }
        
        .form-title {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            color: var(--secondary);
            border-bottom: 2px solid var(--primary-light);
            padding-bottom: 0.5rem;
            display: inline-block;
        }
        
        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }
        
        .form-group {
            margin-bottom: 1.2rem;
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
        }
        
        .btn:hover {
            background: linear-gradient(135deg, var(--primary-light), var(--primary));
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .price-display {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--secondary);
            margin-right: 2rem;
        }
        
        .booking-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 1.5rem;
        }
        
        .price-breakdown {
            display: flex;
            align-items: center;
        }
        
        .price-details {
            font-size: 0.9rem;
            color: var(--dark-gray);
            margin-left: 0.5rem;
            cursor: pointer;
            text-decoration: underline;
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
        
        @media (max-width: 768px) {
            .booking-footer {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }
            
            .hotel-name {
                font-size: 1.8rem;
            }
            
            .hotel-image {
                height: 300px;
            }
        }
        .back-button {
    margin-bottom: 1rem;
}

.back-button a {
    display: inline-flex;
    align-items: center;
    padding: 10px 16px;
    background: linear-gradient(135deg, var(--primary-light), var(--primary));
    color: white;
    font-weight: 600;
    text-decoration: none;
    border-radius: 6px;
    transition: background 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    font-size: 0.95rem;
}

.back-button a i {
    margin-right: 8px;
}

.back-button a:hover {
    background: linear-gradient(135deg, var(--primary), var(--secondary));
    transform: translateY(-2px);
}


    </style>
</head>
<body>
    <header class="header">
        <div class="header-content">
            <div class="brand">Trip Buddy</div>
            <nav class="nav">
                <a href="Home.jsp"><i class="fas fa-home"></i> Home</a>
               
                <a href="Profile.jsp"><i class="fas fa-user"></i> Account</a>
            </nav>
        </div>
    </header>

    <div class="container">
        <div class="back-button">
    <a href="Search.jsp">
        <i class="fas fa-arrow-left"></i> Back to Search
    </a>
</div>

        <%
            String hotelName = request.getParameter("hotelName");
            String base64Image = "";
            String hotelDescription = "";
            int price = (int)(Math.random() * 2000 + 1500);
            int rating = 0;
            
            try {
                Connection conn = DBConnector.getConnection();
                
                // Using PreparedStatement to prevent SQL injection
                String query = "SELECT image FROM hotels WHERE Hotel_name=?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, hotelName);
                
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    byte[] imgBytes = rs.getBytes("image");
                    base64Image = Base64.getEncoder().encodeToString(imgBytes);
                   
                    
                    // If no description is available in the database, provide a default one
                    if (hotelDescription == null || hotelDescription.trim().isEmpty()) {
                        hotelDescription = "Experience luxury and comfort at " + hotelName + ". Our hotel offers premium amenities, spacious rooms, and exceptional service to make your stay memorable. Located in a prime area, we provide easy access to major attractions and business centers.";
                    }
                }
                rs.close();
                pstmt.close();
            } catch(Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            }
        %>
        
        <div class="hotel-card">
            <img src="data:image/jpeg;base64,<%=base64Image%>" alt="<%=hotelName%>" class="hotel-image">
            
            <div class="hotel-details">
                <h1 class="hotel-name"><%=hotelName%></h1>
                
                <div class="rating">
                    <% for (int i = 0; i < rating; i++) { %>
                        <i class="fas fa-star"></i>
                    <% } %>
                    <% for (int i = rating; i < 5; i++) { %>
                        <i class="far fa-star"></i>
                    <% }
                    rating=5;  
                    %>
                    <span><%=rating%>/5</span>
                </div>
                
                <div class="amenities">
                    <div class="amenity"><i class="fas fa-wifi"></i> Free WiFi</div>
                    <div class="amenity"><i class="fas fa-parking"></i> Parking</div>
                    <div class="amenity"><i class="fas fa-swimming-pool"></i> Pool</div>
                    <div class="amenity"><i class="fas fa-utensils"></i> Restaurant</div>
                    <div class="amenity"><i class="fas fa-spa"></i> Spa</div>
                    <div class="amenity"><i class="fas fa-dumbbell"></i> Fitness Center</div>
                </div>
                
                <p class="description"><%=hotelDescription%></p>
                
                <div class="booking-form">
                    <h3 class="form-title">Book Your Stay</h3>
                    
                    <form action="Payment.jsp" method="post">
                        <input type="hidden" name="hotelName" value="<%=hotelName%>">
                        <input type="hidden" name="pricePerNight" value="<%=price%>">
                        
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="checkin"><i class="far fa-calendar-alt"></i> Check-in Date</label>
                                <input type="date" id="checkin" name="checkin" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="checkout"><i class="far fa-calendar-alt"></i> Check-out Date</label>
                                <input type="date" id="checkout" name="checkout" class="form-control" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="guests"><i class="fas fa-user-friends"></i> Guests</label>
                                <select id="guests" name="guests" class="form-control" required>
                                    <option value="1">1 Guest</option>
                                    <option value="2" selected>2 Guests</option>
                                    <option value="3">3 Guests</option>
                                    <option value="4">4 Guests</option>
                                    <option value="5">5+ Guests</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="rooms"><i class="fas fa-door-closed"></i> Number of Rooms</label>
                                <select id="rooms" name="rooms" class="form-control" required>
                                    <option value="1">1 Room</option>
                                    <option value="2">2 Rooms</option>
                                    <option value="3">3 Rooms</option>
                                    <option value="4">4 Rooms</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="roomType"><i class="fas fa-bed"></i> Room Type</label>
                            <select id="roomType" name="roomType" class="form-control" required>
                                <option value="standard">Standard Room</option>
                                <option value="deluxe">Deluxe Room</option>
                                <option value="suite">Executive Suite</option>
                                <option value="family">Family Room</option>
                            </select>
                        </div>
                        
                        <div class="booking-footer">
                            <div class="price-breakdown">
                                <div class="price-display">₹<%=price%> <span style="font-size: 0.8rem;">per night</span></div>
                                <a href="#" class="price-details" onclick="alert('Price includes all taxes and fees.')">View price details</a>
                            </div>
                            
                            <button type="submit" class="btn">
                                Proceed to Payment <i class="fas fa-arrow-right"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
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
                <h3 class="footer-title">Destinations</h3>
                <ul class="footer-links">
                    <li><a href="#">Beach Destinations</a></li>
                    <li><a href="#">Mountain Retreats</a></li>
                    <li><a href="#">City Breaks</a></li>
                    <li><a href="#">Popular Attractions</a></li>
                </ul>
            </div>
            
            <div>
                <h3 class="footer-title">Contact Us</h3>
                <ul class="footer-links">
                    <li><i class="fas fa-phone"></i> +1 (800) 123-4567</li>
                    <li><i class="fas fa-envelope"></i> support@TripBuddy.com</li>
                    <li><i class="fas fa-map-marker-alt"></i> 123 Luxury Avenue, Suite 500</li>
                </ul>
            </div>
        </div>
        
        <div class="copyright">
            &copy; 2025 TripBuddy. All rights reserved.
        </div>
    </footer>
    
    <script>
        // Set minimum date for check-in to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('checkin').min = today;
        
        // Set minimum date for check-out to tomorrow
        const tomorrow = new Date();
        tomorrow.setDate(tomorrow.getDate() + 1);
        document.getElementById('checkout').min = tomorrow.toISOString().split('T')[0];
        
        // Update check-out minimum date when check-in date changes
        document.getElementById('checkin').addEventListener('change', function() {
            const checkinDate = new Date(this.value);
            checkinDate.setDate(checkinDate.getDate() + 1);
            const newMinCheckout = checkinDate.toISOString().split('T')[0];
            document.getElementById('checkout').min = newMinCheckout;
            
            // If current checkout date is now invalid, update it
            if (document.getElementById('checkout').value < newMinCheckout) {
                document.getElementById('checkout').value = newMinCheckout;
            }
        });
    </script>
</body>
</html>

<%}
else{
      response.sendRedirect("Login.jsp");
}
%>