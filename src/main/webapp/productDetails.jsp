<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="stock.Product.Product" %>
<%@ page import="stock.Product.ProductDBUtil" %>
<%
    // Get the product ID from the request
    String productIdParam = request.getParameter("id");
    Product product = null;

    if (productIdParam != null) {
        int productID = Integer.parseInt(productIdParam);
        // Fetch the product from the database
        product = ProductDBUtil.getProductById(productID);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        header {
            background-color: #343a40;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            max-width: 1200px;
            height:530px;
            margin: auto;
        }

        .product-details {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: flex;
            flex-direction: row;
            max-width: 800px;
            width: 100%;
            margin: 20px 0;
        }

        .product-image {
            max-width: 300px;
            height: auto;
            border-radius: 10px;
            margin-right: 20px;
        }

        .product-info {
            text-align: left;
            flex: 1;
        }

        .product-info h2 {
            margin: 10px 0;
            font-size: 28px;
            color: #343a40;
        }

        .product-info p {
            margin: 5px 0;
            color: #6c757d; /* Muted text color */
            line-height: 1.5;
        }

        .price {
            color: #28a745; /* Green for the price */
            font-weight: bold;
            font-size: 1.5em;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            margin-top: 20px;
            display: inline-block; /* Change to inline-block for better control */
        }

        .btn:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 20px;
        }

        footer ul {
            list-style-type: none;
            padding: 0;
            margin: 10px 0 0 0;
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
    <!-- Header -->
    <header>
        <div class="logo">
            <h1>Stock Management</h1>
        </div>
        <nav>
            <ul>
                <li><a href="signup.jsp">Sign Up</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="contactus.jsp">Contact Us</a></li>
                <li><a href="aboutus.jsp">About Us</a></li>
            </ul>
        </nav>
    </header>

    <!-- Container for Product Details -->
    <div class="container">
        <!-- Product Details -->
        <div class="product-details">
            <img src="<%= product != null ? product.getImagePath() : "#" %>" 
                 alt="<%= product != null ? product.getName() : "Product Image" %>" 
                 class="product-image">
            <div class="product-info">
                <h2><%= product != null ? product.getName() : "Product Not Found" %></h2>
                <p><%= product != null ? product.getDescription() : "" %></p>
                <p class="price">Rs.<%= product != null ? product.getPrice() : "0.00" %></p>
                <a href="Payment.jsp?id=<%= product != null ? product.getProductID() : "0" %>" class="btn">Pay Now</a>
            </div>
        </div>
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
