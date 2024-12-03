<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>

<%
    String id = request.getParameter("userid");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/online_stock_management_system";
    String user = "root";
    String password = "123456";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    // Get the product ID from the request
    String productId = request.getParameter("id");
    if (productId != null) {
        // You can now use productId as needed
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Select Card</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

    <style>
        /* Ensure the body takes up the full viewport height */
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column; /* Make the body a flex container */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: white; /* Adjust text color for contrast */
        }

        /* Background image with opacity */
        body::before {
            content: ""; /* Required for the pseudo-element */
            position: absolute; /* Position it absolutely within the body */
            top: 0; /* Align it to the top */
            left: 0; /* Align it to the left */
            right: 0; /* Align it to the right */
            bottom: 0; /* Align it to the bottom */
            background-image: url('images/1111.jpg'); /* Background image */
            background-size: cover; /* Cover the entire area */
            background-repeat: no-repeat; /* No repeating */
            background-position: center; /* Center the image */
            opacity: 0.5; /* Adjust this value for desired opacity (0.0 - 1.0) */
            z-index: -1; /* Send the pseudo-element to the back */
        }

        /* The main content container */
        .container {
            flex: 1; /* Allows the container to grow and fill the space */
        }

        /* Header styles */
        header {
            background-color: #343a40;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header .logo h1 {
            margin: 0;
            font-size: 24px;
        }

        header .logo a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }

        header .logo a:hover {
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

        /* Footer styles */
        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: relative;
            bottom: 0;
            width: 100%;
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

        /* Card styles */
        h1 {
            font-weight: bold;
            text-align: center;
            margin-top: 50px;
            color: #007bff;
        }

        .card {
            margin: 15px;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Shadow effect */
            transition: transform 0.2s;
        }

        .card:hover {
            transform: scale(1.05); /* Scale effect on hover */
        }

        .card-header {
            background-color: #007bff; /* Primary color */
            color: white;
            border-radius: 10px 10px 0 0;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #28a745; /* Green button */
            border: none;
        }

        .btn-primary:hover {
            background-color: #218838; /* Darker green on hover */
        }

        .card-body {
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white for better readability */
        }

        .card-text {
            color: #6c757d; /* Muted text color */
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

    <h1>Select Your Card</h1>
    <div class="container mt-5">
        <div class="row">
            <%
            try {
                Class.forName(driver);
                connection = DriverManager.getConnection(connectionUrl, user, password);
                statement = connection.createStatement();
                String sql = "SELECT * FROM carddetails";
                resultSet = statement.executeQuery(sql);

                while (resultSet.next()) {
            %>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <%= resultSet.getString("cardName") %>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><%= resultSet.getString("cardHolderName") %></h5>
                        <p class="card-text">Card Number: <%= resultSet.getString("cardNumber") %></p>
                        <p class="card-text">Valid Thru: <%= resultSet.getString("validThru") %></p>
                        <p class="card-text">CVV: <%= resultSet.getString("cVV") %></p>
                        <a href="Card.jsp?id=<%= resultSet.getString("id") %>&productId=<%= productId != null ? productId : "0" %>" class="btn btn-primary">Select</a>
                    </div>
                </div>
            </div>
            <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Stock Management System. All rights reserved.</p>
        <ul>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms of Service</a></li>
        </ul>
    </footer>
</body>
</html>
