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
            <a href="index.html" class="logo"><i class="fas fa-plane-departure"></i> Trip Buddy</a>
            
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
    <footer>
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
    </footer>

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