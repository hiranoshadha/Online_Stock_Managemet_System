<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/SuccessfullyDeleted.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Deleted</title>
<style>
  body {
    background-image: url('images/7777.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
  }

  .wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    padding: 20px;
    background: rgba(255, 255, 255, 0.8); /* Optional: white transparent background overlay */
  }

  #formContent {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  }
</style>
</head>
<body>


<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
    <i style="font-size:48px;color:green" class="fa fa-check-circle"></i>
      
      <h1>Request Unsuccessfully!</h1>
    </div>

   
    <form action="HomePage.jsp" method="post">
      <input type="submit" class="fadeIn fourth" value="Go Back">
    </form>
    
    <div id="formFooter">
      <a class="underlineHover" href="CheckReservation.jsp">Request Again...</a>
    </div>

  </div>
</div>

</body>
</html>