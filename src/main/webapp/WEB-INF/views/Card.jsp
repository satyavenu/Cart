<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>card</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
</head>
<body >
<body background="resources/images/12.jpeg">
<h1 align="center" style="margin-top:100px;">Payment Selection</h1>
 <div class="text-center" >

    <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid"> 
  <div class="navbar-header" class=" pull-left">
  
     <a class="navbar-brand" style="font-size:15px;"><span class="glyphicon glyphicon-user"></span> WELCOME <sec:authentication property="principal.username"/> </a>
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


        <div class="container">
  <div class="row col-xs-4"></div>
  <div class="col-xs-4">
     <!-- CREDIT CARD FORM STARTS HERE -->
    
    <div class="panel panel-primary">
     <div class="panel-heading">
   
      <div class="row">
       <h3 class="panel-title " align="center" style="padding-left: 20px">Payment Details</h3>
       
      </div>
     </div>
     <div class="panel-body">
       <form method="post" action="${flowExecutionUrl}">
        <input type="hidden" name="_eventId" value="continue">
        <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />
       <div class="row">
        <div class="col-xs-12">
         <div class="form-group">
          <label for="cardNumber">Card Number</label>
          <div class="form-group">
           <input type="text" class="form-control input-sm" name="cardNumber"
            placeholder="Valid Card Number" pattern="^[123456789]\d{15}$"
            title="Enter valid 16 digit number"
            required /> 
          </div>
         </div>
        </div>
       </div>
       <div class="row">
        <div class="col-xs-7 col-md-7">
         <div class="form-group">
          <label for="cardExpiry"><span class="hidden-xs">Expiration</span><span
           class="visible-xs-inline">EXP</span> DATE</label> <input type="tel"
           class="form-control input-sm" name="cardExpiry" placeholder="MM / YY"
            required />
         </div>
        </div>
        <div class="col-xs-5 col-md-5 pull-right">
         <div class="form-group">
          <label for="cardCVC">CVV Code</label> <input type="text" pattern="^[123456789]\d{2}$"  size="3"
           class="form-control input-sm" name="cardCVC" placeholder="CVV"
           required />
         </div>
        </div>
       </div>
       <div class="row">
        <div class="col-xs-12">
         <div class="form-group">
          <label for="name">Name</label> <input type="text"
           class="form-control input-sm" name="name" />
         </div>
        </div>
       </div> 
       
       <div class="row">
        <div class="col-xs-6 col-md-6">
        
         <button class="btn btn-success btn-sm btn-block" type="submit">Continue</button>  
        
        </div>
       
         <!--  <input type="submit" value="Continue"> -->
        </form>
        
       <form method="post" action="${flowExecutionUrl}">
        <input type="hidden" name="_eventId" value="cancel">
        <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />
        <div class="col-xs-6 col-md-6">
        
         <button class="btn btn-success btn-sm btn-block" type="submit">Cancel</button>  
        
        </div>
       
        </form>
        </div>
     </div>
    </div>
    <!-- CREDIT CARD FORM ENDS HERE -->
</div>
     
</div> 


        
</body>