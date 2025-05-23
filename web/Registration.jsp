<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trip Buddy - Registration</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f0f4f8;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Header Styles */
        header {
            background-color: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
        }
        
        .logo {
            font-size: 26px;
            font-weight: 700;
            color: #2563eb;
            text-decoration: none;
            display: flex;
            align-items: center;
        }
        
        .logo i {
            margin-right: 8px;
        }
        
        .nav-menu {
            display: flex;
            list-style: none;
        }
        
        .nav-menu li {
            margin-left: 30px;
        }
        
        .nav-menu a {
            text-decoration: none;
            color: #1f2937;
            font-weight: 500;
            transition: all 0.3s;
            position: relative;
            padding: 5px 0;
        }
        
        .nav-menu a:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background-color: #2563eb;
            transition: width 0.3s;
        }
        
        .nav-menu a:hover {
            color: #2563eb;
        }
        
        .nav-menu a:hover:after {
            width: 100%;
        }
        
        /* Registration Form Styles */
        .registration-section {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 0;
            flex-grow: 1;
        }
        
        .registration-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
            width: 100%;
            max-width: 650px;
            padding: 40px;
            transition: transform 0.3s;
        }
        
        .registration-container:hover {
            transform: translateY(-5px);
        }
        
        .registration-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .registration-header h1 {
            color: #1f2937;
            font-size: 32px;
            margin-bottom: 12px;
            background: linear-gradient(90deg, #2563eb, #3b82f6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .registration-header p {
            color: #6b7280;
            font-size: 16px;
        }
        
        .form-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .form-table td {
            padding: 12px 0;
            vertical-align: top;
        }
        
        .form-table td:first-child {
            width: 35%;
            font-weight: 500;
            color: #4b5563;
            padding-top: 18px;
        }
        
        .input-group {
            position: relative;
            width: 100%;
        }
        
        .form-input, .form-select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s;
            background-color: #f9fafb;
        }
        
        .form-input:focus, .form-select:focus {
            border-color: #3b82f6;
            outline: none;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
            background-color: #fff;
        }
        
        .form-select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%234b5563' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 16px;
        }
        
        .error-message {
            color: #dc2626;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }
        
        .gender-options {
            display: flex;
            gap: 20px;
            margin-top: 5px;
        }
        
        .gender-option {
            display: flex;
            align-items: center;
        }
        
        .gender-option input[type="radio"] {
            appearance: none;
            width: 18px;
            height: 18px;
            border: 2px solid #d1d5db;
            border-radius: 50%;
            margin-right: 8px;
            position: relative;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .gender-option input[type="radio"]:checked {
            border-color: #2563eb;
        }
        
        .gender-option input[type="radio"]:checked::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 10px;
            height: 10px;
            background-color: #2563eb;
            border-radius: 50%;
        }
        
        .gender-option label {
            cursor: pointer;
            font-size: 15px;
        }
        
        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
        }
        
        .login-link {
            color: #2563eb;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .login-link:hover {
            color: #1d4ed8;
            text-decoration: underline;
        }
        
        .submit-btn {
            background: linear-gradient(90deg, #2563eb, #3b82f6);
            color: white;
            border: none;
            padding: 14px 28px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 4px 6px rgba(37, 99, 235, 0.2);
        }
        
        .submit-btn:hover {
            background: linear-gradient(90deg, #1d4ed8, #2563eb);
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(37, 99, 235, 0.3);
        }
        
        .submit-btn:active {
            transform: translateY(0);
            box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
        }
        
        /* Footer */
        footer {
            background-color: #1f2937;
            color: white;
            padding: 35px 0;
            margin-top: auto;
        }
        
        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .footer-links {
            display: flex;
            list-style: none;
            gap: 25px;
        }
        
        .footer-links a {
            color: #d1d5db;
            text-decoration: none;
            transition: color 0.3s;
            font-weight: 500;
        }
        
        .footer-links a:hover {
            color: white;
        }
        
        .copyright {
            color: #9ca3af;
            font-size: 14px;
        }
        
        /* Form Validation Styling */
        .form-input.error, .form-select.error {
            border-color: #dc2626;
            background-color: #fef2f2;
        }
        
        .form-input.valid, .form-select.valid {
            border-color: #10b981;
            background-color: #f0fdf4;
        }
        
        /* Loading animation for form submission */
        .loading {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(255,255,255,.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
            margin-left: 10px;
            display: none;
        }
        
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                gap: 15px;
            }
            
            .nav-menu {
                margin-top: 15px;
                justify-content: center;
            }
            
            .nav-menu li {
                margin: 0 10px;
            }
            
            .registration-container {
                padding: 30px 20px;
                margin: 20px;
            }
            
            .form-table td {
                display: block;
                width: 100%;
            }
            
            .form-table td:first-child {
                padding-bottom: 5px;
                padding-top: 15px;
            }
            
            .footer-content {
                flex-direction: column;
                gap: 20px;
                text-align: center;
            }
            
            .footer-links {
                justify-content: center;
                flex-wrap: wrap;
            }
        }

        /* Success message */
        .success-message {
            display: none;
            background-color: #ecfdf5;
            color: #10b981;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 500;
            border: 1px solid #10b981;
        }

        /* Calendar input styling */
        input[type="date"] {
            appearance: none;
            padding-right: 35px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%234b5563' viewBox='0 0 16 16'%3E%3Cpath d='M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 16px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container header-container">
            <a href="Home1.jsp" class="logo"><i class="fas fa-plane-departure"></i> Trip Buddy</a>
            
        </div>
    </header>
    
    <!-- Registration Form Section -->
    <section class="registration-section">
        <div class="container">
            <div class="registration-container">
                <div class="success-message" id="successMessage">
                    Account created successfully! Redirecting to login...
                </div>
                
                <div class="registration-header">
                    <h1>Create Your Account</h1>
                    <p>Join Trip Buddy and unlock exclusive travel deals and personalized experiences.</p>
                </div>
                
                <form id="registrationForm" action="RegistrationChecker" method="post" novalidate>
                    <table class="form-table">
                        <tr>
                            <td>Full Name:</td>
                            <td>
                                <div class="input-group">
                                    <input type="text" id="name" name="name" placeholder="Enter your full name" class="form-input" required>
                                    <span class="error-message" id="nameError">Please enter your full name</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Email Address:</td>
                            <td>
                                <div class="input-group">
                                    <input type="email" id="email" name="email" placeholder="Enter your email address" class="form-input" required>
                                    <span class="error-message" id="emailError">Please enter a valid email address</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td>
                                <div class="input-group">
                                    <input type="password" id="password" name="password" placeholder="Create a secure password (min. 8 characters)" class="form-input" required>
                                    <span class="error-message" id="passwordError">Password must be at least 8 characters with letters and numbers</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Confirm Password:</td>
                            <td>
                                <div class="input-group">
                                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" class="form-input" required>
                                    <span class="error-message" id="confirmPasswordError">Passwords do not match</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Age:</td>
                            <td>
                                <div class="input-group">
                                    <input type="number" id="age" name="age" placeholder="Enter your age" class="form-input" min="18" max="120" required>
                                    <span class="error-message" id="ageError">Age must be between 18 and 120</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Gender:</td>
                            <td>
                                <div class="gender-options">
                                    <div class="gender-option">
                                        <input type="radio" id="male" name="gender" value="Male" required>
                                        <label for="male">Male</label>
                                    </div>
                                    <div class="gender-option">
                                        <input type="radio" id="female" name="gender" value="Female">
                                        <label for="female">Female</label>
                                    </div>
                                    <div class="gender-option">
                                        <input type="radio" id="other" name="gender" value="Other">
                                        <label for="other">Other</label>
                                    </div>
                                </div>
                                <span class="error-message" id="genderError">Please select your gender</span>
                            </td>
                        </tr>
                        <tr>
                            <td>Contact Number:</td>
                            <td>
                                <div class="input-group">
                                    <input type="tel" id="mobile" name="mobile" placeholder="Enter your contact number" class="form-input" required>
                                    <span class="error-message" id="mobileError">Please enter a valid phone number</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>City:</td>
                            <td>
                                <div class="input-group">
                                    <select name="city" id="city" class="form-select" required>
                                        <option value="">Select your city</option>
                                        <option value="Abohar">Abohar</option>
                                        <option value="Abu Road">Abu Road</option>
                                        <option value="Adilabad">Adilabad</option>
                                        <option value="Agartala">Agartala</option>
                                        <option value="Agra">Agra</option>
                                        <option value="Ahmed Nagar">Ahmed Nagar</option>
                                        <option value="Ahmedabad">Ahmedabad</option>
                                        <option value="Ahmednagar">Ahmednagar</option>
                                        <option value="Aizawl">Aizawl</option>
                                        <option value="Ajmer">Ajmer</option>
                                        <option value="Akashiganga">Akashiganga</option>
                                        <option value="Akbarpur">Akbarpur</option>
                                        <option value="Akhnoor">Akhnoor</option>
                                        <option value="Akluj">Akluj</option>
                                        <option value="Akola">Akola</option>
                                        <option value="Alappuza">Alappuza</option>
                                        <option value="Alappuzha">Alappuzha</option>
                                        <option value="Aligarh">Aligarh</option>
                                        <option value="Allahabad">Allahabad</option>
                                        <option value="Almora">Almora</option>
                                        <option value="Alwar">Alwar</option>
                <option value="Amalapuram">Amalapuram</option>
                <option value="Amaravati">Amaravati</option>
                <option value="Ambajogai">Ambajogai</option>
                <option value="Ambala">Ambala</option>
                <option value="Ambedkar Nagar">Ambedkar Nagar</option>
                <option value="Ambegaon">Ambegaon</option>
                <option value="Amethi">Amethi</option>
                <option value="Amravati">Amravati</option>
                <option value="Amreli">Amreli</option>
                <option value="Amritsar">Amritsar</option>
                <option value="Amroha">Amroha</option>
                <option value="Anand">Anand</option>
                <option value="Anantapur">Anantapur</option>
                <option value="Ananthapur">Ananthapur</option>
                <option value="Angul">Angul</option>
                <option value="Anuppur">Anuppur</option>
                <option value="Arakkonam">Arakkonam</option>
                <option value="Araria">Araria</option>
                <option value="Arasaradi">Arasaradi</option>
                <option value="Arcot">Arcot</option>
                <option value="Ariyalur">Ariyalur</option>
                <option value="Armoor">Armoor</option>
                <option value="Arni">Arni</option>
                <option value="Arrah">Arrah</option>
                <option value="Arvalli">Arvalli</option>
                <option value="Arwal">Arwal</option>
                <option value="Asansol">Asansol</option>
                <option value="Ashoknagar">Ashoknagar</option>
                <option value="Attingal">Attingal</option>
                <option value="Attur">Attur</option>
                <option value="Aurangabad">Aurangabad</option>
                <option value="Aurangabad(Bh)">Aurangabad(Bh)</option>
                <option value="Avadi Camp">Avadi Camp</option>
                <option value="Baddi">Baddi</option>
                <option value="Badlapur">Badlapur</option>
                <option value="Bagalkot">Bagalkot</option>
                <option value="Bagpat">Bagpat</option>
                <option value="Bahadurgarh">Bahadurgarh</option>
                <option value="Balaghat">Balaghat</option>
                <option value="Balasore">Balasore</option>
                <option value="Balwal">Balwal</option>
                <option value="Banas Kantha">Banas Kantha</option>
                <option value="Banaskantha">Banaskantha</option>
                <option value="Banasthali">Banasthali</option>
                <option value="Banda">Banda</option>
                <option value="Bangalore">Bangalore</option>
                <option value="Banka">Banka</option>
                <option value="Bankura">Bankura</option>
                <option value="Banswara">Banswara</option>
                <option value="Bapatla">Bapatla</option>
                <option value="Barabanki">Barabanki</option>
                <option value="Baramati">Baramati</option>
                <option value="Baramula">Baramula</option>
                <option value="Baramulla">Baramulla</option>
                <option value="Bardoli">Bardoli</option>
                <option value="Bareilly">Bareilly</option>
                <option value="Bargarh">Bargarh</option>
                <option value="Barmer">Barmer</option>
                <option value="Barnala">Barnala</option>
                <option value="Barrackpore">Barrackpore</option>
                <option value="Barsar">Barsar</option>
                <option value="Barshi">Barshi</option>
                <option value="Baruipur">Baruipur</option>
                <option value="Barwala">Barwala</option>
                <option value="Barwani">Barwani</option>
                <option value="Bastar">Bastar</option>
                <option value="Bathinda">Bathinda</option>
                <option value="Bavdhan">Bavdhan</option>
                <option value="Beed">Beed</option>
                <option value="Begusarai">Begusarai</option>
                <option value="Belagavi">Belagavi</option>
                <option value="Belapur">Belapur</option>
                <option value="Belgaum">Belgaum</option>
                <option value="Bellary">Bellary</option>
                <option value="Berhampore">Berhampore</option>
                <option value="Berhampur">Berhampur</option>
                <option value="Betul">Betul</option>
                <option value="Bhadohi">Bhadohi</option>
                <option value="Bhadrachalam">Bhadrachalam</option>
                <option value="Bhagalpur">Bhagalpur</option>
                <option value="Bhandara">Bhandara</option>
                <option value="Bharatpur">Bharatpur</option>
                <option value="Bharuch">Bharuch</option>
                <option value="Bhatinda">Bhatinda</option>
                <option value="Bhavnagar">Bhavnagar</option>
                <option value="Bhilai">Bhilai</option>
                <option value="Bhilwara">Bhilwara</option>
                <option value="Bhimavaram">Bhimavaram</option>
                <option value="Bhimtal">Bhimtal</option>
                <option value="Bhiwani">Bhiwani</option>
                <option value="Bhojpur">Bhojpur</option>
                <option value="Bhongir">Bhongir</option>
                <option value="Bhopal">Bhopal</option>
                <option value="Bhubaneswar">Bhubaneswar</option>
                <option value="Bhuj">Bhuj</option>
                <option value="Bhuranpur">Bhuranpur</option>
                <option value="Bidar">Bidar</option>
                <option value="Bijapur">Bijapur</option>
                <option value="Bijnor">Bijnor</option>
                <option value="Bikaner">Bikaner</option>
                <option value="Bilaspur">Bilaspur</option>
                <option value="Bilaspur(Hp)">Bilaspur(Hp)</option>
                <option value="Birbhum">Birbhum</option>
                <option value="Bishnupur (Wb)">Bishnupur (Wb)</option>
                <option value="Bobbili">Bobbili</option>
                <option value="Bokaro">Bokaro</option>
                <option value="Botad">Botad</option>
                <option value="Bulandshahr">Bulandshahr</option>
                <option value="Buldana">Buldana</option>
                <option value="Bundi">Bundi</option>
                <option value="Burdwan">Burdwan</option>
                <option value="Burhanpur">Burhanpur</option>
                <option value="Butibori">Butibori</option>
                <option value="Calicut">Calicut</option>
                <option value="Canchipur">Canchipur</option>
                <option value="Cannanore">Cannanore</option>
                <option value="Canning">Canning</option>
                <option value="Car Nicobar">Car Nicobar</option>
                <option value="Caranzalem">Caranzalem</option>
                <option value="Chamarajanagar">Chamarajanagar</option>
                <option value="Chambal">Chambal</option>
                <option value="Chamba">Chamba</option>
                <option value="Chamoli">Chamoli</option>
                <option value="Champawat">Champawat</option>
                <option value="Chandigarh">Chandigarh</option>
                <option value="Chandrapur">Chandrapur</option>
                <option value="Changlang">Changlang</option>
                <option value="Channapatna">Channapatna</option>
                <option value="Chatra">Chatra</option>
                <option value="Chavakkad">Chavakkad</option>
                <option value="Cheemeni">Cheemeni</option>
                <option value="Chengalpattu">Chengalpattu</option>
                <option value="Chengannur">Chengannur</option>
                <option value="Chennai">Chennai</option>
                <option value="Cherthala">Cherthala</option>
                <option value="Chhatarpur">Chhatarpur</option>
                <option value="Chhindwara">Chhindwara</option>
                <option value="Chidambaram">Chidambaram</option>
                <option value="Chikballapur">Chikballapur</option>
                <option value="Chikmagalur">Chikmagalur</option>
                <option value="Chikhli">Chikhli</option>
                <option value="Chilakaluripet">Chilakaluripet</option>
                <option value="Chinnakkampalayam">Chinnakkampalayam</option>
                <option value="Chintamani">Chintamani</option>
                <option value="Chitradurga">Chitradurga</option>
                <option value="Chitrakoot">Chitrakoot</option>
                <option value="Chittoor">Chittoor</option>
                <option value="Chittorgarh">Chittorgarh</option>
                <option value="Chodavaram">Chodavaram</option>
                <option value="Churachandpur">Churachandpur</option>
                <option value="Churu">Churu</option>
                <option value="Coimbatore">Coimbatore</option>
                <option value="Cooch Behar">Cooch Behar</option>
                <option value="Coonoor">Coonoor</option>
                <option value="Cuddalore">Cuddalore</option>
                <option value="Cuddapah">Cuddapah</option>
                <option value="Cumbum">Cumbum</option>
                <option value="Cuttack">Cuttack</option>
                <option value="Dadra">Dadra</option>
                <option value="Dahod">Dahod</option>
                <option value="Daman">Daman</option>
                <option value="Damoh">Damoh</option>
                <option value="Dantewada">Dantewada</option>
                <option value="Dapoli">Dapoli</option>
                <option value="Darbhanga">Darbhanga</option>
                <option value="Darjeeling">Darjeeling</option>
                <option value="Dasuya">Dasuya</option>
                <option value="Datia">Datia</option>
                <option value="Daulatabad">Daulatabad</option>
                <option value="Davangere">Davangere</option>
                <option value="Dehradun">Dehradun</option>
                <option value="Dehri">Dehri</option>
                <option value="Delhi">Delhi</option>
                <option value="Deoghar">Deoghar</option>
                <option value="Deoria">Deoria</option>
                <option value="Devakottai">Devakottai</option>
                <option value="Dewas">Dewas</option>
                <option value="Dhamtari">Dhamtari</option>
                <option value="Dhanbad">Dhanbad</option>
                <option value="Dhar">Dhar</option>
                <option value="Dharmapuri">Dharmapuri</option>
                <option value="Dharwad">Dharwad</option>
                <option value="Dhenkanal">Dhenkanal</option>
                <option value="Dholka">Dholka</option>
                <option value="Dhule">Dhule</option>
                <option value="Dibrugarh">Dibrugarh</option>
                <option value="Digboi">Digboi</option>
                <option value="Digha">Digha</option>
                <option value="Dimapur">Dimapur</option>
                <option value="Dinapur">Dinapur</option>
                <option value="Dindigul">Dindigul</option>
                <option value="Diu">Diu</option>
                <option value="Dodaballapur">Dodaballapur</option>
                <option value="Dombivli">Dombivli</option>
                <option value="Dumka">Dumka</option>
                <option value="Dungarpur">Dungarpur</option>
                <option value="Durg">Durg</option>
                <option value="Durgapur">Durgapur</option>
                <option value="Eluru">Eluru</option>
                <option value="Ernakulam">Ernakulam</option>
                <option value="Erode">Erode</option>
                <option value="Etah">Etah</option>
                <option value="Etawah">Etawah</option>
                <option value="Faizabad">Faizabad</option>
                <option value="Faridabad">Faridabad</option>
                <option value="Faridkot">Faridkot</option>
                <option value="Farrukhabad">Farrukhabad</option>
                <option value="Fatehabad">Fatehabad</option>
                <option value="Fatehgarh Sahib">Fatehgarh Sahib</option>
                <option value="Fatehpur">Fatehpur</option>
                <option value="Fazilka">Fazilka</option>
                <option value="Ferozepur">Ferozepur</option>
                <option value="Firozabad">Firozabad</option>
                <option value="Forbesganj">Forbesganj</option>
                <option value="Gadag">Gadag</option>
                <option value="Gadchiroli">Gadchiroli</option>
                <option value="Gadag">Gadag</option>
                <option value="Gandhinagar">Gandhinagar</option>
                <option value="Gangtok">Gangtok</option>
                <option value="Ganjam">Ganjam</option>
                <option value="Garhwa">Garhwa</option>
                <option value="Ghaziabad">Ghaziabad</option>
                <option value="Ghazipur">Ghazipur</option>
                <option value="Giddi">Giddi</option>
                <option value="Giridih">Giridih</option>
                <option value="Goalpara">Goalpara</option>
                <option value="Gobichettipalayam">Gobichettipalayam</option>
                <option value="Gokak">Gokak</option>
                <option value="Golaghat">Golaghat</option>
                <option value="Gondia">Gondia</option>
                <option value="Gonda">Gonda</option>
                <option value="Gopalganj">Gopalganj</option>
                <option value="Gorakhpur">Gorakhpur</option>
                <option value="Gowribidanur">Gowribidanur</option>
                <option value="Gulbarga">Gulbarga</option>
                <option value="Gumla">Gumla</option>
                <option value="Guna">Guna</option>
                <option value="Guntur">Guntur</option>
                <option value="Gurdaspur">Gurdaspur</option>
                <option value="Gurgaon">Gurgaon</option>
                <option value="Guwahati">Guwahati</option>
                <option value="Gwalior">Gwalior</option>
                <option value="Haflong">Haflong</option>
                <option value="Hajipur">Hajipur</option>
                <option value="Haldia">Haldia</option>
                <option value="Haldwani">Haldwani</option>
                <option value="Haliyal">Haliyal</option>
                <option value="Hampi">Hampi</option>
                <option value="Hapur">Hapur</option>
                <option value="Harda">Harda</option>
                <option value="Hardoi">Hardoi</option>
                <option value="Haridwar">Haridwar</option>
                <option value="Hassan">Hassan</option>
                <option value="Haveri">Haveri</option>
                <option value="Hazaribagh">Hazaribagh</option>
                <option value="Himmatnagar">Himmatnagar</option>
                <option value="Hingoli">Hingoli</option>
                <option value="Hissar">Hissar</option>
                <option value="Hoshiarpur">Hoshiarpur</option>
                <option value="Hospet">Hospet</option>
                <option value="Hubli">Hubli</option>
                <option value="Hyderabad">Hyderabad</option>
                <option value="Ichalkaranji">Ichalkaranji</option>
                <option value="Idukki">Idukki</option>
                <option value="Imphal">Imphal</option>
                <option value="Indore">Indore</option>
                <option value="Irinjalakuda">Irinjalakuda</option>
                <option value="Itanagar">Itanagar</option>
                <option value="Jabalpur">Jabalpur</option>
                <option value="Jadcherla">Jadcherla</option>
                <option value="Jagdalpur">Jagdalpur</option>
                <option value="Jagityal">Jagityal</option>
                <option value="Jaguli">Jaguli</option>
                <option value="Jahanabad">Jahanabad</option>
                <option value="Jaigaon">Jaigaon</option>
                <option value="Jaipur">Jaipur</option>
                <option value="Jaisalmer">Jaisalmer</option>
                <option value="Jajpur">Jajpur</option>
                <option value="Jalandhar">Jalandhar</option>
                <option value="Jalgaon">Jalgaon</option>
                <option value="Jalpaiguri">Jalpaiguri</option>
                <option value="Jammu">Jammu</option>
                <option value="Jamnagar">Jamnagar</option>
                <option value="Jamshedpur">Jamshedpur</option>
                <option value="Jamui">Jamui</option>
                <option value="Janjgir">Janjgir</option>
                <option value="Jashpur">Jashpur</option>
                <option value="Jaunpur">Jaunpur</option>
                <option value="Jehanabad">Jehanabad</option>
                <option value="Jhabua">Jhabua</option>
                <option value="Jhajjar">Jhajjar</option>
                <option value="Jhalawar">Jhalawar</option>
                <option value="Jhansi">Jhansi</option>
                <option value="Jharsuguda">Jharsuguda</option>
                <option value="Jharia">Jharia</option>
                <option value="Jhunjhunu">Jhunjhunu</option>
                <option value="Jind">Jind</option>
                <option value="Jodhpur">Jodhpur</option>
                <option value="Jorhat">Jorhat</option>
                <option value="Junagadh">Junagadh</option>
                <option value="Kachchh">Kachchh</option>
                <option value="Kadapa">Kadapa</option>
                <option value="Kaithal">Kaithal</option>
                <option value="Kakinada">Kakinada</option>
                <option value="Kalahandi">Kalahandi</option>
                <option value="Kalasa">Kalasa</option>
                <option value="Kalahandi">Kalahandi</option>
                <option value="Kallakurichi">Kallakurichi</option>
                <option value="Kalol">Kalol</option>
                <option value="Kalyani">Kalyani</option>
                <option value="Kamrup">Kamrup</option>
                <option value="Kancheepuram">Kancheepuram</option>
                <option value="Kanchipuram">Kanchipuram</option>
                <option value="Kangra">Kangra</option>
                <option value="Kanjirappally">Kanjirappally</option>
                <option value="Kankavali">Kankavali</option>
                <option value="Kannauj">Kannauj</option>
                <option value="Kannur">Kannur</option>
                <option value="Kanpur">Kanpur</option>
                <option value="Kanpur Dehat">Kanpur Dehat</option>
                <option value="Kanpur Nagar">Kanpur Nagar</option>
                <option value="Kanyakumari">Kanyakumari</option>
                <option value="Kapurthala">Kapurthala</option>
                <option value="Karad">Karad</option>
                <option value="Karaikudi">Karaikudi</option>
                <option value="Karimnagar">Karimnagar</option>
                <option value="Karjat">Karjat</option>
                <option value="Karnal">Karnal</option>
                <option value="Karunagapally">Karunagapally</option>
                <option value="Karur">Karur</option>
                <option value="Karwar">Karwar</option>
                <option value="Kasaragod">Kasaragod</option>
                <option value="Kasganj">Kasganj</option>
                <option value="Katihar">Katihar</option>
                <option value="Katra">Katra</option>
                <option value="Kaushambi">Kaushambi</option>
                <option value="Kelambakkam">Kelambakkam</option>
                <option value="Keonjhar">Keonjhar</option>
                <option value="Khagaria">Khagaria</option>
                <option value="Khammam">Khammam</option>
                <option value="Khandwa">Khandwa</option>
                <option value="Khanna">Khanna</option>
                <option value="Kharagpur">Kharagpur</option>
                <option value="Kharar">Kharar</option>
                <option value="Khargone">Khargone</option>
                <option value="Kheda">Kheda</option>
                <option value="Khorda">Khorda</option>
                <option value="Khordha">Khordha</option>
                <option value="Khurda">Khurda</option>
                <option value="Kichha">Kichha</option>
                <option value="Kishanganj">Kishanganj</option>
                <option value="Kishangarh">Kishangarh</option>
                <option value="Kochi">Kochi</option>
                <option value="Kodagu">Kodagu</option>
                <option value="Kodaikanal">Kodaikanal</option>
                <option value="Koderma">Koderma</option>
                <option value="Kokrajhar">Kokrajhar</option>
                <option value="Kolar">Kolar</option>
                <option value="Kolhapur">Kolhapur</option>
                <option value="Kolkata">Kolkata</option>
                <option value="Kollam">Kollam</option>
                <option value="Kopargaon">Kopargaon</option>
                <option value="Koppal">Koppal</option>
                <option value="Koraput">Koraput</option>
                <option value="Korba">Korba</option>
                <option value="Kota">Kota</option>
                <option value="Kothagudem">Kothagudem</option>
                <option value="Kothamanglam">Kothamanglam</option>
                <option value="Kottarakara">Kottarakara</option>
                <option value="Kottayam">Kottayam</option>
                <option value="Kovilpatti">Kovilpatti</option>
                <option value="Kozikode">Kozikode</option>
                <option value="Krishna">Krishna</option>
                <option value="Krishnagiri">Krishnagiri</option>
                <option value="Krishnanagar">Krishnanagar</option>
                <option value="Krishnankovil">Krishnankovil</option>
                <option value="Kumbakonam">Kumbakonam</option>
                <option value="Kundapur">Kundapur</option>
                <option value="Kundli">Kundli</option>
                <option value="Kurnool">Kurnool</option>
                <option value="Kurukshatra">Kurukshatra</option>
                <option value="Kurukshetra">Kurukshetra</option>
                <option value="Kushalanagara">Kushalanagara</option>
                <option value="Latur">Latur</option>
                <option value="Lonavala">Lonavala</option>
                <option value="Lucknow">Lucknow</option>
                <option value="Ludhiana">Ludhiana</option>
                <option value="Madanapalle">Madanapalle</option>
                <option value="Madhepura">Madhepura</option>
                <option value="Madurai">Madurai</option>
                <option value="Mahabubabad">Mahabubabad</option>
                <option value="Maharajganj">Maharajganj</option>
                <option value="Mahbubnagar">Mahbubnagar</option>
                <option value="Mahendergarh">Mahendergarh</option>
                <option value="Mahendragarh">Mahendragarh</option>
                <option value="Mahesana">Mahesana</option>
                <option value="Mahisagar">Mahisagar</option>
                <option value="Malappuram">Malappuram</option>
                <option value="Malapuram">Malapuram</option>
                <option value="Malda">Malda</option>
                <option value="Malout">Malout</option>
                <option value="Manamadurai">Manamadurai</option>
                <option value="Mandi">Mandi</option>
                <option value="Mandi Gobindgarh">Mandi Gobindgarh</option>
                <option value="Mandsaur">Mandsaur</option>
                <option value="Mandvi (Kutchh)">Mandvi (Kutchh)</option>
                <option value="Mandya">Mandya</option>
                <option value="Mangalore">Mangalore</option>
                <option value="Manipal">Manipal</option>
                <option value="Manipur">Manipur</option>
                <option value="Mannargudi">Mannargudi</option>
                <option value="Mansa">Mansa</option>
                <option value="Margao">Margao</option>
                <option value="Markapur">Markapur</option>
                <option value="Marthandam">Marthandam</option>
                <option value="Mathura">Mathura</option>
                <option value="Mavelikkara">Mavelikkara</option>
                <option value="Mayiladuthurai">Mayiladuthurai</option>
                <option value="Mayurbhanj">Mayurbhanj</option>
                <option value="Medak">Medak</option>
                <option value="Medak Dist">Medak Dist</option>
                <option value="Medchal">Medchal</option>
                <option value="Medchal-Malkajgiri">Medchal-Malkajgiri</option>
                <option value="Meerut">Meerut</option>
                <option value="Mettapalli">Mettapalli</option>
                <option value="Mewat">Mewat</option>
                <option value="Mhow">Mhow</option>
                <option value="Midnapore">Midnapore</option>
                <option value="Miraj">Miraj</option>
                <option value="Miryalaguda">Miryalaguda</option>
                <option value="Modasa">Modasa</option>
                <option value="Modinagar">Modinagar</option>
                <option value="Moga">Moga</option>
                <option value="Mohali">Mohali</option>
                <option value="Moradabad">Moradabad</option>
                <option value="Morbi">Morbi</option>
                <option value="Morena">Morena</option>
                <option value="Mukatsar">Mukatsar</option>
                <option value="Mukerian">Mukerian</option>
                <option value="Muktsar">Muktsar</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Mungeli">Mungeli</option>
                <option value="Murshidabad">Murshidabad</option>
                <option value="Muvattupuzha">Muvattupuzha</option>
                <option value="Muzaffar Nagar">Muzaffar Nagar</option>
                <option value="Muzaffarnagar">Muzaffarnagar</option>
                <option value="Muzaffarpur">Muzaffarpur</option>
                <option value="Mysore">Mysore</option>
                <option value="NTR">NTR</option>
                <option value="Nadia">Nadia</option>
                <option value="Nadiad">Nadiad</option>
                <option value="Nagapattinam">Nagapattinam</option>
                <option value="Nagarcoil">Nagarcoil</option>
                <option value="Nagpur">Nagpur</option>
                <option value="Nahan">Nahan</option>
                <option value="Nainital">Nainital</option>
                <option value="Nalanda">Nalanda</option>
                <option value="Nalgonda">Nalgonda</option>
                <option value="Namakkal">Namakkal</option>
                <option value="Namsai">Namsai</option>
                <option value="Nanded">Nanded</option>
                <option value="Nandurbar">Nandurbar</option>
                <option value="Nanjangud">Nanjangud</option>
                <option value="Naraingarh">Naraingarh</option>
                <option value="Narapally">Narapally</option>
                <option value="Narnaul">Narnaul</option>
                <option value="Nashik">Nashik</option>
                <option value="Nasik">Nasik</option>
                <option value="Nathdwara">Nathdwara</option>
                <option value="Navi Mumbai">Navi Mumbai</option>
                <option value="Navsari">Navsari</option>
                <option value="Nawadah">Nawadah</option>
                <option value="Nawanshahr">Nawanshahr</option>
                <option value="Nedumangad">Nedumangad</option>
                <option value="Neemrana">Neemrana</option>
                <option value="Neemuch">Neemuch</option>
                <option value="Nellore">Nellore</option>
                <option value="New Delhi">New Delhi</option>
                <option value="Neyveli">Neyveli</option>
                <option value="Nirjuli">Nirjuli</option>
                <option value="Nirmal">Nirmal</option>
                <option value="Nizamabad">Nizamabad</option>
                <option value="Noida">Noida</option>
                <option value="North 24 Parganas">North 24 Parganas</option>
                <option value="North Goa">North Goa</option>
                <option value="North Sikkim">North Sikkim</option>
                <option value="North Tripura">North Tripura</option>
                    <option value="Ongole">Ongole</option>
                <option value="Osmanabad">Osmanabad</option>
                <option value="Pala">Pala</option>
                <option value="Palakkad">Palakkad</option>
                <option value="Palakkad Palghat">Palakkad Palghat</option>
                <option value="Palanpur">Palanpur</option>
                <option value="Palasa">Palasa</option>
                <option value="Palghar">Palghar</option>
                <option value="Pali">Pali</option>
                <option value="Palwal">Palwal</option>
                <option value="Panaji">Panaji</option>
                <option value="Panipat">Panipat</option>
                <option value="Panna">Panna</option>
                <option value="Panskura">Panskura</option>
                <option value="Paradeep">Paradeep</option>
                <option value="Paramakudi">Paramakudi</option>
                <option value="Parbhani">Parbhani</option>
                <option value="Patan">Patan</option>
                <option value="Pathanamthitta">Pathanamthitta</option>
                <option value="Pathankot">Pathankot</option>
                <option value="Patiala">Patiala</option>
                <option value="Patna">Patna</option>
                <option value="Perambalur">Perambalur</option>
                <option value="Pernem">Pernem</option>
                <option value="Phagwara">Phagwara</option>
                <option value="Pileru">Pileru</option>
                <option value="Pilibhit">Pilibhit</option>
                <option value="Pimpri">Pimpri</option>
                <option value="Pimpri-Chinchwad">Pimpri-Chinchwad</option>
                <option value="Pinjore">Pinjore</option>
                <option value="Pithoragarh">Pithoragarh</option>
                <option value="Pondicherry">Pondicherry</option>
                <option value="Porbandar">Porbandar</option>
                <option value="Port Blair">Port Blair</option>
                <option value="Pratapgarh">Pratapgarh</option>
                <option value="Prayagraj">Prayagraj</option>
                <option value="Puducherry">Puducherry</option>
                <option value="Pudukkottai">Pudukkottai</option>
                <option value="Pune">Pune</option>
                <option value="Puri">Puri</option>
                <option value="Purnea">Purnea</option>
                <option value="Puttur">Puttur</option>
                <option value="Rajnandgaon">Rajnandgaon</option>
                <option value="Rajouri">Rajouri</option>
                <option value="Rajsamand">Rajsamand</option>
                <option value="Raigarh">Raigarh</option>
                <option value="Raipur">Raipur</option>
                <option value="Raisen">Raisen</option>
                <option value="Rajgarh">Rajgarh</option>
                <option value="Rajkot">Rajkot</option>
                <option value="Rajahmundry">Rajahmundry</option>
                <option value="Ramagundam">Ramagundam</option>
                <option value="Ramgarh">Ramgarh</option>
                <option value="Rampur">Rampur</option>
                <option value="Rangareddi">Rangareddi</option>
                <option value="Ranipet">Ranipet</option>
                <option value="Raniganj">Raniganj</option>
                <option value="Ranchi">Ranchi</option>
                <option value="Ratlam">Ratlam</option>
                <option value="Ratnagiri">Ratnagiri</option>
                <option value="Rewa">Rewa</option>
                <option value="Rewari">Rewari</option>
                <option value="Rishikesh">Rishikesh</option>
                <option value="Rohtak">Rohtak</option>
                <option value="Roorkee">Roorkee</option>
                <option value="Ropar">Ropar</option>
                <option value="Rudraprayag">Rudraprayag</option>
                <option value="Rudrapur">Rudrapur</option>
                <option value="Rupnagar">Rupnagar</option>
                <option value="Sabarkantha">Sabarkantha</option>
                <option value="Sagar">Sagar</option>
                <option value="Saharanpur">Saharanpur</option>
                <option value="Saharsa">Saharsa</option>
                <option value="Sahibabad">Sahibabad</option>
                <option value="Sambalpur">Sambalpur</option>
                <option value="Sambhal">Sambhal</option>
                <option value="Sangli">Sangli</option>
                <option value="Sangrur">Sangrur</option>
                <option value="Sant Kabir Nagar">Sant Kabir Nagar</option>
                <option value="Sant Ravidas Nagar">Sant Ravidas Nagar</option>
                <option value="Santokhgarh">Santokhgarh</option>
                <option value="Sanyari">Sanyari</option>
                <option value="Satara">Satara</option>
                <option value="Sathupally">Sathupally</option>
                <option value="Satna">Satna</option>
                <option value="Sawaimadhopur">Sawaimadhopur</option>
                <option value="Secunderabad">Secunderabad</option>
                <option value="Sehore">Sehore</option>
                <option value="Seoni">Seoni</option>
                <option value="Serampore">Serampore</option>
                <option value="Seraikela">Seraikela</option>
                <option value="Shahdol">Shahdol</option>
                <option value="Shahjahanpur">Shahjahanpur</option>
                <option value="Shajapur">Shajapur</option>
                <option value="Shillong">Shillong</option>
                <option value="Shimla">Shimla</option>
                <option value="Shimoga">Shimoga</option>
                <option value="Shirpur">Shirpur</option>
                <option value="Shivpuri">Shivpuri</option>
                <option value="Shravasti">Shravasti</option>
                    <option value="Shrirampur">Shrirampur</option>
                <option value="Shuklaganj">Shuklaganj</option>
                <option value="Siddipet">Siddipet</option>
                <option value="Sidhi">Sidhi</option>
                <option value="Sikar">Sikar</option>
                <option value="Silchar">Silchar</option>
                <option value="Siliguri">Siliguri</option>
                <option value="Silvassa">Silvassa</option>
                <option value="Sindhudurg">Sindhudurg</option>
                <option value="Singrauli">Singrauli</option>
                <option value="Sirmaur">Sirmaur</option>
                <option value="Sirsa">Sirsa</option>
                <option value="Sirsi">Sirsi</option>
                <option value="Siruguppa">Siruguppa</option>
                <option value="Sitamarhi">Sitamarhi</option>
                <option value="Sitapur">Sitapur</option>
                <option value="Sivaganga">Sivaganga</option>
                <option value="Sivakasi">Sivakasi</option>
                <option value="Sivakasi Virudhunagar">Sivakasi Virudhunagar</option>
                <option value="Siwan">Siwan</option>
                <option value="Sivasagar">Sivasagar</option>
                <option value="Solan">Solan</option>
                <option value="Solapur">Solapur</option>
                <option value="Sonbhadra">Sonbhadra</option>
                <option value="Sonipat">Sonipat</option>
                <option value="South 24 Parganas">South 24 Parganas</option>
                <option value="South Goa">South Goa</option>
                <option value="South Tripura">South Tripura</option>
                <option value="Sri Ganganagar">Sri Ganganagar</option>
                <option value="Srikakulam">Srikakulam</option>
                <option value="Srikalahasti">Srikalahasti</option>
                <option value="Srinagar">Srinagar</option>
                <option value="Sriperumbudur">Sriperumbudur</option>
                <option value="Srikakulam">Srikakulam</option>
                <option value="Sundergarh">Sundergarh</option>
                <option value="Surajpur">Surajpur</option>
                <option value="Surat">Surat</option>
                <option value="Suratgarh">Suratgarh</option>
                <option value="Suri">Suri</option>
                <option value="Suryapet">Suryapet</option>
                <option value="Tadepalligudem">Tadepalligudem</option>
                <option value="Tadikonda">Tadikonda</option>
                <option value="Tandur">Tandur</option>
                <option value="Tanuku">Tanuku</option>
                <option value="Tarn Taran">Tarn Taran</option>
                <option value="Tezpur">Tezpur</option>
                <option value="Thane">Thane</option>
                <option value="Thanjavur">Thanjavur</option>
                <option value="Theni">Theni</option>
                <option value="Thiruvalla">Thiruvalla</option>
                <option value="Thiruvananthapuram">Thiruvananthapuram</option>
                <option value="Thiruvarur">Thiruvarur</option>
                <option value="Thodupuzha">Thodupuzha</option>
                <option value="Thoothukudi">Thoothukudi</option>
                <option value="Thrissur">Thrissur</option>
                <option value="Tindivanam">Tindivanam</option>
                <option value="Tinsukia">Tinsukia</option>
                <option value="Tiruchirapalli">Tiruchirapalli</option>
                <option value="Tirunelveli">Tirunelveli</option>
                <option value="Tirupur">Tirupur</option>
                <option value="Tirupati">Tirupati</option>
                <option value="Tiruvannamalai">Tiruvannamalai</option>
                <option value="Trichur">Trichur</option>
                <option value="Trichy">Trichy</option>
                <option value="Triprayar">Triprayar</option>
                <option value="Tufanganj">Tufanganj</option>
                <option value="Tumkur">Tumkur</option>
                <option value="Tuticorin">Tuticorin</option>
                <option value="Udaipur">Udaipur</option>
                <option value="Udham Singh Nagar">Udham Singh Nagar</option>
                <option value="Udhampur">Udhampur</option>
                <option value="Udipi">Udipi</option>
                <option value="Ujjain">Ujjain</option>
                <option value="Ulhasnagar">Ulhasnagar</option>
                <option value="Unakoti">Unakoti</option>
                <option value="Unnao">Unnao</option>
                <option value="Unnicol">Unnicol</option>
                <option value="Uppal">Uppal</option>
                <option value="Uran">Uran</option>
                <option value="Uttar Dinajpur">Uttar Dinajpur</option>
                    <option value="Vadodara">Vadodara</option>
                <option value="Vaishali">Vaishali</option>
                <option value="Valsad">Valsad</option>
                <option value="Varanasi">Varanasi</option>
                <option value="Vasai">Vasai</option>
                <option value="Vasco Da Gama">Vasco Da Gama</option>
                <option value="Vellore">Vellore</option>
                <option value="Vemulawada">Vemulawada</option>
                <option value="Veraval">Veraval</option>
                <option value="Vidisha">Vidisha</option>
                <option value="Vijayawada">Vijayawada</option>
                <option value="Vikarabad">Vikarabad</option>
                <option value="Villupuram">Villupuram</option>
                <option value="Virajpet">Virajpet</option>
                <option value="Virar">Virar</option>
                <option value="Virudhunagar">Virudhunagar</option>
                <option value="Visakhapatnam">Visakhapatnam</option>
                <option value="Vizianagaram">Vizianagaram</option>
                <option value="Vizag">Vizag</option>
                <option value="Warangal">Warangal</option>
                <option value="Wardha">Wardha</option>
                <option value="Wayanad">Wayanad</option>
                <option value="West Godavari">West Godavari</option>
                <option value="West Sikkim">West Sikkim</option>
                <option value="West Singhbhum">West Singhbhum</option>
                <option value="West Tripura">West Tripura</option>
                <option value="Wokha">Wokha</option>
                <option value="Wokha Mokokchung">Wokha Mokokchung</option>
                <option value="Yamuna Nagar">Yamuna Nagar</option>
                <option value="Yavatmal">Yavatmal</option>
              
                                        <!-- More cities would be here -->
                                    </select>
                                    <span class="error-message" id="cityError">Please select your city</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Travel Budget:</td>
                            <td>
                                <div class="input-group">
                                    <input type="number" id="budget" name="budget" placeholder="Enter your travel budget in ?" class="form-input" min="1000" required>
                                    <span class="error-message" id="budgetError">Please enter a valid budget (minimum ?1000)</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>From Date:</td>
                            <td>
                                <div class="input-group">
                                    <input type="date" id="fdate" name="fdate" class="form-input" required>
                                    <span class="error-message" id="fdateError">Please select your departure date</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>To Date:</td>
                            <td>
                                <div class="input-group">
                                    <input type="date" id="tdate" name="tdate" class="form-input" required>
                                    <span class="error-message" id="tdateError">Please select your return date</span>
                                </div>
                            </td>
                        </tr>
                    </table>
                    
                    <div class="form-actions">
                        <a href="Login.jsp" class="login-link">Already registered? Sign in</a>
                        <button type="submit" id="submitBtn" class="submit-btn">
                            Create Account
                            <span class="loading" id="loadingSpinner"></span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <!-- Footer -->
<!--    <footer>
        <div class="container footer-content">
            <ul class="footer-links">
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">Terms & Conditions</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">FAQs</a></li>
            </ul>
            <div class="copyright">
                &copy; 2025 Trip Buddy. All rights reserved.
            </div>
        </div>
    </footer>-->

    <script>
        // Set minimum date for date inputs to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('fdate').setAttribute('min', today);
        document.getElementById('tdate').setAttribute('min', today);
        
        // Form validation
        const form = document.getElementById('registrationForm');
        const submitBtn = document.getElementById('submitBtn');
        const loadingSpinner = document.getElementById('loadingSpinner');
        const successMessage = document.getElementById('successMessage');
        
        // Show error message
        function showError(inputId, errorMessage) {
            const input = document.getElementById(inputId);
            const errorElement = document.getElementById(inputId + 'Error');
            input.classList.add('error');
            input.classList.remove('valid');
            errorElement.textContent = errorMessage;
            errorElement.style.display = 'block';
            return false;
        }
        
        // Hide error message
        function hideError(inputId) {
            const input = document.getElementById(inputId);
            const errorElement = document.getElementById(inputId + 'Error');
            input.classList.remove('error');
            input.classList.add('valid');
            errorElement.style.display = 'none';
            return true;
        }
        
        // Validate name
        function validateName() {
            const name = document.getElementById('name').value.trim();
            if (name === '') {
                return showError('name', 'Please enter your full name');
            } else if (name.length < 3) {
                return showError('name', 'Name must be at least 3 characters');
            } else {
                return hideError('name');
            }
        }
        
        // Validate email
        function validateEmail() {
            const email = document.getElementById('email').value.trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email === '') {
                return showError('email', 'Please enter your email address');
            } else if (!emailRegex.test(email)) {
                return showError('email', 'Please enter a valid email address');
            } else {
                return hideError('email');
            }
        }
        
        // Validate password
        function validatePassword() {
            const password = document.getElementById('password').value;
            if (password === '') {
                return showError('password', 'Please enter a password');
            } else if (password.length < 8) {
                return showError('password', 'Password must be at least 8 characters');
            } else if (!/\d/.test(password) || !/[a-zA-Z]/.test(password)) {
                return showError('password', 'Password must contain both letters and numbers');
            } else {
                return hideError('password');
            }
        }
        
        // Validate confirm password
        function validateConfirmPassword() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (confirmPassword === '') {
                return showError('confirmPassword', 'Please confirm your password');
            } else if (password !== confirmPassword) {
                return showError('confirmPassword', 'Passwords do not match');
            } else {
                return hideError('confirmPassword');
            }
        }
        
        // Validate age
        function validateAge() {
            const age = document.getElementById('age').value;
            if (age === '') {
                return showError('age', 'Please enter your age');
            } else if (age < 18 || age > 120) {
                return showError('age', 'Age must be between 18 and 120');
            } else {
                return hideError('age');
            }
        }
        
        // Validate gender
        function validateGender() {
            const genderOptions = document.getElementsByName('gender');
            let selected = false;
            
            for (let i = 0; i < genderOptions.length; i++) {
                if (genderOptions[i].checked) {
                    selected = true;
                    break;
                }
            }
            
            if (!selected) {
                return showError('gender', 'Please select your gender');
            } else {
                return hideError('gender');
            }
        }
        
        // Validate mobile
        function validateMobile() {
            const mobile = document.getElementById('mobile').value.trim();
            const mobileRegex = /^\d{10}$/;
            
            if (mobile === '') {
                return showError('mobile', 'Please enter your contact number');
            } else if (!mobileRegex.test(mobile)) {
                return showError('mobile', 'Please enter a valid 10-digit phone number');
            } else {
                return hideError('mobile');
            }
        }
        
        // Validate city
        function validateCity() {
            const city = document.getElementById('city').value;
            if (city === '') {
                return showError('city', 'Please select your city');
            } else {
                return hideError('city');
            }
        }
        
        // Validate budget
        function validateBudget() {
            const budget = document.getElementById('budget').value;
            if (budget === '') {
                return showError('budget', 'Please enter your travel budget');
            } else if (budget < 1000) {
                return showError('budget', 'Please enter a valid budget (minimum ?1000)');
            } else {
                return hideError('budget');
            }
        }
        
        // Validate from date
        function validateFromDate() {
            const fdate = document.getElementById('fdate').value;
            const today = new Date().toISOString().split('T')[0];
            
            if (fdate === '') {
                return showError('fdate', 'Please select your departure date');
            } else if (fdate < today) {
                return showError('fdate', 'Departure date cannot be in the past');
            } else {
                return hideError('fdate');
            }
        }
        
        // Validate to date
        function validateToDate() {
            const fdate = document.getElementById('fdate').value;
            const tdate = document.getElementById('tdate').value;
            
            if (tdate === '') {
                return showError('tdate', 'Please select your return date');
            } else if (tdate < fdate) {
                return showError('tdate', 'Return date must be after departure date');
            } else {
                return hideError('tdate');
            }
        }
        
        // Add input event listeners for real-time validation
        document.getElementById('name').addEventListener('input', validateName);
        document.getElementById('email').addEventListener('input', validateEmail);
        document.getElementById('password').addEventListener('input', validatePassword);
        document.getElementById('confirmPassword').addEventListener('input', validateConfirmPassword);
        document.getElementById('age').addEventListener('input', validateAge);
        document.getElementById('mobile').addEventListener('input', validateMobile);
        document.getElementById('city').addEventListener('change', validateCity);
        document.getElementById('budget').addEventListener('input', validateBudget);
        document.getElementById('fdate').addEventListener('change', function() {
            validateFromDate();
            validateToDate();
        });
        document.getElementById('tdate').addEventListener('change', validateToDate);
        
        // Add event listeners for gender selection
        const genderOptions = document.getElementsByName('gender');
        for (let i = 0; i < genderOptions.length; i++) {
            genderOptions[i].addEventListener('change', validateGender);
        }
        
        // Form submission
     form.addEventListener('submit', function(e) {
    // REMOVE THIS LINE IF YOU WANT SERVER-SIDE SUBMISSION:
    // e.preventDefault();

    // Validate all fields
    const isNameValid = validateName();
    const isEmailValid = validateEmail();
    const isPasswordValid = validatePassword();
    const isConfirmPasswordValid = validateConfirmPassword();
    const isAgeValid = validateAge();
    const isGenderValid = validateGender();
    const isMobileValid = validateMobile();
    const isCityValid = validateCity();
    const isBudgetValid = validateBudget();
    const isFromDateValid = validateFromDate();
    const isToDateValid = validateToDate();

    if (!(isNameValid && isEmailValid && isPasswordValid && isConfirmPasswordValid &&
        isAgeValid && isGenderValid && isMobileValid && isCityValid &&
        isBudgetValid && isFromDateValid && isToDateValid)) {
        e.preventDefault(); // Block submission only if validation fails
    }
});

        </script>