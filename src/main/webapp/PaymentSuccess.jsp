<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Payment Successfully</title>

<style>
    /* Body and background image */
    body {
        background-image: url('images/1111.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        font-family: 'Arial', sans-serif;
        color: #333;
        margin: 0;
    }

    /* Header */
    header {
        background-color: #343a40;
        color: white;
        padding: 10px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: relative;
        width: 100%;
        z-index: 100;
    }

    header .logo h1 {
    color: white;
        margin: 0;
        font-size: 24px;
        text-decoration: none;
        transition: color 0.3s;
    }
    header .logo a {
        
        text-decoration: none;
        transition: color 0.3s;
    }
    header .logo h1:hover {
        color: #00c853;
    }

    nav ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
        display: flex;
    }

    nav ul li {
        margin-left: 20px;
    }

    nav ul li a {
        color: white;
        text-decoration: none;
        transition: color 0.3s;
    }

    nav ul li a:hover {
        color: #00c853;
    }

    /* Main wrapper */
    .wrapper {
        background-color: rgba(255, 255, 255, 0.95);
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        text-align: center;
        width: 400px;
        margin: auto;
        animation: fadeIn 1.5s ease;
    }

    /* Animation for fade in */
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* Success icon styling */
    .success-icon {
        font-size: 80px;
        color: #28a745;
        margin-bottom: 20px;
        animation: bounceIn 1s ease;
    }

    /* Bounce effect for icon */
    @keyframes bounceIn {
        0% { transform: scale(0.5); }
        50% { transform: scale(1.1); }
        100% { transform: scale(1); }
    }

    /* Header styling */
    h1 {
        font-size: 32px;
        font-weight: bold;
        color: #333;
        margin-bottom: 15px;
    }

    /* Subtitle styling */
    p {
        font-size: 18px;
        color: #555;
        margin-bottom: 30px;
    }

    /* Home button styling */
    .btn-home {
        display: inline-block;
        background-color: #28a745;
        color: white;
        padding: 10px 25px;
        border-radius: 25px;
        text-decoration: none;
        font-size: 18px;
        transition: background-color 0.3s;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .btn-home:hover {
        background-color: #218838;
        text-decoration: none;
    }

    /* Footer styling */
    footer {
        background-color: #343a40;
        color: white;
        text-align: center;
        padding: 10px 0;
        width: 100%;
        z-index: 100;
    }
    
    footer p {
        color: white;
    }

    footer ul {
        list-style-type: none;
        padding: 0;
    }

    footer ul li {
        display: inline;
        margin: 0 10px;
    }

    footer ul li a {
        color: white;
        text-decoration: none;
    }

    footer ul li a:hover {
        color: #00c853;
    }
</style>

</head>
<body>
<header>
    <div class="logo">
        <a href="HomePage.jsp"><h1>Stock Management</h1></a>
    </div>
    <nav>
        <ul>
            <li><a href="Register.jsp">Sign Up</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="Contactus.jsp">Contact Us</a></li>
            <li><a href="Aboutus.jsp">About Us</a></li>
        </ul>
    </nav>
</header>

<!-- Main content wrapper -->
<div class="wrapper">
    <!-- Icon -->
    <div class="fadeIn first">
        <i class="fa fa-check success-icon"></i>
    </div>

    <!-- Message -->
    <h1>Payment Successful!</h1>
    <p>Your payment has been processed successfully. Thank you for your purchase!</p>

    <!-- Button to go home -->
    <a href="HomePage.jsp" class="btn-home">Go to Home</a>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 Stock Management System. All rights reserved.</p>
    <ul>
        <li><a href="#">Privacy Policy</a></li>
        <li><a href="#">Terms of Service</a></li>
    </ul>
</footer>
</body>
</html>
