<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <link rel="stylesheet" href="resourse/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-image: url(images/6666.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 100vh;
            display: flex;
            flex-direction: column; /* Stack header, login section, and footer vertically */
        }

        header {
            background-color: #343a40;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1; /* Ensures header stays on top */
        }

        header .logo h1 {
            margin: 0;
            font-size: 24px;
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
            color: #00c853; /* Green on hover */
        }

        .loginy {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            margin: auto; /* Center the login box */
            flex: 1; /* Allow the login section to expand */
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top:50px;
            margin-bottom:50px;
        }
        header .logo a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }
        header .logo a:hover {
            color: #00c853;
        }

        .form-signin {
            text-align: center;
        }

        .form-signin h1 {
            margin-bottom: 20px;
        }

        .form-signin .input-group {
            margin-bottom: 15px;
        }

        .form-signin .input-group input {
            border-radius: 20px;
        }

        .form-signin .input-group .btn {
            border-radius: 20px;
        }

        .form-signin hr {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .form-signin .register-link {
            display: block;
            margin-top: 20px;
        }

        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px 0;
            z-index: 1; /* Ensures footer stays on top */
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
    </style>
</head>

<body>
    <header>
        <div class="logo">
            <a href = "HomePage.jsp"><h1>Stock Management</h1></a><!-- Replace with your logo image if necessary -->
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
    
    <section class="loginy">
        <div id="logreg-forms">
            <form action="LoginServlet" method="post" class="form-signin">
                <h1 class="h3 mb-3 font-weight-normal">Login</h1>
                <div class="input-group">
                    <input type="text" id="inputEmail" class="form-control" placeholder="Username" name="uid" autofocus>
                </div>
                <div class="input-group">
                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="pass">
                </div>
                <div class="input-group">
                    <button class="btn btn-primary btn-block form-control submit" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                </div>
                <hr>
                <p class="register-link">Don't have an account? <a href="Register.jsp">Register here</a></p>
            </form>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Stock Management System. All rights reserved.</p>
        <ul>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms of Service</a></li>
        </ul>
    </footer>
</body>
</html>
