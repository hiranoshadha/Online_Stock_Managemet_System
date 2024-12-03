<%@ page import="java.util.List" %>
<%@ page import="stock.Product.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            background-image: url(images/2222.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        form {
            max-width: 600px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin-top: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .product-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .product-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            padding: 20px;
        }
        .product-card img {
            max-width: 100%;
            height: auto;
            display: block;
        }
        .product-info {
            padding: 10px;
        }
        .product-info h3 {
            margin: 0 0 10px;
            font-size: 18px;
            color: #333;
        }
        .product-info p {
            font-size: 14px;
            color: #777;
        }
        .product-actions {
            margin-top: 10px;
        }
        .product-actions form {
            display: inline-block;
        }
        .product-actions input[type="text"] {
            width: 80px;
            margin: 5px 0;
        }
        .product-actions input[type="submit"] {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 5px;
        }
        .product-actions input[type="submit"]:hover {
            background-color: #45a049;
        }
        .product-actions form .delete-btn {
            background-color: #f44336;
        }
        .product-actions form .delete-btn:hover {
            background-color: #e41d1d;
        }
    </style>
    <script>
        // Validate form on submit
        function validateForm(form) {
            // Validate price (cannot be negative)
            var price = form.price.value;
            if (price < 0) {
                alert("Price cannot be a negative value.");
                return false;
            }

            // Validate image (must be a valid URL)
            var imageUrl = form.image_path.value;
            var urlPattern = /^(https?:\/\/[^\s$.?#].[^\s]*)$/i;
            if (!urlPattern.test(imageUrl)) {
                alert("Please enter a valid URL for the image.");
                return false;
            }

            return true;  // If validation passes
        }
    </script>
</head>
<body>
    <h1>Product Management</h1>

    <!-- Form for creating a new product -->
    <form action="Product" method="post" onsubmit="return validateForm(this)">
        <input type="hidden" name="action" value="create">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        
        <label for="description">Description:</label>
		<textarea id="description" name="description" required></textarea>
        
        <label for="price">Price:</label>
        <input type="text" id="price" name="price" required>
        
        <label for="image">Choose Image (URL only):</label>
        <input type="text" id="image" name="image_path" required>
        
        <input type="submit" value="Add Product">
    </form>

    <h2>Product List</h2>
    <div class="product-list">
        <%
            List<Product> productList = (List<Product>) request.getAttribute("productList");
            if (productList != null && !productList.isEmpty()) {
                for (Product product : productList) {
        %>
        <div class="product-card">
            <img src="<%= product.getImagePath() %>" alt="Product Image">
            <div class="product-info">
                <h3><%= product.getName() %></h3>
                <p><%= product.getDescription() %></p>
                <p>Price: Rs.<%= product.getPrice() %></p>
            </div>
            <div class="product-actions">
                <form action="Product" method="post" onsubmit="return validateForm(this)">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                    <input type="text" name="name" value="<%= product.getName() %>">
                    <input type="text" name="description" value="<%= product.getDescription() %>">
                    <input type="text" name="price" value="<%= product.getPrice() %>">
                    <input type="text" name="image_path" value="<%= product.getImagePath() %>">
                    <input type="submit" value="Update">
                </form>
                <form action="Product" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                    <input type="submit" value="Delete" class="delete-btn">
                </form>
            </div>
        </div>
        <%
                }
            } else {
                %>
                <p>No products available.</p>
                <%
                    }
        %>
    </div>
</body>
</html>
