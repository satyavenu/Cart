
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
  
</head>
<body>
<h1><center><font color=red>Satya Online Shopping</font></center></h1>
	</div>         
<sec authorize access="isAuthenticated()">
      
	<div class="w3-container">
 <ul class="w3-navbar w3-black">
    
 <li class="w3-dropdown-hover">
      <a href="#">Categories</a>
      <div class="w3-dropdown-content w3-white w3-card-4">
          <c:forEach items="${CategoryList}" var="category">
				<a href="navproducts/${category.id}"><c:out value="${category.name}" /></a>
						
					</c:forEach>
					</div> 
					</li>
				
       <sec:authorize access="!isAuthenticated()">
     <li><li class="w3-right"><a href="registration">Signup</a></li>
   <li><li class="w3-right"><a href="login"><i class="fa fa-sign-in"></i></a></li>
   </sec:authorize>
  
     <sec:authorize access="isAuthenticated()">
      <ul class="nav navbar-nav navbar-right">
      <li><a href="cart"><span class="glyphicon glyphicon-user"></span>Cart</a></li>
	<li><a href="<c:url value="/perform_logout" />">Logout</a></li>
	<li><a href="">Welcome  <sec:authentication property="principal.username"/></a></li></ul>
</sec:authorize>
  </ul>
 
  </div>
	${message}
	
	
		${successMsg} ${errorMSG }
	<c:if test="${UserClickedLogin}">
		<jsp:include page="login.jsp"></jsp:include>
	</c:if>
	<c:if test="${not empty errorMSG}">
		<jsp:include page="login.jsp"></jsp:include>
	</c:if>
	<c:if test="${showregistionpage}">
		<jsp:include page="registration.jsp"></jsp:include></c:if>
	<c:if test="${showCategory}">
	<jsp:include page="Category.jsp"></jsp:include></c:if>
	<c:if test="${showSupplierpage}">
		<jsp:include page="supplier.jsp"></jsp:include></c:if>
	<c:if test="${showProductpage}">
		<jsp:include page="product.jsp"></jsp:include></c:if>
		
		<c:if test="${showadminPage}">
		<jsp:include page="Admin.jsp"></jsp:include></c:if>
		<c:if test="${Clickedcatproduct}">
      <jsp:include page="cartproducts.jsp"></jsp:include></c:if> 
		
		<c:choose>
		<c:when test="${UserClickedshowproduct}">
			<c:import url="/WEB-INF/views/ShowProduct.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
	<c:when test="${Clickedcartproduct}">
			<c:import url="/WEB-INF/views/cartproducts.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
	<c:when test="${UserClickedCart}">
			<c:import url="/WEB-INF/views/cart.jsp"></c:import>
		</c:when>
	</c:choose>
	
      		
    
  <div class="navbar-collapse collapse" style="background-color:#7FFFD4 ">
                <ul class="nav navbar-nav" style="background-color:#7FFFD4">
 
 
 	<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
     
    </ol>

   
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="resources/images/5.jpeg"  style=" width:150%; height:350px">
      </div>
<div class="item">
        <img src="resources/images/9.jpeg" style=" width:150%; height:350px">
      </div>
    <div class="item">
        <img src="resources/images/8.jpeg" style=" width:150%; height:350px">
      </div>
    
      <div class="item">
        <img src="resources/images/1.jpeg" style=" width:150%; height:350px">
      </div>

      <div class="item">
        <img src="resources/images/4.jpeg"  style=" width:150%; height:350px">
      </div>
    </div>
  

    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div> 

	
	
	<c:forEach items="${productList}" var="product">
			<tr>
				<td>
					<!-- --<div class="thumbnail">-->
					<div class="col-md-4">
						<a href="ShowProduct/${product.id}"> <img height="200px"
							width="200px" alt="${product.id }"
							src="<c:url value="/resources/images/${product.id }.jpg"></c:url>"></a>
						<td><c:url var="action" value="addtocart/${product.id}"></c:url>
							<form:form action="${action}" modelAttribute="cart">
								<td id="td1"><c:out value="${product.name}" /><br>
								<td id="td1"><c:out value="${product.price}" /> <input
									type="submit" class="btn btn-primary" value="Add To Cart" /><br>
							</form:form></td>
						<br>
					</div>
			</tr>
			</td>
			</c:forEach>
		</div>
	
	
	<div>
		<c:choose>
			<c:when test="${!Administrator}">
				<c:if test="${empty HideOthers}">
					<table class="table">
						<thead>
							<tr>
								<th>OUR COMPANY</th>
								<th>TOP CATEGORIES</th>
								<th>POLICIES AND INFO</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>About us<br> sos.com <br> Ethnico<br>
									Place of Origin<br> Blog<br>
								</td>
								<td>Electronics<br> Womens<br> Jewellery<br>
									Mens<br>Kids Wear<br></td>
								<td>Terms & Conditions<br> Policy for Sellers<br>
									Policy for Buyers<br> Shipping & Refund Policies<br>
									Wholesale Policy<br> Privacy Policy<br></td>
							</tr>
							<tr>
								<th>SUPPORT</th>
								<th>PAYMENT OPTIONS</th>
								<th>STAY CONNECTED</th>
							</tr>
							<tr>
								<td><i class="fa fa-envelope"
									style="font-size: 10px; color: blue"></i> <a
									href="mailto:support@company.com">support@sos.com</a><br>
									<i class="fa fa-phone" style="font-size: 10px; color: blue"><p>+11
											888 242 424</p></i><br> <i class="fa fa-map-marker"
									style="font-size: 10px; color: blue"></i>
									<p>
										<span>K.P.H.B,HYD, </span>Telangana,
										INDIA
									</p>
									<br></td>
								<td><div class="footer-icons">
										<a href=""><i class="fa fa-facebook-official"
											style="font-size: 30px; color: blue"></i> <a href=""><i
												class="fa fa-twitter"
												style="font-size: 30px; color: #00ffff"></i></a> <a href=""><i
												class="fa fa-linkedin-square"
												style="font-size: 30px; color: blue"></i></a> <a href=""><i
												class="fa fa-google" style="font-size: 30px; color: #3366ff"></i></a>
											<a href=""><i class="fa fa-google-plus-official"
												style="font-size: 30px; color: red"></i></a> <a href=""><i
												class="fa fa-whatsapp"
												style="font-size: 30px; color: #33ff00"></i></a>
									</div></td>
								<td><a href=""><i class="fa fa-paypal"
										aria-hidden="true" style="font-size: 30px; color: #0066ff"></i>
								</a> . <a href=""><i class="fa fa-cc-amex" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-cc-mastercard" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-cc-visa" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-credit-card" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-google-wallet" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a> . <a href=""><i
										class="fa fa-cc-stripe" aria-hidden="true"
										style="font-size: 30px; color: #0066ff"></i> </a></td>
						</tbody>
					</table>
				</c:if>
			</c:when>
		</c:choose>
	</div>
</body>
		
	

</body>
</html>