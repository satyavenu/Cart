<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Admin</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/HomeStyle.css"/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="src/resources/css/style.css" type="text/css" />
 
<style>

ul {
    list-style-type: 	#FF00FF;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}
li {
    float: left;
}
li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
li a:hover {
    background-color: #111;
</style>

<body>
<body background="resources/images/admin.jpeg">
        <h1 align="center"class="cursive">Satya Online Shopping</h1>
              
      
 



${message}

<nav>
<div>
    <ul>
      <li><a href="supplier">SUPPLIER</a></li>
      <li><a href="product">PRODUCT</a></li>
      <li><a href="Category">CATEGORY</a></li>
       <li><a href="perform_logout"><span class="glyphicon glyphicon-user"></span> LOGOUT</a></li>
         </ul>
 

 </div>
</nav>
</body>
<h1>Welcome to SATYA</h1>
${msg}
${msg1 }


<c:choose>
<c:when test="${showSupplierpage}">
<c:import url="/WEB-INF/views/supplier.jsp"></c:import>
</c:when>
</c:choose>

<c:choose>
<c:when test="${showProductpage}">
<c:import url="/WEB-INF/views/product.jsp"></c:import>
</c:when>
</c:choose> 
<c:choose>
<c:when test="${showCategory}">
<c:import url="/WEB-INF/views/Category.jsp"></c:import>
</c:when>
</c:choose>
<c:choose>
<c:when test="${UserClickedContactUs}">
<c:import url="/WEB-INF/views/login.jsp"></c:import>
</c:when>
</c:choose>
<c:choose>
<c:when test="${Clickedcatproduct}">
<c:import url="/WEB-INF/views/cartproducts.jsp"></c:import>
</c:when>
</c:choose>
<c:choose>
<c:when test="${ClickedcatAdmin}">
<c:import url="/WEB-INF/views/Admin.jsp"></c:import>
</c:when>
</c:choose>

<div class="ng-view"></div>

<script>
var app = angular.module("myApp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/supplier", {
        templateUrl : "supplier"
    })
    .when("/Category", {
        templateUrl : "Category"
    })
    .when("/product", {
        templateUrl : "product"
    });
});
</script> 

</html>