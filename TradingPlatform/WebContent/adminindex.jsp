<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin Dashboard - TP</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">


<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="adminindex.jsp">Trading Platform</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-user"></i> ${sessionScope.user.firstName} ${user.lastName} <b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="adminindex.jsp"><i class="fa fa-fw fa-user"></i> Profile</a>
						</li>
						<li class="divider"></li>
						<li><a href="front.jsp"><i class="log-off"></i> Log Out</a>
						</li>
					</ul></li>
			</ul>
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li class="active"><a href="adminindex.jsp"><i
							class="DashBoard"></i> Dashboard</a></li>
					<li><a href="adduser.jsp"><i class="Add User"></i> Add
							User</a></li>
					<li><a href="removeuser.jsp"><i class="Remove User"></i>
							Remove User</a></li>
					<li><a href="updateuser.jsp"><i class="Update User"></i>
							Update User</a></li>
					<li><a href="showusers"><i class="View Users"></i>
							View All Users</a></li>
					<li><a href="viewlog"><i
							class="fa fa-fw fa-wrench"></i> View User Log</a></li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Dashboard <small id ="subtitle">Admin Page</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i> Dashboard
							</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->






				<div class="row">
					<div class="container">
    			<div class="row">
				    <div class="col-xs-12 col-sm-6 col-md-6">
				            <div class="well well-sm">
				                <div class="row">
				                    <div class="col-sm-6 col-md-4">
				                        <img src="img/profile.png" alt="Profile Picture" class="img-rounded img-responsive" />
				                    </div>
				                    <div class="col-sm-6 col-md-8">
				                        <h4 class="profiletext">${sessionScope.user.firstName} ${user.lastName}</h4>
				                        <small><cite title="Toronto, ON">Toronto, ON <i class="glyphicon glyphicon-map-marker">
				                        </i></cite></small>
				                        <p>
				                            <i class="glyphicon glyphicon-user" title="User Name"></i>${sessionScope.user.userName}
				                            <br />
				                            <i class="glyphicon glyphicon-envelope" title="Email"></i>${sessionScope.user.firstName}.${user.lastName}@fdmgroup.com
				                            <br />
				                            <i class="glyphicon glyphicon-briefcase" title="Roles"></i>Administrator</a>
				                            <br />
				                        </p>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-clock-o fa-fw"></i> User Logs
								</h3>
							</div>
							<div class="panel-body">
								
								<div class="list-group">
									<a href="#" class="list-group-item"> <span class="badge">2016-05-18
											15:29:04</span> <i class="fa fa-fw fa-calendar"></i> User admin
										logged in
									</a> <a href="#" class="list-group-item"> <span class="badge">2016-05-18
											15:29:23</span> <i class="fa fa-fw fa-comment"></i> Admin admin
										added user
									</a> <a href="#" class="list-group-item"> <span class="badge">2016-05-18
											15:29:04</span> <i class="fa fa-fw fa-calendar"></i> User admin
										logged in
									</a> <a href="#" class="list-group-item"> <span class="badge">2016-05-18
											15:29:23</span> <i class="fa fa-fw fa-comment"></i> Admin admin
										added user
									</a> <a href="#" class="list-group-item"> <span class="badge">2016-05-18
											15:29:04</span> <i class="fa fa-fw fa-calendar"></i> User admin
										logged in
									</a> <a href="#" class="list-group-item"> <span class="badge">2016-05-18
											15:29:23</span> <i class="fa fa-fw fa-comment"></i> Admin admin
										added user
									</a> <a href="#" class="list-group-item"> <span class="badge">2016-05-18
											15:29:04</span> <i class="fa fa-fw fa-calendar"></i> User admin
										logged in
									</a> <a href="#" class="list-group-item"> <span class="badge">2016-05-18
											15:29:23</span> <i class="fa fa-fw fa-comment"></i> Admin admin
										added user
									</a> <a href="#" class="list-group-item"> <span class="badge">2016-05-18
											15:29:04</span> <i class="fa fa-fw fa-calendar"></i> User admin
										logged in
									</a> <a href="#" class="list-group-item"> <span class="badge">2016-05-18
											15:29:23</span> <i class="fa fa-fw fa-comment"></i> Admin admin
										added user
									</a> <a href="#" class="list-group-item"> <span class="badge">2016-05-18
											15:29:04</span> <i class="fa fa-fw fa-calendar"></i> User admin
										logged in
									</a>


								</div>
								<div class="text-right">
									<a href="#">View All Log <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-money fa-fw"></i> User List
								</h3>
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table
										class="table table-bordered table-hover table-striped text">
										<thead>
											<tr>
												<th>User ID</th>
												<th>User Name</th>
												<th>Password</th>
												<th>First Name</th>
												<th>Last Name</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>20</td>
												<td>john</td>
												<td>smith</td>
												<td>John</td>
												<td>Smith</td>
											</tr>
											<tr>
												<td>21</td>
												<td>jane</td>
												<td>doe</td>
												<td>Jane</td>
												<td>Doe</td>
											</tr>
											<tr>
												<td>21</td>
												<td>jane</td>
												<td>doe</td>
												<td>Jane</td>
												<td>Doe</td>
											</tr>
											<tr>
												<td>21</td>
												<td>jane</td>
												<td>doe</td>
												<td>Jane</td>
												<td>Doe</td>
											</tr>
											<tr>
												<td>21</td>
												<td>jane</td>
												<td>doe</td>
												<td>Jane</td>
												<td>Doe</td>
											</tr>
											<tr>
												<td>21</td>
												<td>jane</td>
												<td>doe</td>
												<td>Jane</td>
												<td>Doe</td>
											</tr>
											<tr>
												<td>21</td>
												<td>jane</td>
												<td>doe</td>
												<td>Jane</td>
												<td>Doe</td>
											</tr>
											<tr>
												<td>21</td>
												<td>jane</td>
												<td>doe</td>
												<td>Jane</td>
												<td>Doe</td>
											</tr>
											<tr>
												<td>21</td>
												<td>jane</td>
												<td>doe</td>
												<td>Jane</td>
												<td>Doe</td>
											</tr>
											<tr>
												<td>21</td>
												<td>jane</td>
												<td>doe</td>
												<td>Jane</td>
												<td>Doe</td>
											</tr>

										</tbody>
									</table>
								</div>
								<div class="text-right">
									<a href="showusers">View All Users <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>



				</div>
			</div>
			<!-- /.row -->

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /#page-wrapper -->




</body>

</html>