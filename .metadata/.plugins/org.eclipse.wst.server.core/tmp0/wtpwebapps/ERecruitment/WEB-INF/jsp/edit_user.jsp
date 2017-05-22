<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="common/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="static/css/userpage_css.css">
<title>Edit User</title>
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
					<!-- If you want to change the position of the main(which contains the content) then create a new user_head.jsp and new css for it and just reposition main
		but just copy and paste the original user_head.jsp, and user_page_css.css -->
					<div class="container-fluid-full registerBox" align="center">
						<div class="row-fluid">

			<div class="row-fluid">
				<div class="login-box">
					<table>
					<tr>
					
					</tr>
					
					</table>
					
					<sf:form class="form-horizontal" method="POST" id="editUserForm"
						action="editUser" modelAttribute="editUser">
						<fieldset>
							<input name="id" type="hidden" value="${editUser.id}">
							<div class="input-prepend" title="Username">
								 <span class="add-on"><i
									class="halflings-icon envelope"></i></span>
								<sf:input class="form-control" path="email" id="username"
									type="hidden" placeholder="Enter email" required="required"   />
							</div>
							
							<div class="input-prepend" title="Password">
								<!-- <label>Password:</label> <span class="add-on"><i
									class="halflings-icon lock"></i></span> -->
								<sf:input class="form-control" path="password" id="password"
									type="hidden" placeholder="Enter password"
									required="required" />

							<div class="row-fluid">
								<div class="login-box">
									<sf:form class="form-horizontal" method="POST"
										id="editUserForm" action="editUser" modelAttribute="editUser">
										<fieldset>
											<input name="id" type="hidden" value="${editUser.id}">
											<div class="input-prepend" title="Username">
												<span class="add-on"><i
													class="halflings-icon envelope"></i></span>
												<sf:input class="form-control" path="email" id="username"
													type="hidden" placeholder="Enter email" required="required" />
											</div>


											<!-- 	<div class="input-prepend">
								<label>Confirm Password:</label> <span class="add-on"><i
									class="halflings-icon lock"></i></span> <input class="form-control"
									name="passwordAgain" id="passwordAgain" type="password"
									placeholder="Enter password again" required="required" />
							</div> -->

											<div class="input-prepend">
												<label>First Name:</label> <span class="add-on"><i
													class="halflings-icon user"></i></span>
												<sf:input class="form-control" path="firstName"
													id="firstName" type="text" placeholder="Enter first name"
													required="required" />
											</div>

											<div class="input-prepend">
												<label>Last Name:</label> <span class="add-on"><i
													class="halflings-icon user"></i></span>
												<sf:input class="form-control" path="lastName" id="lastName"
													type="text" placeholder="Enter last name"
													required="required" />
											</div>
								</fieldset>
								</sf:form>
							
							<div>
							<label>Current Role: </label>
							<label>${editUser.role.name}</label>
							<br/>
							<label>Role:</label>
									<br/>
									<c:choose>
										<c:when test="${editUser.role.name == 'recruiter'}">
											<input id="recruiter" name="roleName" type="radio"
												value="recruiter" required checked="checked"> <label>Recruiter</label>
										</c:when>
										<c:otherwise>
											<input id="recruiter" name="roleName" type="radio"
										value="recruiter" required> <label>Recruiter
									</label>
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${editUser.role.name == 'staff'}">
											<input id="staff" name="roleName" type="radio"
												value="staff" required checked="checked"> <label>Staff</label>
										</c:when>
										<c:otherwise>
											<input id="staff" name="roleName" type="radio"
										value="staff" required> <label>Staff
									</label>
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${editUser.role.name == 'applicant'}">
											<input id="applicant" name="roleName" type="radio"
												value="applicant" required checked="checked"> <label>Applicant</label>
										</c:when>
										<c:otherwise>
											<input id="applicant" name="roleName" type="radio"
										value="applicant" required> <label>Applicant
									</label>
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${editUser.role.name == 'manager'}">
											<input id="manager" name="roleName" type="radio"
												value="manager" required checked="checked"> <label>Manager</label>
										</c:when>
										<c:otherwise>
											<input id="manager" name="roleName" type="radio"
										value="manager" required> <label>Manager
									</label>
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${editUser.role.name == 'admin'}">
											<input id="admin" name="roleName" type="radio"
												value="admin" required checked="checked"> <label>Admin</label>
										</c:when>
										<c:otherwise>
											<input id="admin" name="roleName" type="radio"
										value="admin" required> <label>Admin
									</label>
										</c:otherwise>
									</c:choose>
									
							</div> 
							
							<br />

											</div>
											<br />


											<div class="button-login">
												<button type="submit" class="btn btn-primary">Confirm</button>
												<button type="reset" class="btn btn-danger">Reset</button>

											</div>
										</fieldset>
									</sf:form>
								</div>
								<!--/span-->
							</div>
							<!--/row-->


				<!-- 	<script>
						$("#editUserForm").validate({
							rules : {
								password : "required",
								passwordAgain : {
									equalTo : "#password"
								}
							}
						});
					</script> -->


						</div>
						<!--/.fluid-container-->

					</div>
					<!--/fluid-row-->
				</section>
				</main>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>




</body>
</html>