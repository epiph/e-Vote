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
<meta name="author" content="Epiphmo">
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">

<title>E-Voter | Home</title>


<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="js/confirm.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

	<div class="container">

		<br>
		<div class="col-md-8 col-md-offset-2">
			<p class="lead text-center">Select from the posts below the
				Candidates of your choice</p>
			<%
				if (request.getAttribute("error") != null) {
			%>

			<div class="alert alert-danger alert-dismissible fade in text-center"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				There has been a glitch processing your vote. Try Again
			</div>
			<%
				}
			%>
			<%
				if (request.getAttribute("message") != null) {
			%>

			<div
				class="alert alert-success alert-dismissible fade in text-center"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				Your Vote has been Succesfully Cast
			</div>
			<%
				}
			%>

			<hr>
			<hr>
			<form action="CastVote" id='contactForm' method="POST">
				<div class="row">
					<div class="form-group">
						<label for="president">President</label> <select
							class="form-control" name="president" id="president">
							<option>Candidate A</option>
							<option>candidate B</option>
							<!--  <option>Phillip Murgor</option> -->
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label>Governor</label> <select class="form-control" name="governor" id="governor">
							<option>Governor 1</option>
							<option>Governnor 2</option>
							
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="senator">Senator</label> <select class="form-control"
							name="senator" id="senator">
							<option>Senator 1</option>
							<option>Senator 2</option>
							
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="mp">Member Of Parliament</label> <select
							class="form-control" name="mp" id="mp">
							<option>Member 1</option>
							<option>Member 2</option>
							
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="womenrep">WomenRep</label> <select
							class="form-control" name="womenrep" id="womenrep">
							<option>Women Rep 1</option>
							<option>Women rep 2</option>
							
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<label for="mca">Member of County Assembly</label> <select
							class="form-control" name="mca" id="mca">
							<option>Mca 1</option>
							<option>Mca 2</option>
							
						</select>
					</div>
				</div>
				<div>

					<input type="button" name="submitBtn" value="Submit" id="submitBtn"
						data-toggle="modal" data-target="#confirmDialog"
						class="btn btn-success" />

				</div>


			</form>
			<div class="modal fade" id="confirmDialog" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">Confirm Your Choices</div>
						<div class="modal-body">
							You made the following choices. Please confirm?

							<!-- We display the details entered by the user here -->
							<table class="table">
								<tr>
									<th>President</th>
									<td id="pres">president</td>
								</tr>
								<tr>
									<th>Governor</th>
									<td id="gov">governor</td>
								</tr>
								<tr>
									<th>Senator</th>
									<td id="sen">senator</td>
								</tr>
								<tr>
									<th>MP</th>
									<td id="mps">mp</td>
								</tr>
								<tr>
									<th>Women Rep</th>
									<td id="wrep">womenrep</td>
								</tr>
								<tr>
									<th>MCA</th>
									<td id="mc">mca</td>
								</tr>


							</table>

						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Review Choices</button>
							<a href="#" id="submit" class="btn btn-success success">Vote</a>
						</div>
					</div>

				</div>

			</div>
			<script type="text/javascript">
			$(function() {
				/* We capture the value of the President field, to be echoed kwa hiyo modal class ya kuconfirm the choice */
				  $("#president").on("change", function() {
				    $("#pres").text($("#president").val());
				  }).trigger("change");
				
					/* Hapa tunacapture the value of the Guvnor field */
					$("#governor").on("change", function() {
			    $("#gov").text($("#governor").val());
			  }).trigger("change");
			
					/* Hapa tunacapture the value of the Senator field */
			$("#senator").on("change", function() {
			    $("#sen").text($("#senator").val());
			  }).trigger("change");
					
			/* Hapa tunacapture the value of MP field */
			$("#mp").on("change", function() {
			    $("#mps").text($("#mp").val());
			  }).trigger("change");
			
			/* Hapa tunacapture the value of Mwakilishi wa Wanawake (WomenRep) field */
			$("#womenrep").on("change", function() {
			    $("#wrep").text($("#womenrep").val());
			  }).trigger("change");
			
			/* Huyu ni MCA*/
			$("#mca").on("change", function() {
			    $("#mc").text($("#mca").val());
			  }).trigger("change");
			});
			 
			/* Function ya kusave the selected options to the db */
				$('#submit').click(function() {
					/* when the submit button in the modal is clicked, submit the form */
					$('#contactForm').submit();
				});
				
			</script>
			<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
			<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>

