<%@page import="java.sql.SQLException"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%
   
       session =request.getSession(false);
      String useremail=(String) session.getAttribute("useremail");
   
      
  if(useremail!=null)
  {
      
  
    String name = "", email = "", mobile = "", city = "", age = "", gender = "", budget = "", fdate = "", tdate = "";

    try {
        String email1 = (String) session.getAttribute("useremail");
        Statement st = DBConnector.getStatement();
        String query = "SELECT * FROM tb WHERE email='" + email1 + "'";
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            name = rs.getString(1);
            email = rs.getString(2);
            age = rs.getString(4);
            gender = rs.getString(5);
            mobile = rs.getString(6);
            budget = rs.getString(8);
            city = rs.getString(7);
            fdate = rs.getString(9);
            tdate = rs.getString(10);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | Trip Buddy</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #1a78e3, #0f4c81);
            --secondary-gradient: linear-gradient(135deg, #23c4ed, #3a86ff);
            --accent-color: #22d3ee;
            --text-light: #f0f9ff;
            --text-dark: #1e293b;
            --card-bg: rgba(255, 255, 255, 0.15);
            --card-hover: rgba(255, 255, 255, 0.25);
            --shadow-sm: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-md: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-lg: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --border-radius: 16px;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', 'Roboto', sans-serif;
            background: var(--primary-gradient);
            color: var(--text-light);
            min-height: 100vh;
            position: relative;
            padding-bottom: 80px;
        }
        
        .page-wrapper {
            position: relative;
            z-index: 1;
            overflow: hidden;
        }
        
        .page-wrapper::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100' height='100' viewBox='0 0 100 100'%3E%3Cg fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.05'%3E%3Cpath opacity='0.5' d='M96 95h4v1h-4v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9zm-1 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
            z-index: -1;
        }
        
        /* Navigation Bar Styling */
        .nav-container {
            position: relative;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            z-index: 1000;
        }
        
        .home-button {
            padding: 8px 16px;
            background-color: #2196F3;
            color: white;
            font-size: 14px;
            font-family: Arial, sans-serif;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            box-shadow: 2px 2px 6px rgba(0,0,0,0.3);
            transition: background-color 0.3s, transform 0.2s;
        }
        
        .home-button:hover {
            background-color: #1976D2;
        }
        
        .home-button:active {
            transform: scale(0.98);
        }
        
        .signout-btn {
            background-color: #f44336;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s;
            box-shadow: 2px 2px 6px rgba(0,0,0,0.3);
        }
        
        .signout-btn:hover {
            background-color: #d32f2f;
        }
        
        .header {
            padding: 25px 0;
            text-align: center;
            position: relative;
            margin-top: 20px;
        }
        
        .header::after {
            content: '';
            position: absolute;
            left: 50%;
            bottom: 0;
            transform: translateX(-50%);
            width: 50px;
            height: 4px;
            background: var(--accent-color);
            border-radius: 2px;
        }
        
        .logo {
            font-size: 32px;
            font-weight: 700;
            background: var(--secondary-gradient);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
            letter-spacing: 1px;
            margin-bottom: 5px;
        }
        
        .subheading {
            color: rgba(255, 255, 255, 0.8);
            font-size: 18px;
            font-weight: 300;
        }
        
        .container {
            max-width: 900px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        .profile-card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-md);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            padding: 40px;
            margin-bottom: 30px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            animation: fadeIn 0.8s ease-out;
        }
        
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
            position: relative;
        }
        
        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: var(--secondary-gradient);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: var(--shadow-md);
            margin-right: 20px;
            border: 4px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }
        
        .avatar-text {
            font-size: 40px;
            font-weight: bold;
            color: white;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        
        .profile-titles {
            flex: 1;
        }
        
        .profile-name {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--text-light);
        }
        
        .profile-tag {
            display: inline-block;
            background: rgba(34, 211, 238, 0.2);
            color: var(--accent-color);
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(34, 211, 238, 0.3);
        }
        
        .stats-container {
            display: flex;
            justify-content: space-around;
            text-align: center;
            margin: 40px 0;
            flex-wrap: wrap;
        }
        
        .stat-box {
            flex: 1;
            min-width: 120px;
            background: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 12px;
            margin: 0 10px 20px;
            transition: transform 0.3s ease, background 0.3s ease;
        }
        
        .stat-box:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.15);
        }
        
        .stat-value {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--accent-color);
        }
        
        .stat-label {
            font-size: 14px;
            color: rgba(255, 255, 255, 0.7);
        }
        
        .profile-details {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 20px;
        }
        
        .detail-item {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 20px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(5px);
        }
        
        .detail-item:hover {
            background: var(--card-hover);
            transform: translateY(-2px);
            box-shadow: var(--shadow-sm);
        }
        
        .detail-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: var(--secondary-gradient);
            border-radius: 2px 0 0 2px;
        }
        
        .detail-label {
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 5px;
            color: rgba(255, 255, 255, 0.7);
            display: flex;
            align-items: center;
        }
        
        .detail-label i {
            margin-right: 8px;
            color: var(--accent-color);
            font-size: 16px;
        }
        
        .detail-value {
            font-size: 18px;
            font-weight: 500;
            color: var(--text-light);
            word-break: break-word;
        }
        
        .actions {
            text-align: center;
            margin-top: 40px;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: var(--secondary-gradient);
            color: white;
            padding: 14px 28px;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-md);
            position: relative;
            overflow: hidden;
        }
        
        .btn:hover {
            box-shadow: var(--shadow-lg);
            transform: translateY(-3px);
        }
        
        .btn::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: -100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: 0.5s;
        }
        
        .btn:hover::after {
            left: 100%;
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        .footer {
            text-align: center;
            padding: 25px 20px;
            position: absolute;
            bottom: 0;
            width: 100%;
            background: rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
        }
        
        .footer-content {
            color: rgba(255, 255, 255, 0.7);
            font-size: 14px;
        }
        
        .highlight {
            color: var(--accent-color);
            font-weight: 500;
        }
        
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(34, 211, 238, 0.7); }
            70% { box-shadow: 0 0 0 15px rgba(34, 211, 238, 0); }
            100% { box-shadow: 0 0 0 0 rgba(34, 211, 238, 0); }
        }
        
        /* Responsive Styles */
        @media (max-width: 768px) {
            .profile-header {
                flex-direction: column;
                text-align: center;
            }
            
            .profile-avatar {
                margin: 0 auto 20px;
            }
            
            .stats-container {
                flex-direction: column;
            }
            
            .stat-box {
                margin-bottom: 15px;
            }
            
            .profile-details {
                grid-template-columns: 1fr;
            }
            
            .nav-container {
                flex-direction: column;
                gap: 10px;
            }
        }
        
        @media (max-width: 480px) {
            .profile-card {
                padding: 25px 15px;
            }
            
            .profile-name {
                font-size: 24px;
            }
            
            .detail-item {
                padding: 15px;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="page-wrapper">
        <!-- Navigation Bar -->
        <div class="nav-container">
            <a href="Home.jsp" class="home-button">Home</a>
            <a href="Logout.jsp" class="signout-btn">Sign Out</a>
        </div>
        
        <div class="header">
            <div class="logo">Trip Buddy</div>
            <div class="subheading">Your Personal Travel Companion</div>
        </div>
        
        <div class="container">
            <div class="profile-card">
                <div class="profile-header">
                    <div class="profile-avatar">
                        <div class="avatar-text"><%=name.isEmpty() ? "?" : name.substring(0, 1).toUpperCase()%></div>
                    </div>
                    <div class="profile-titles">
                        <h1 class="profile-name"><%=name%></h1>
                        <span class="profile-tag">Adventure Seeker</span>
                    </div>
                </div>
                
                <div class="stats-container">
                    <div class="stat-box">
                        <div class="stat-value"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="stat-label"><%=city%></div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-value"><i class="fas fa-wallet"></i></div>
                        <div class="stat-label">Budget:<%=budget%></div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-value"><i class="fas fa-calendar-alt"></i></div>
                        <div class="stat-label"><%=getDaysBetween(fdate, tdate)%> Days Trip</div>
                    </div>
                </div>
                
                <div class="profile-details">
                    <div class="detail-item">
                        <div class="detail-label"><i class="fas fa-envelope"></i> Email</div>
                        <div class="detail-value"><%=email%></div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label"><i class="fas fa-phone"></i> Mobile</div>
                        <div class="detail-value"><%=mobile%></div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label"><i class="fas fa-birthday-cake"></i> Age</div>
                        <div class="detail-value"><%=age%> years</div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label"><i class="fas fa-venus-mars"></i> Gender</div>
                        <div class="detail-value"><%=gender%></div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label"><i class="fas fa-plane-departure"></i> Trip Start Date</div>
                        <div class="detail-value"><%=formatDate(fdate)%></div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label"><i class="fas fa-plane-arrival"></i> Trip End Date</div>
                        <div class="detail-value"><%=formatDate(tdate)%></div>
                    </div>
                </div>
                
                <div class="actions">
                    <form action="Edit_Profile.jsp" method="post">
                        <button type="submit" class="btn">
                            <i class="fas fa-user-edit"></i> Edit Profile
                        </button>
                    </form>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <div class="footer-content">
                &copy; 2025 <span class="highlight">Trip Buddy</span> | Designed for Smart India Hackathon
            </div>
        </div>
    </div>
    
    <%!
        public String formatDate(String dateStr) {
            if (dateStr == null || dateStr.isEmpty()) {
                return "Not specified";
            }
            
            try {
                String[] dateParts = dateStr.split("-");
                if (dateParts.length >= 3) {
                    String year = dateParts[0];
                    String month = getMonthName(Integer.parseInt(dateParts[1]));
                    String day = dateParts[2];
                    return day + " " + month + " " + year;
                }
                return dateStr;
            } catch (Exception e) {
                return dateStr;
            }
        }
        
        public String getMonthName(int month) {
            String[] monthNames = {"", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
            if (month >= 1 && month <= 12) {
                return monthNames[month];
            }
            return "";
        }
        
        public String getDaysBetween(String startDate, String endDate) {
            if (startDate == null || endDate == null || startDate.isEmpty() || endDate.isEmpty()) {
                return "?";
            }
            
            try {
                java.time.LocalDate start = java.time.LocalDate.parse(startDate);
                java.time.LocalDate end = java.time.LocalDate.parse(endDate);
                long days = java.time.temporal.ChronoUnit.DAYS.between(start, end) + 1;
                return String.valueOf(days);
            } catch (Exception e) {
                return "?";
            }
        }
    %>
</body>
</html>
<%}
else{
      response.sendRedirect("Login.jsp");
}
%>