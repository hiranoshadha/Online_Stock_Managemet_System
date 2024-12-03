<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet" import="pageNumber.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>

<%
String id = request.getParameter("userid");
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
%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="resources/css/AdminDashboard.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="ISO-8859-1">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    .home {
        background-image: url(images/7777.jpg);
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top:0px;
    }
    h1{
   	margin-left:60px;
	font-weight: bold;
    }
    tbody{
    background-color:white;
    }
    thead{
    background-color:white;
    }
   </style>
</head>

<body class="home">
	<div class="container-fluid display-table">
		<div class="row display-table-row">
			<div
				class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box"
				id="navigation">
				<div class="logo">

					<i class="fa fa-male"
						style="font-size: 48px; color: red; margin-top: 20px; margin-bottom: 20px;"></i>


				</div>
				<div class="navi">
					<ul>
						
						
						<li class="active"><a href="CardDetails.jsp"><i class="fa fa-money"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Payment</span></a></li>
								
						<li><a href="HomePage.jsp"><i class="fa fa-home"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Home</span></a></li>
								
						<li ><a href="#"><i class="fa fa-cog"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Settings</span></a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-10 col-sm-11 display-table-cell v-align">
				
				<h1>Viwe Card Datails</h1>
				<br>
				<br>
				<div>
					 <a href="AddCardDetails.jsp"><button type="button" class="btn btn-primary" style="margin-left: 40px; margin-bottom: 15px;">Add Card Details</button></a>
				</div>
	<div class="container mt-5">
  
  <table class="table table-bordered table-striped table-hover">
    <thead class="thead-dark">
      <tr>
        
        <th scope="col">Card Name</th>
        <th scope="col">Card Holder Name</th>
        <th scope="col">Card Number</th>
        <th scope="col">VALID THRU</th>
        <th scope="col">CVV</th>
        <th scope="col">Update</th>
        <th scope="col">Delete</th>
      </tr>
    </thead>
    <tbody>
      <%
        try {
          connection = DriverManager.getConnection(connectionUrl, user, password);
          statement = connection.createStatement();
          String sql = "SELECT * FROM carddetails";
          resultSet = statement.executeQuery(sql);
          while (resultSet.next()) {
      %>
      <tr>
        
        <td><%=resultSet.getString("cardName")%></td>
        <td><%=resultSet.getString("cardHolderName")%></td>
        <td><%=resultSet.getString("cardNumber")%></td>
        <td><%=resultSet.getString("validThru")%></td>
        <td><%=resultSet.getString("cVV")%></td>
        <td>
          <a href="CardDetailsUpdate.jsp?id=<%=resultSet.getString("id")%>" class="btn btn-primary">Update</a>
        </td>
        <td>
          <a href="CardDetailsDelete.jsp?id=<%=resultSet.getString("id")%>" class="btn btn-danger">Delete</a>
        </td>
      </tr>
      <%
          }
          connection.close();
        } catch (Exception e) {
          e.printStackTrace();
        }
      %>
    </tbody>
  </table>
</div>
</body>
</html>