
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	background: #DCDDDF
		url(http://cssdeck.com/uploads/media/items/7/7AF2Qzt.png);
	color: #000;
	font: 14px Arial;
	margin: 0 auto;
	padding: 0;
	position: relative;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>


 
 <body >
<body background="resources/images/images.jpeg">
<h1 align="center" style="margin-top:40px;">Payment Selection</h1>
<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<sec:authorize access="!isAuthenticated()">
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<ul class="nav navbar-nav navbar-left" style="margin-bottom: 0px;">
					<li><a href="cart"><p>
								CART <span class="glyphicon glyphicon-shopping-cart"align="right"></span>
							</p></a></li>
					<li><a href="<c:url value="/perform_logout" />"><p>
								LOGOUT<span class="glyphicon glyphicon-log-out"align="right"></span>
							</p></a></li>
					
			</sec:authorize>

			</ul>
		</div>
	</nav>

  
  <br><br>
  <br><br>
  <br>
  
  <br>
   <div class="container">
  <div class="row col-xs-4"></div>
  <div class="col-xs-4">
  <div class="panel panel-primary">
     <div class="panel-heading">
   
      <div class="row">
       <h3 class="panel-title " style="padding-left: 20px">Select Payment type</h3>
       
      </div>
     </div>
     <div class="panel-body">
     
    
    
   
 
<form method="post" action="${flowExecutionUrl}">
        <input type="hidden" name="_eventId" value="method">
        <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />
      <input type="radio" name="method" value="cod">  Cash On Delivery<br><br>
     <input type="radio" name="method" value="card">  Credit Card <br><br>
         <button class="btn btn-success btn-sm btn-block" type="submit">proceed</button>  
        </form>
        </div>
        </div>
        </div>
        </div>
        <br><br><br><br><br><br>
        
</body>
</html>