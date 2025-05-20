<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.*"%>
<%@page import="db.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Search Results</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #2a52be;
            --secondary-color: #f8f9fa;
            --accent-color: #ff6b6b;
            --text-color: #333;
            --light-gray: #e9ecef;
            --card-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', 'Roboto', sans-serif;
            background-color: var(--secondary-color);
            color: var(--text-color);
            line-height: 1.6;
        }
        
        .header {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px 0;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .page-title {
            font-size: 28px;
            font-weight: 600;
            color: var(--primary-color);
            margin: 30px 0;
            text-align: center;
        }
        
        .hotel-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
            margin-bottom: 40px;
        }
        
        .hotel-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--card-shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        
        .hotel-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.15);
        }
        
        .image-container {
            position: relative;
            height: 200px;
            overflow: hidden;
        }
        
        .hotel-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .hotel-card:hover .hotel-image {
            transform: scale(1.05);
        }
        
        .hotel-info {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }
        
        .hotel-name {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--primary-color);
        }
        
        .hotel-location {
            color: #666;
            font-size: 14px;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
        }
        
        .hotel-location i {
            margin-right: 5px;
            color: var(--primary-color);
        }
        
        .hotel-rating {
            margin-bottom: 15px;
            color: #ffc107;
        }
        
        .hotel-features {
            margin-bottom: 15px;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .feature {
            background-color: var(--light-gray);
            border-radius: 15px;
            padding: 4px 10px;
            font-size: 12px;
            color: #666;
        }
        
        .price-container {
            margin-top: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .hotel-price {
            font-size: 20px;
            font-weight: 600;
            color: var(--primary-color);
        }
        
        .price-label {
            font-size: 12px;
            color: #888;
        }
        
        .view-button {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-weight: 500;
        }
        
        .view-button:hover {
            background-color: #1e40af;
        }
        
        .pagination {
            display: flex;
            justify-content: center;
            margin: 40px 0;
            gap: 5px;
        }
        
        .page-link {
            padding: 8px 15px;
            border-radius: 5px;
            background-color: white;
            color: var(--primary-color);
            border: 1px solid #dee2e6;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .page-link:hover {
            background-color: var(--light-gray);
        }
        
        .page-link.active {
            background-color: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }
        
        .no-results {
            text-align: center;
            padding: 50px 0;
            font-size: 18px;
            color: #666;
        }
        
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
            text-align: center;
        }
        
        @media (max-width: 992px) {
            .hotel-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 576px) {
            .hotel-grid {
                grid-template-columns: 1fr;
            }
            
            .page-title {
                font-size: 24px;
            }
        }
        .home-icon {
            font-size: 20px;
            text-decoration: none;
            color: #333;
            display: flex;
            align-items: center;
            transition: color 0.3s ease;
        }

        .home-icon:hover {
            color: #FF6A00;
        }

        .home-icon img {
            width: 24px;
            height: 24px;
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <a href="Home.jsp" class="home-icon">
            <img src="https://cdn-icons-png.flaticon.com/512/25/25694.png" alt="Home Icon">
            Home
        </a>

    <div class="header">
        <div class="container">
            <h1 class="page-title">Discover Your Perfect Stay</h1>
        </div>
    </div>

    <div class="container">
        <%
            // Get current page from request parameter, default to 1
            int currentPage = 1;
            try {
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    currentPage = Integer.parseInt(pageParam);
                    if (currentPage < 1) currentPage = 1;
                }
            } catch (NumberFormatException e) {
                // Keep default value if parameter is invalid
            }
            
            // Number of hotels per page
            final int HOTELS_PER_PAGE = 6;
            
            try {
                Statement st = DBConnector.getStatement();
                // Get total count first
                String countQuery = "SELECT COUNT(*) as total FROM hotels WHERE Status='Available'";
                ResultSet countRs = st.executeQuery(countQuery);
                countRs.next();
                int totalHotels = countRs.getInt("total");
                int totalPages = (int) Math.ceil((double) totalHotels / HOTELS_PER_PAGE);
                
                // Ensure current page doesn't exceed total pages
                if (currentPage > totalPages && totalPages > 0) {
                    currentPage = totalPages;
                }
                
                // Adjust the query to get randomized results with pagination
                String query = "SELECT Hotel_name, image FROM hotels WHERE Status='Available' ORDER BY RAND()";
                ResultSet rs = st.executeQuery(query);
                
                // For random order, we need to gather all hotels and then paginate
                List<Map<String, Object>> allHotels = new ArrayList<>();
                
                while (rs.next()) {
                    Map<String, Object> hotel = new HashMap<>();
                    hotel.put("name", rs.getString("Hotel_name"));
                    
                    // Process image
                    byte[] imgBytes = rs.getBytes("image");
                    String base64Image = "";
                    if (imgBytes != null) {
                        base64Image = Base64.getEncoder().encodeToString(imgBytes);
                    }
                    hotel.put("image", base64Image);
                    
                    // Generate demo data for enhanced UI
                    hotel.put("location", getRandomLocation());
                    hotel.put("rating", getRandomRating());
                    hotel.put("price", (int)(Math.random() * 2000 + 1500)); // ₹1500 - ₹3500
                    hotel.put("features", getRandomFeatures());
                    
                    allHotels.add(hotel);
                }
                
                // Randomize the list
                Collections.shuffle(allHotels);
                
                // Calculate pagination indexes
                int startIndex = (currentPage - 1) * HOTELS_PER_PAGE;
                int endIndex = Math.min(startIndex + HOTELS_PER_PAGE, allHotels.size());
                
                if (allHotels.isEmpty()) {
        %>
                <div class="no-results">
                    <i class="fas fa-exclamation-circle" style="font-size: 48px; color: #ccc; margin-bottom: 20px;"></i>
                    <p>No available hotels found at the moment.</p>
                    <p>Please check back later or modify your search criteria.</p>
                </div>
        <%
                } else {
        %>
                <div class="hotel-grid">
        <% 
                    // Display only hotels for the current page
                    for (int i = startIndex; i < endIndex; i++) {
                        Map<String, Object> hotel = allHotels.get(i);
                        String hotelName = (String) hotel.get("name");
                        String base64Image = (String) hotel.get("image");
                        String location = (String) hotel.get("location");
                        double rating = (Double) hotel.get("rating");
                        int price = (Integer) hotel.get("price");
                        List<String> features = (List<String>) hotel.get("features");
        %>
                    <a href="Hoteldetails.jsp?hotelName=<%=URLEncoder.encode(hotelName, "UTF-8")%>" style="text-decoration: none; color: inherit;">
                        <div class="hotel-card">
                            <div class="image-container">
                                <img class="hotel-image" src="data:image/jpeg;base64,<%=base64Image%>" alt="<%=hotelName%>">
                            </div>
                            <div class="hotel-info">
                                <h3 class="hotel-name"><%=hotelName%></h3>
                                <div class="hotel-location">
                                    <i class="fas fa-map-marker-alt"></i> <%=location%>
                                </div>
                                <div class="hotel-rating">
                                    <%
                                        // Display stars based on rating
                                        for (int star = 0; star < Math.floor(rating); star++) {
                                    %>
                                        <i class="fas fa-star"></i>
                                    <%
                                        }
                                        if (rating % 1 != 0) {
                                    %>
                                        <i class="fas fa-star-half-alt"></i>
                                    <%
                                        }
                                   rating=5;
                                    %>
                                    <span style="color: #666; margin-left: 5px;"><%=rating%></span>
                                </div>
                                <div class="hotel-features">
                                    <% for (String feature : features) { %>
                                        <span class="feature"><i class="fas fa-check" style="margin-right: 3px;"></i> <%=feature%></span>
                                    <% } %>
                                </div>
                                <div class="price-container">
                                    <div>
                                        <div class="hotel-price">₹<%=price%></div>
                                        <div class="price-label">per night</div>
                                    </div>
                                    <div class="view-button">View Details</div>
                                </div>
                            </div>
                        </div>
                    </a>
        <%
                    }
        %>
                </div>
                
                <!-- Pagination -->
                <div class="pagination">
                    <% if (currentPage > 1) { %>
                        <a href="?page=<%=currentPage - 1%>" class="page-link"><i class="fas fa-chevron-left"></i></a>
                    <% } %>
                    
                    <%
                        // Display page numbers with ellipsis for large number of pages
                        int startPage = Math.max(1, currentPage - 2);
                        int endPage = Math.min(totalPages, currentPage + 2);
                        
                        if (startPage > 1) {
                    %>
                        <a href="?page=1" class="page-link">1</a>
                        <% if (startPage > 2) { %>
                            <span class="page-link" style="cursor: default;">...</span>
                        <% } %>
                    <%
                        }
                        
                        for (int i = startPage; i <= endPage; i++) {
                    %>
                        <a href="?page=<%=i%>" class="page-link <%= (i == currentPage) ? "active" : "" %>"><%=i%></a>
                    <%
                        }
                        
                        if (endPage < totalPages) {
                            if (endPage < totalPages - 1) {
                    %>
                            <span class="page-link" style="cursor: default;">...</span>
                    <%
                            }
                    %>
                        <a href="?page=<%=totalPages%>" class="page-link"><%=totalPages%></a>
                    <%
                        }
                        
                        if (currentPage < totalPages) {
                    %>
                        <a href="?page=<%=currentPage + 1%>" class="page-link"><i class="fas fa-chevron-right"></i></a>
                    <%
                        }
                    %>
                </div>
        <%
                }
            } catch (Exception e) {
        %>
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle" style="margin-right: 8px;"></i>
                    Error: <%=e.getMessage()%>
                </div>
        <%
                e.printStackTrace();
            }
        %>
    </div>
    
    <script>
        // Helper function to add some animation effects
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.hotel-card');
            cards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-10px)';
                    this.style.boxShadow = '0 15px 30px rgba(0,0,0,0.2)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                    this.style.boxShadow = '0 8px 20px rgba(0,0,0,0.1)';
                });
            });
        });
    </script>
</body>
</html>

<%!
    // Helper methods for generating random demo data
    private String getRandomLocation() {
        String[] locations = {
            "Downtown", "Beachfront", "City Center", "Marina Bay", 
            "Business District", "Historic Center", "Riverfront", 
            "Entertainment District", "Resort Area", "Luxury Quarter"
        };
        return locations[(int)(Math.random() * locations.length)];
    }
    
    private double getRandomRating() {
        // Generate rating between 3.5 and 5.0 with one decimal place
        return Math.round((3.5 + Math.random() * 1.5) * 10) / 10.0;
    }
    
    private List<String> getRandomFeatures() {
        String[] allFeatures = {
            "Free WiFi", "Breakfast", "Pool", "Spa", "Gym",
            "Restaurant", "Bar", "Room Service", "Parking", "Airport Shuttle",
            "Pet Friendly", "Business Center", "Concierge", "AC", "Laundry"
        };
        
        // Pick 3-4 random features
        int featureCount = 3 + (int)(Math.random() * 2);
        List<String> selectedFeatures = new ArrayList<>();
        List<String> featurePool = new ArrayList<>(Arrays.asList(allFeatures));
        Collections.shuffle(featurePool);
        
        for (int i = 0; i < featureCount && i < featurePool.size(); i++) {
            selectedFeatures.add(featurePool.get(i));
        }
        
        return selectedFeatures;
    }
%>