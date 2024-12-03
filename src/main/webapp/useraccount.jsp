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
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script
	src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="ISO-8859-1">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">


</head>
<meta charset="ISO-8859-1">
</head>
<style>
    .home {
        background-image: url(images/1111.jpg);
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
						
						<li><a href="CardDetails.jsp"><i class="fa fa-credit-card-alt"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Payement</span></a></li>

						<li><a href="#"><i class="fa fa-cog"
								aria-hidden="true"></i><span class="hidden-xs hidden-sm">Settings</span></a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-10 col-sm-11 display-table-cell v-align">
				

				<h1>Profile Datails</h1>
				<br> <br>








				<c:forEach var="cus" items="${cusDetails}">

					<c:set var="id" value="${cus.id}" />
					<c:set var="name" value="${cus.name}" />
					<c:set var="username" value="${cus.username}" />
					<c:set var="email" value="${cus.email}" />
					<c:set var="address" value="${cus.address}" />
					<c:set var="dateofbirth" value="${cus.dateofbirth}" />
					<c:set var="phone" value="${cus.phone}" />
					<c:set var="zippostalcode" value="${cus.zippostalcode}" />
					<c:set var="gender" value="${cus.gender}" />
					<c:set var="password" value="${cus.password}" />


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
													<p>${cus.id}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-3">
													<strong>Full Name:</strong>
												</div>
												<div class="col-sm-9">
													<p>${cus.name}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-3">
													<strong>Email:</strong>
												</div>
												<div class="col-sm-9">
													<p>${cus.email}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-3">
													<strong>Address:</strong>
												</div>
												<div class="col-sm-9">
													<p>${cus.address}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-3">
													<strong>Date of Birth:</strong>
												</div>
												<div class="col-sm-9">
													<p>${cus.dateofbirth}</p>
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
													<p>${cus.zippostalcode}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-3">
													<strong>Gender:</strong>
												</div>
												<div class="col-sm-9">
													<p>${cus.gender}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-3">
													<strong>Username:</strong>
												</div>
												<div class="col-sm-9">
													<p>${cus.username}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-3">
													<strong>Password:</strong>
												</div>
												<div class="col-sm-9">
													<p>${cus.password}</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</c:forEach>





				<c:url value="updatecustomer.jsp" var="cusupdate">

					<c:param name="id" value="${id}" />
					<c:param name="name" value="${name}" />
					<c:param name="uname" value="${username}" />
					<c:param name="email" value="${email}" />
					<c:param name="address" value="${address}" />
					<c:param name="dateofbirth" value="${dateofbirth}" />
					<c:param name="phone" value="${phone}" />
					<c:param name="zippostalcode" value="${zippostalcode}" />
					<c:param name="gender" value="${gender}" />
					<c:param name="pass" value="${password}" />
				</c:url>


				<a href="${cusupdate}"> <input type="button"
					class="btn btn-primary" name="update" value="Edit Profile"
					style="margin-left: 50px;">
				</a> <br> <br>

				<c:url value="deletecustomer.jsp" var="cusdelete">

					<c:param name="id" value="${id}" />
					<c:param name="name" value="${name}" />
					<c:param name="uname" value="${username}" />
					<c:param name="email" value="${email}" />
					<c:param name="address" value="${address}" />
					<c:param name="dateofbirth" value="${dateofbirth}" />
					<c:param name="phone" value="${phone}" />
					<c:param name="zippostalcode" value="${zippostalcode}" />
					<c:param name="gender" value="${gender}" />
					<c:param name="pass" value="${password}" />

				</c:url>

				<a href="${cusdelete}"> <input type="button"
					class="btn btn-danger" name="delete" value="Delete account"
					style="margin-left: 50px;">
				</a>

				<script src="resourse/js/jquery.min.js"></script>
				<script src="resourse/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>