<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="stock.Request.StockRequest" %>
<%@ page import="stock.Request.StockRequestDBUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stock Request Management</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: white;
            background-image: url(images/2222.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            color: #333;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        h2 {
            color: #34495e;
            margin-bottom: 10px;
        }

        form {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            max-width: 600px;
            margin: 0 auto 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #5d6d7e;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            background-color: #f9f9f9;
            box-sizing: border-box;
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: #3498db;
        }

        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 18px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2980b9;
        }

        .request-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .request-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            padding: 20px;
        }

        .request-info {
            padding: 10px;
        }

        .request-info h3 {
            margin: 0 0 10px;
            font-size: 18px;
            color: #333;
        }

        .request-info p {
            font-size: 14px;
            color: #777;
        }

        .actions {
            margin-top: 10px;
            display: flex;
            justify-content: space-between;
        }

        .actions form {
            display: inline-block;
            margin: 0;
        }

        .update-btn {
            background-color: #4CAF50; /* Green */
        }

        .update-btn:hover {
            background-color: #45a049;
        }

        .delete-btn {
            background-color: #f44336; /* Red */
        }

        .delete-btn:hover {
            background-color: #e41d1d;
        }
    </style>

    <!-- JavaScript for Client-Side Validation -->
    <script>
        function validateForm() {
            // Get form fields
            var productID = document.getElementById("productID").value;
            var qty = document.getElementById("qty").value;

            // Validate productID and qty to ensure they are positive numbers
            if (productID <= 0 || isNaN(productID)) {
                alert("Product ID must be a positive number.");
                return false;
            }

            if (qty <= 0 || isNaN(qty)) {
                alert("Quantity must be a positive number greater than zero.");
                return false;
            }

            return true; // If validation passes, submit the form
        }
    </script>

</head>
<body>
    <h1>Stock Request Management</h1>

    <h2>Add New Stock Request</h2>
    <form method="post" action="StockRequest" onsubmit="return validateForm();">
        <input type="hidden" name="action" value="add" required>
        <label for="productID">Product ID:</label>
        
        <input type="number" name="productID" id="productID" required>
        <label for="name">Name:</label>
        
        <input type="text" name="name" id="name" required>
        <label for="description">Description:</label>
        
        <textarea name="description" id="description" required></textarea>
        
        <label for="qty">Quantity:</label>
        <input type="number" name="qty" id="qty" required>
        
        <button type="submit">Add Request</button>
    </form>

    <h2>Existing Stock Requests</h2>
    <div class="request-list">
        <%
            List<StockRequest> requestList = (List<StockRequest>) request.getAttribute("requestList");
            if (requestList != null && !requestList.isEmpty()) {
                for (StockRequest stockRequest : requestList) {
        %>
        <div class="request-card">
            <div class="request-info">
                <h3>Stock ID: <%= stockRequest.getStockID() %></h3>
                <p>Product ID: <%= stockRequest.getProductID() %></p>
                <p>Name: <%= stockRequest.getName() %></p>
                <p>Description: <%= stockRequest.getDescription() %></p>
                <p>Quantity: <%= stockRequest.getQty() %></p>
            </div>
            <div class="actions">
                <form method="post" action="StockRequest" onsubmit="return validateForm();">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="stockID" value="<%= stockRequest.getStockID() %>">
                    <input type="number" name="productID" value="<%= stockRequest.getProductID() %>" required>
                    <input type="text" name="name" value="<%= stockRequest.getName() %>" required>
                    <textarea name="description" required><%= stockRequest.getDescription() %></textarea>
                    <input type="number" name="qty" value="<%= stockRequest.getQty() %>" required>
                    <button type="submit" class="update-btn">Update</button>
                </form>
                <form method="post" action="StockRequest">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="stockID" value="<%= stockRequest.getStockID() %>">
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <p>No stock requests found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
