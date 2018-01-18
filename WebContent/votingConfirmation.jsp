<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Pulse | Search Voter</title>


<link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>



<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/voting" user="root" password="" />

<sql:query dataSource="${snapshot}" var="result">
SELECT * from voter_register where Identification_number = ?
<sql:param value="${param.Identification_number}"></sql:param>
</sql:query>

<title>E-Voting| Democracy for all</title>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="votingConf.jsp">e-Vote</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="votingConfirmation.jsp">Dashboard</a></li>
				<li><a href="#">Settings</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="#">Help</a></li>
			</ul>

		</div>
	</div>
	</nav>
	<div class="container">
		<hr>
		<br>
		<div class="col-md-8 col-md-offset-2">
			<p class="lead text-center">Enter your Identification Number to confirm your Registration Details</p>
			<p class="lead small text-center">Ensure you enter the
				correct Identification Number , then press the Proceed Button to participate in voting</p>

	
			<form class="form-inline col-md-8 col-md-offset-4" role="form"
				method="post">
									<%
				if (request.getAttribute("error") != null) {
			%>

			<div class="alert alert-danger alert-dismissible fade in text-center"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				Oops, looks like you have already voted
			</div>
			<%
				}
			%>
			<%
				if (request.getAttribute("message") != null) {
			%>

			<div class="alert alert-success alert-dismissible fade in text-center"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				welcome to vote
			</div>
			<%
				}
			%>
				
				<div class="form-group">
					<label class="sr-only" for="Identification_number">Identification Number</label>
					<input type="text" placeholder="Search Id No."
						class="form-control" id="Identification_number" name="Identification_number">
				</div>
				<button title="Search Database for the Voters Details"
					type="submit" class="btn btn-success">Query</button>
			
					
			</form>

			<hr>
			<hr>
			<form action="Delete" class="form-horizontal" method="POST">
				<table class="table table-striped">
					<c:forEach var="row" items="${result.rows}">

						<div class="form-group">
							<label class="col-sm-2 control-label">Id Number</label>

							<div class="col-sm-6">
								<input name="Identification_number" type="text" class="form-control"
									placeholder="Id. Number" value="${row.Identification_number}" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">First Name</label>

							<div class="col-sm-6">
								<input name="Fname" type="text" class="form-control"
									placeholder="First Name" value="${row.Fname}" readonly>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">Last Name</label>

							<div class="col-sm-6">
								<input name="Lname" type="text" class="form-control"
									placeholder="Last Name" value="${row.Lname}" readonly>
							</div>
						</div>
				
						<div>
						
							</form>
							<button id="vote" type="submit" class="btn btn-success" data-toggle="popover" title="Popover title" data-content="Another popover" >Proceed</button>
							<button id="btnCancel" type="reset"
								class="btn btn-danger pull-right col-md-3">Cancel</button>

						</div>

					</c:forEach>
				</table>
			</form>
		</div>

	</div>
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>