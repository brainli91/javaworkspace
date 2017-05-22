<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <jsp:include page="common/head.jsp"></jsp:include>
  <link rel= "stylesheet" type="text/css" href="static/css/userpage_css.css">
  <link rel="stylesheet" type="text/css"
	href="static/css/errorPage_css.css">
  <title>View Posted Jobs</title>
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
      <c:if test="${not empty errorMsg}">
			<div class="errorMessage alert alert-danger login-box">
				<div class="glyphicon glyphicon-remove-circle">&nbsp;${errorMsg}</div>
			</div>

		 </c:if>
  	  <h2>Your Posted Jobs</h2>
      <br/>
      <div style="text-align: center;">
        <a href="createOrEditJobView?jobId=">
          <button type="button" class="btn btn-default">Add Job</button>
        </a>
      </div>
      <table id="jobTable" class="table table-striped table-bordered display">
        <thead>
          <tr>
            <th>#</th>
            <th>Job Title</th>
            <th>Job Description</th>
            <th>Application Deadline</th>
            <th>Start Date</th>
            <th>Number Of Positions</th>
            <th>Number of Applicants</th>
            <th>Status</th>
            <th>Info</th>
           	<th>Edit</th>
          </tr>
        </thead>
  
        <tbody>
          <c:forEach var="job" items="${recruiterJobs}" varStatus="jobCounter">
            <tr>
              <td>${jobCounter.count}</td>
              <td>${job.title}</td>
              <td>${job.description}</td>
              <td>${job.deadlineDate}</td>
              <td>${job.startDate}</td>
              <td>${job.numOfPositions}</td>
              <td>${fn:length(job.jobApplications)}</td>
              <td>${job.status.name}</td>
              <td align="center">
              	<a type="btn" href="recruiterViewJob?jobId=${job.id}"><i class="glyphicon glyphicon-eye-open" style="font-size:20px;"></i></a>
              </td>
              <td align="center">
              	<a type="btn" href="createOrEditJobView?jobId=${job.id}"><i class="glyphicon glyphicon-cog" style="font-size:20px;"></i></a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    
    </section>
  </main>
            </div>
	<jsp:include page="footer.jsp"></jsp:include>          
        </div>
</div>

  
  
</body>
</html>