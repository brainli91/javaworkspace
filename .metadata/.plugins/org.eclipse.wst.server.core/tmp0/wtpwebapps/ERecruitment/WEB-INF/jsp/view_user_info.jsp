<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"  %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="common/head.jsp"></jsp:include>
<link rel= "stylesheet" type="text/css" href="static/css/userpage_css.css">
<title>User Info Page</title>
</head>
<body>

<jsp:include page="navbar.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="sidebar.jsp"></jsp:include>
    <div id="main-wrapper" class="col-md-11 pull-right">
    	<div id="main">
            	<!-- main content goes here -->
            	<main>
	<section>
		<!-- Your Main Body Content goes here -->
		<div class="row">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="well well-sm">
						<div class="row">
							<div class="col-sm-6 col-md-4">
								<img src="static/img/profile.png" alt="Profile Picture"
									class="img-rounded img-responsive" />
							</div>
							<div class="col-sm-6 col-md-8 text-info">
								<%-- <h4 class="profiletext">${applicant.firstName} ${applicant.lastName}</h4>
								<small><cite title="address">${applicant.applicantProfile.address} <i
										class="glyphicon glyphicon-map-marker"> </i></cite></small> --%>
								<p>
									
									<i class="glyphicon glyphicon-envelope" title="email"></i>&nbsp ${user.email} 
									<br /> <i class="glyphicon glyphicon-user" title="firstName"></i>&nbsp ${user.firstName}
									<br /> <i class="glyphicon glyphicon-user" title="lastName"></i>&nbsp ${user.lastName} 
									<%-- <p><strong>Skills:</strong>
									<c:set var="skills" value="${fn:split(applicant.applicantProfile.skills, '|')}" />
									<c:forEach items="${skills}" var="skill" varStatus="row">
										<c:if test="${row.count % 2 == 0}">
											<span class="label label-primary">${skill}</span>&nbsp
										</c:if>
										<c:if test="${row.count % 2 != 0}">
											<span class="label label-warning">${skill}</span>&nbsp
										</c:if>
										
									</c:forEach></p>	
									<p><strong>Interests:</strong>
									<c:set var="interests" value="${fn:split(applicant.applicantProfile.interests, '|')}" />
									<c:forEach items="${interests}" var="interest" varStatus="row">
										<c:if test="${row.count % 2 == 0}">
											<span class="label label-primary">${interest}</span>&nbsp
										</c:if>
										<c:if test="${row.count % 2 != 0}">
											<span class="label label-warning">${interest}</span>&nbsp
										</c:if>
									</c:forEach> --%>
									<br />
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	</section>
</main>	
            </div>
	<jsp:include page="footer.jsp"></jsp:include>          
        </div>
</div>

</body>
</html>