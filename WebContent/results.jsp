<%@ page session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/voting" user="root" password="" />


<sql:query dataSource="${snapshot}" var="result1">
SELECT count(*) as myCount from Tallies where presChoice='Candidate A';
</sql:query>
<sql:query dataSource="${snapshot}" var="result2">
SELECT count(*) as myCount from Tallies where presChoice='Candidate B';
</sql:query>
<sql:query dataSource="${snapshot}" var="result4">
SELECT count(*) as myCount from Tallies where govChoice='Governor 1';
</sql:query>
<sql:query dataSource="${snapshot}" var="result5">
SELECT count(*) as myCount from Tallies where govChoice='Governor 2';
</sql:query>
<!--<sql:query dataSource="${snapshot}" var="result6">
SELECT count(*) as myCount from Tallies where govChoice='Ferdinard Waititu';
</sql:query> -->
<sql:query dataSource="${snapshot}" var="result7">
SELECT count(*) as myCount from Tallies where senChoice='Senator 1 ';
</sql:query>
<sql:query dataSource="${snapshot}" var="result8">
SELECT count(*) as myCount from Tallies where senChoice='Senator 2';
</sql:query>
<sql:query dataSource="${snapshot}" var="result10">
SELECT count(*) as myCount from Tallies where mpChoice='Member 1';
</sql:query>
<sql:query dataSource="${snapshot}" var="result11">
SELECT count(*) as myCount from Tallies where mpChoice='Member 2';
</sql:query>
<sql:query dataSource="${snapshot}" var="result13">
SELECT count(*) as myCount from Tallies where womenChoice='Women Rep 1';
</sql:query>
<sql:query dataSource="${snapshot}" var="result14">
SELECT count(*) as myCount from Tallies where womenChoice='Women Rep 2';
</sql:query>
<sql:query dataSource="${snapshot}" var="result16">
SELECT count(*) as myCount from Tallies where mcaChoice='Mca 1';
</sql:query>
<sql:query dataSource="${snapshot}" var="result17">
SELECT count(*) as myCount from Tallies where mcaChoice='Mca 2';
</sql:query>

<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
body {
	background: url(images/white.jpg) no-repeat center;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
}
</style>

<title>Tallies</title>
<%
	response.setIntHeader("Refresh", 3);
%>


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
			<a class="navbar-brand" href="votingConfirmation.jsp">e-Vote</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Dashboard</a></li>
				<li><a href="#">Settings</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="#">Help</a></li>
			</ul>

		</div>
	</div>
	</nav>

	<br>
	<br>


	<div class="container">
		<h2 class="sub-header pull-left">
			These are the Tallies so far:
			<h2 class="sub-header pull-right">
				<span id="date_time"></span>
				<script type="text/javascript">
					window.onload = date_time('date_time');
				</script>
			</h2>
		</h2>
	</div>
	<%
				if (request.getAttribute("error") != null) {
			%>

			<div class="alert alert-danger alert-dismissible fade in text-center"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			Please select appropriate elective post
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
				Vote Cast successfully
			</div>
			<%
				}
			%>
	<div class='row'>
	<div class='col-md-4'>
	<h2>President</h2>
		<c:forEach var="uhuru" items="${result1.rows}">
			<p>
			<a href="#">Candidate A </a> <span class="badge">	<c:out value="${uhuru.myCount}"/></span>
		</p>
		</c:forEach>
		<c:forEach var="rao" items="${result2.rows}">
			<p>
			<a href="#">Candidate B <span class="badge">	<c:out value="${rao.myCount}" /></td></span></a>
		</p>
		</c:forEach>
		
	</div>
	<div class='col-md-4'>
	<h2>Governor</h2>
		<c:forEach var="another2" items="${result4.rows}">
		<p>
			<td><a href="#">Governor 1 <span class="badge">	<c:out value="${another2.myCount}" /></td></span></a>
		</p>
		</c:forEach>
		<c:forEach var="another3" items="${result5.rows}">
		<p>
			<a href="#">Governor 2 <span class="badge">	<c:out value="${another3.myCount}" /></td></span></a>
		</p>
		</c:forEach>
		
	</div>
	<div class='col-md-4'>
	<h2>Senator</h2>
		<c:forEach var="another5" items="${result7.rows}">
		<p>
			<a href="#">Senator 1 <span class="badge">	<c:out value="${another5.myCount}" /></td></span></a>
		</p>
		</c:forEach>
		<c:forEach var="another6" items="${result8.rows}">
		<p>
			<a href="#">Senator 2<span class="badge">	<c:out value="${another6.myCount}" /></td></span></a>
		</p>
		</c:forEach>
		
	</div>
	</div>
	<hr>
	<br>
	<br>
	<div class='col-md-4'>
	<h2>MP</h2>
		<c:forEach var="another8" items="${result10.rows}">
		<p>
			<a href="#">Member 1 <span class="badge">	<c:out value="${another8.myCount}" /></td></span></a>
		</p>
		</c:forEach>
		<c:forEach var="another9" items="${result11.rows}">
		<p>
			<a href="#">Member 2 <span class="badge">	<c:out value="${another9.myCount}" /></td></span></a>
		</p>
		</c:forEach>
		
	</div>
	<div class='col-md-4'>
	<h2>Women Rep</h2>
		<c:forEach var="another11" items="${result13.rows}">
		<p>
			<a href="#">Women Rep 1 <span class="badge">	<c:out value="${another11.myCount}" /></td></span></a>
		</p>
		</c:forEach>
		<c:forEach var="another12" items="${result14.rows}">
		<p>
			<a href="#">Women Rep 2 <span class="badge">	<c:out value="${another12.myCount}" /></td></span></a>
		</p>
		</c:forEach>
		
	</div>
	<div class='col-md-4'>
	<h2> MCA</h2>
		<c:forEach var="another14" items="${result16.rows}">
		<p>
			<a href="#">Mca 1<span class="badge">	<c:out value="${another14.myCount}" /></td></span></a>
		</p>
		</c:forEach>
		<c:forEach var="another15" items="${result17.rows}">
		<p>
			<a href="#"> Mca 2<span class="badge">	<c:out value="${another15.myCount}" /></td></span></a>
		</p>
		</c:forEach>
		
	</div>

		<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>

		<script>
			window.jQuery
					|| document
							.write('<script src="js/vendor/jquery-2.2.3.min.js"><\/script>')
		</script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>