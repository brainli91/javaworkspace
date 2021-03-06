<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="common/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="static/css/navbar_css.css">
<link rel="stylesheet" type="text/css"
	href="static/css/errorPage_css.css">
	<script type="text/javascript" src="static/js/create-email-validate.js"></script>

<title>E-Recruitment</title>
</head>
<body>

	<div class="navbar-row">
		<header>
			<jsp:include page="navbar.jsp"></jsp:include>
		</header>
	</div>

	<div class="main-row">
		<div style="margin: auto; text-align: center;">
			<img alt="" src="static/img/e-Recruitment-medium.png" style="margin: auto;" align="middle" >
		</div>
		
		<c:if test="${not empty errorMsg}">
		<div id="general" class=" errorMessage alert alert-danger login-box" style="display: block">
			<div class="glyphicon glyphicon-remove-circle">&nbsp;${errorMsg}</div>
		</div>
		
		</c:if>
		<ul>
			<div id="errors" class="errorMessage alert alert-danger login-box" style="display: none">
			
				<div class="glyphicon glyphicon-remove-circle"></div>
			</div>
			</ul>
		<main>
		<section>
			<div class="container-fluid-full">
				<div class="row-fluid">
					<div class="login-box">
						<div class="icons">
							<a href="index.html"><i class="halflings-icon home"></i></a>
						</div>
						<%-- <div class="errorClass">${errorMsg}</div> --%>
						<sf:form class="form-horizontal" action="login" method="post"
							id="login-form" modelAttribute="loginUser">
							<div class="form-group">
								<sf:label path="email">Email address:</sf:label>
								<sf:input class="form-control" id="email" type="email"
									placeholder="Enter email " path="email" required="required" />
								<sf:label path="password">Password:</sf:label>
								<sf:input class="form-control" id="password" type="password"
									placeholder="Enter password" path="password"
									required="required" />
							</div>
							<div class="button-login">
								<sf:button type="submit" class="btn btn-primary btn-lg"
									>Login</sf:button>
								<sf:button type="reset" class="btn btn-danger btn-lg"
									onclick="hideForm()">Reset</sf:button>
							</div>
						</sf:form>

						<script>
							$("#loginForm").validate({
								rules : {
									username : "required",
									password : "required",
								}
							});
						</script>
					</div>
				</div>
			</div>
		</section>
		</main>
	</div>




</body>
</html>