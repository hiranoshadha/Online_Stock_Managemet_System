<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" import="pageNumber.*"%>
    

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="resources/css/AdminReservationUpdate.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Delete Card Details</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-image: url(images/6666.jpg);
	background-size: cover;
	background-position: center;
	height: 100vh;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 0.9; /* Reduce opacity */
}

.container {
	background-color: rgba(255, 255, 255, 0.8);
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
  <div class="container mt-5">
      <h1 class="text-center mb-5">Delete Card Details</h1>
      <form
        method="post"
        action="DeleteCardDetails"
        class="w-50 mx-auto"
   
      > 
                
                <% 
                String id = request.getParameter("id");
                
                
                	
                try{
                	Connection con = null;
    				Class.forName("com.mysql.jdbc.Driver");
    				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_stock_management_system", "root", "123456");
    				
    				String sql = "SELECT * FROM carddetails WHERE id='"+id+"'";
    				Statement stmt = con.createStatement();
    				ResultSet result = stmt.executeQuery(sql);
                
    				while(result.next()){
    					
    				
                %>
                    
					      
					      
					      	<div class="form-group">
					          <label for="cardName">ID</label>
					          <input
					            type="text"
					            class="form-control"
					            id="cardName"
					            name="id"
					            placeholder="Enter card name"
					            value="<%=result.getString("id")%>"
					            readonly
					            
					          />
					        </div>
					        
					        <div class="form-group">
					          <label for="cardName">Card Name</label>
					          <input
					            type="text"
					            class="form-control"
					            id="cardName"
					            name="cardName"
					            placeholder="Enter card name"
					            value="<%=result.getString("cardName")%>"
					            readonly
					          />
					        </div>
					        <div class="form-group">
					          <label for="cardHolderName">Card Holder Name</label>
					          <input
					            type="text"
					            class="form-control"
					            id="cardHolderName"
					            name="cardHolderName"
					            placeholder="Enter card holder name"
					            value="<%=result.getString("cardHolderName")%>"
					            readonly
					          />
					        </div>
					        <div class="form-group">
					          <label for="cardNumber">Card Number</label>
					          <input
					            type="text"
					            class="form-control"
					            id="cardNumber"
					            name="cardNumber"
					            placeholder="Enter card number"
					            value="<%=result.getString("cardNumber")%>"
					            readonly
					          />
					        </div>
					        <div class="form-group">
					          <label for="validThru">Valid Thru</label>
					          <input
					            type="text"
					            class="form-control"
					            id="validThru"
					            name="validThru"
					            placeholder="Enter valid thru"
					            value="<%=result.getString("validThru")%>"
					            readonly
					          />
					        </div>
					        <div class="form-group">
					          <label for="cVV">CVV</label>
					          <input
					            type="text"
					            class="form-control"
					            id="cVV"
					            name="cVV"
					            placeholder="Enter CVV"
					            value="<%=result.getString("cVV")%>"
					            readonly
					          />
					        </div>
					        <button type="submit" class="btn btn-primary">Delete</button>
					      </form>
					    </div>
                    <% 
    				}
                }catch(Exception e){
                	e.printStackTrace();
                }
                
                %>
                </form>
            </div>
        </div>
    </div>
</div>

 <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"
    ></script>
</body>
</html>