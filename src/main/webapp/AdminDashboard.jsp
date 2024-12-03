<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="stock.Customer.DeleteCustomerServlet"%>
<%@page import="stock.Customer.UpdateCustomerServlet"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="resourse/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resourse/css/Contact-Form-Clean.css">
<link rel="stylesheet" href="resourse/css/styles.css">
<link rel="stylesheet" href="resources/css/AdminDashboard.css">
<link rel="stylesheet" href="resources/css/AdminDashboard.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
  </style>
</head>
<meta charset="ISO-8859-1">
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
						<li class="active"><a href="#"><i class="fa fa-user"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Profile</span></a></li>
								
						<li><a href="HomePage.jsp"><i class="fa fa-home"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Home</span></a></li>
								
						<li><a href="ProductServlet"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Product</span></a></li>

								
						<li><a href="StockRequestServlet"><i class="fa fa-warehouse"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Stock Request</span></a></li>
						
						<li ><a href="#"><i class="fa fa-cog"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Settings</span></a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-10 col-sm-11 display-table-cell v-align">
				
				
				<h1>Admin Profile</h1>
				<br><br>

	<c:forEach var="ad" items="${adDetails}">

		<c:set var="id" value="${ad.id}" />
		<c:set var="name" value="${ad.name}" />
		<c:set var="username" value="${ad.username}" />
		<c:set var="email" value="${ad.email}" />
		<c:set var="address" value="${ad.address}" />
		<c:set var="dateofbirth" value="${ad.dateofbirth}" />
		<c:set var="phone" value="${ad.phone}" />
		<c:set var="zippostalcode" value="${ad.zippostalcode}" />
		<c:set var="gender" value="${ad.gender}" />
		<c:set var="password" value="${ad.password}" />
		

		<div class="container emp-profile">
			<form method="post">
				<div class="row">
					<div class="col-md-4">
						<div class="profile-img">
							<img src="images/man.png"
								style="width: 80px; height: 80px; margin-bottom: 10px;">

						</div>
					</div>
					
					
					

				</div>
				<div class="row">
  <div class="col-md-7">
    <div class="card mb-4">
      <div class="card-header">
        <strong>Profile Details</strong>
      </div>
      <div class="card-body">
        <div class="row">
          <div class="col-sm-3">
            <strong>User Id:</strong>
          </div>
          <div class="col-sm-9">
            <p>${ad.id}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <strong>Full Name:</strong>
          </div>
          <div class="col-sm-9">
            <p>${ad.name}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <strong>Email:</strong>
          </div>
          <div class="col-sm-9">
            <p>${ad.email}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <strong>Address:</strong>
          </div>
          <div class="col-sm-9">
            <p>${ad.address}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <strong>Date of Birth:</strong>
          </div>
          <div class="col-sm-9">
            <p>${ad.dateofbirth}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <strong>Phone:</strong>
          </div>
          <div class="col-sm-9">
            <p>${cus.phone}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <strong>Zip/ postal Code:</strong>
          </div>
          <div class="col-sm-9">
            <p>${ad.zippostalcode}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <strong>Gender:</strong>
          </div>
          <div class="col-sm-9">
            <p>${ad.gender}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <strong>Username:</strong>
          </div>
          <div class="col-sm-9">
            <p>${ad.username}</p>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <strong>Password:</strong>
          </div>
          <div class="col-sm-9">
            <p>${ad.password}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
			</form>
		</div>
	</c:forEach>


	<script src="resourse/js/jquery.min.js"></script>
	<script src="resourse/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>