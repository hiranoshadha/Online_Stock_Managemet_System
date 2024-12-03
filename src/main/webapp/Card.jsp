<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="stock.Product.Product"%>  <!-- Replace with your actual package name -->
<%@page import="stock.DBConnect.DBConnect"%>
<%@page import="stock.Product.ProductDBUtil"%>  <!-- Replace with your actual package name -->

<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/online_stock_management_system";
String user = "root";
String password = "123456";

try {
    Class.forName(driver);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

// Get the product ID from the request
String productId = request.getParameter("productId");
Product product = null;

if (productId != null) {
    int id = Integer.parseInt(productId);
    // Fetch product details
    product = ProductDBUtil.getProductById(id);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
    background-image: url(images/6666.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
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

.container {
    background-color: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 60%;
    margin: 50px auto;
}

.input-fields {
    margin-bottom: 20px;
}

.column-1, .column-2 {
    margin-bottom: 15px;
}

.small-inputs div {
    width: 48%;
}

.title {
    text-align: center;
    margin-bottom: 20px;
}

.info {
    font-size: 12px;
}

.back-btn {
    margin-right: 10px;
}
</style>
</head>
<body>
<header>
        <div class="logo">
            <a href = "HomePage.jsp"><h1>Stock Management</h1></a>
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
    <form action="ReservationComplete.jsp">
        <div class="container">
            <div class="checkout-panel">
                <div class="panel-body">
                    <h2 class="title">Checkout</h2>

                    <%
                    String ID = request.getParameter("id");
                    try {
                        Connection con = DBConnect.getConnection();
                        Statement stmt = con.createStatement();
                        String sql = "select * from carddetails WHERE id='" + ID + "'";
                        ResultSet rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                    %>
                    <div class="input-fields">
                        <div class="column-1">
                            <label for="cardholder">Cardholder's Name</label>
                            <input type="text" id="cardholder" name="cardholder" value="<%= rs.getString(3) %>" class="form-control" readonly />
                            <div class="small-inputs">
                                <div>
                                    <label for="date">Valid thru</label>
                                    <input type="text" id="date" name="date" placeholder="MM / YY" value="<%= rs.getString(5) %>" class="form-control" readonly />
                                </div>

                                <div>
                                    <label for="verification">CVV / CVC *</label>
                                    <input type="text" id="verification" name="CV" value="<%= rs.getString(6) %>" class="form-control" readonly />
                                </div>
                            </div>
                        </div>
                        <div class="column-2">
                            <label for="cardnumber">Card Number</label>
                            <input type="text" id="cardnumber" name="cardnumber" value="<%= rs.getString(3) %>" class="form-control" readonly />
                            <span class="info">* CVV or CVC is the card security code, unique three digits number on the back of your card separate from its number.</span>
                        </div>
                        <div class="form-group">
                            <label for="amount">Amount</label>
                            <input type="text" class="form-control" id="amount" name="amount" placeholder="Enter amount" value="<%= product != null ? product.getPrice() + " LKR" : "0 LKR" %>" readonly>
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

                <div class="panel-footer text-center">
                    <a href="Payment.jsp" class="btn btn-secondary back-btn">Back</a>
                    <a href="PaymentSuccess.jsp" class="btn btn-primary">Pay Now</a>
                </div>
            </div>
        </div>
    </form>
    <footer>
        <p>&copy; 2024 Stock Management System. All rights reserved.</p>
        <ul>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms of Service</a></li>
        </ul>
    </footer>
</body>
</html>
