<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="stock.Product.Product" %>
<%@ page import="stock.Product.ProductDBUtil" %>


<%
    // Fetch the list of products from the database
    List<Product> productList = ProductDBUtil.getAllProducts();
%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

<link rel="Stylesheet" href="resourse/css/Homepage.css">


<link rel="stylesheet" href="resourse/fonts/ionicons.min.css">
<link rel="stylesheet" href="resourse/css/Footer-Dark.css">
<link rel="stylesheet" href="resourse/css/Homestyles.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stock Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }
        header .logo a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }
        header .logo a:hover {
            color: #00c853;
        }

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

        main {
            padding: 20px;
        }

        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            gap: 20px;
        }

        .product-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 10px;
            padding: 20px;
            text-align: center;
            width: calc(23.66% - 20px); /* Adjust width for 4 products per row */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-image {
            max-width: 100%;
            height: auto;
        }

        .price {
            color: #28a745; /* Green for the price */
            font-weight: bold;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px 0;
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

        /* Responsive styles */
        @media (max-width: 768px) {
            .product-card {
                width: calc(48% - 20px); /* Adjust width for 2 products per row on smaller screens */
            }
        }

        @media (max-width: 480px) {
            .product-card {
                width: calc(100% - 20px); /* Adjust width for 1 product per row on mobile */
            }
        }
         main h2 {
        font-size: 2.5rem; /* Increase font size */
        text-align: left; /* Center align */
        color: #007bff; /* Blue color for the title */
        margin: 20px 0; /* Add some margin */
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
    }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <a href = "HomePage.jsp"><h1>Stock Management</h1></a> <!-- Replace with your logo image if necessary -->
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
   
    	<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item "
					style="background-image: url(images/4444.jpg)">
					<div class="carousel-caption d-none d-md-block">
						
						<h3 class="display-4">Exceptional care from friendly,
							professional staff.</h3>
						<p class="lead"></p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url(images/5555.jpg)">
					<div class="carousel-caption d-none d-md-block">
						
						<h3 class="display-4">Our aim is delivering excellence to
							customers.</h3>
						<p class="lead"></p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url(images/6666.jpg)">
					<div class="carousel-caption d-none d-md-block">
						
						<h3 class="display-4">Efficient service, time-saving
							convenience chosen.</h3>
						<p class="lead"></p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
    

    <!-- Main Content -->
    
    <main>
        <h2>Available Products</h2>
        <div class="product-container">
            <%
                for (Product product : productList) {
            %>
                <div class="product-card">
                    <img src="<%= product.getImagePath() %>" alt="<%= product.getName() %>" class="product-image">
                    <h3><%= product.getName() %></h3>
                    <p><%= product.getDescription() %></p>
                    <p class="price">Rs.<%= product.getPrice() %></p>
                    <a href="productDetails.jsp?id=<%= product.getProductID() %>" class="btn">View Details</a>
                </div>
            <%
                }
            %>
        </div>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Stock Management System. All rights reserved.</p>
        <ul>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms of Service</a></li>
        </ul>
    </footer>
    
    <script src="resourse/js/jquery.min.js"></script>
	<script src="resourse/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
