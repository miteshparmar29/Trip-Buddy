<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>My Profile | Trip Buddy</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #f4f4f4;
    }

    header {
      background-color: #0077b6;
      color: white;
      padding: 20px;
      text-align: center;
    }

    nav {
      display: flex;
      justify-content: center;
      background-color: #023e8a;
    }

    nav a {
      color: white;
      padding: 14px 20px;
      text-decoration: none;
    }

    nav a:hover {
      background-color: #0096c7;
    }

    .container {
      max-width: 1000px;
      margin: 30px auto;
      background: white;
      padding: 30px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
      border-radius: 10px;
    }

    h2 {
      color: #0077b6;
    }

    .section {
      margin-bottom: 30px;
    }

    .section h3 {
      margin-bottom: 10px;
      color: #023e8a;
      border-bottom: 1px solid #ccc;
      padding-bottom: 5px;
    }

    .info-box, .booking-card {
      background-color: #f1faff;
      border-left: 5px solid #0096c7;
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 5px;
    }

    footer {
      background-color: #03045e;
      color: white;
      text-align: center;
      padding: 10px;
      margin-top: 40px;
    }
  </style>
</head>
<body>

  <!-- Header -->
  <header>
    <h1>Trip Buddy</h1>
    <p>Welcome to Your Profile</p>
  </header>

  <!-- Navigation -->
  <nav>
    <a href="#">Home</a>
    <a href="#">My Profile</a>
    <a href="#">Bookings</a>
    <a href="#">Saved Packages</a>
    <a href="#">Logout</a>
  </nav>

  <!-- Profile Container -->
  <div class="container">

    <!-- User Info -->
    <div class="section">
      <h2>Profile Overview</h2>
      <div class="info-box">
        <p><strong>Name:</strong> Mitali Patidar</p>
        <p><strong>Email:</strong> mitali@example.com</p>
        <p><strong>Phone:</strong> +91-9876543210</p>
        <p><strong>City:</strong> Indore</p>
      </div>
    </div>

    <!-- Booking History -->
    <div class="section">
      <h3>Booking History</h3>
      <div class="booking-card">
        <p><strong>Hotel:</strong> Radisson Blu</p>
        <p><strong>Check-in:</strong> 20th April 2025</p>
        <p><strong>Status:</strong> Confirmed</p>
      </div>
      <div class="booking-card">
        <p><strong>Vehicle Rental:</strong> Swift Dzire (With Driver)</p>
        <p><strong>From:</strong> 20th April</p>
        <p><strong>To:</strong> 22nd April</p>
        <p><strong>Status:</strong> Confirmed</p>
      </div>
    </div>

    <!-- Saved Packages -->
    <div class="section">
      <h3>Saved Packages</h3>
      <div class="info-box">
        <p><strong>Package Name:</strong> Indore Darshan Special</p>
        <p><strong>Includes:</strong> Hotel Stay + Bike Rental + City Tour</p>
        <p><strong>Status:</strong> Not Booked</p>
      </div>
    </div>

  </div>

</body>
</html>
