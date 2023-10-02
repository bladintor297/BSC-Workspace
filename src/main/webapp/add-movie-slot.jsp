<%@page import="java.util.ArrayList"%>

<%@page import="com.bsc.beans.Malls"%>
<%@page import="com.bsc.beans.Movies"%>
<%@page import="com.bsc.beans.Halls"%>
<%@page import="com.bsc.beans.MovieSlots"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Movie</title>

<link rel="apple-touch-icon" sizes="180x180" href="assets/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="assets/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="assets/favicon/favicon-16x16.png">
<link rel="manifest" href="assets/favicon/site.webmanifest">
<link rel="mask-icon" href="assets/favicon/safari-pinned-tab.svg" color="#6366f1">
<link rel="shortcut icon" href="assets/favicon/favicon.ico">
<meta name="msapplication-TileColor" content="#080032">
<meta name="msapplication-config" content="assets/favicon/browserconfig.xml">
<meta name="theme-color" content="#ffffff">

<!-- Vendor Styles -->
<link rel="stylesheet" media="screen" href="assets/vendor/boxicons/css/boxicons.min.css" />

<!-- Main Theme Styles + Bootstrap -->
<link rel="stylesheet" media="screen" href="assets/css/theme.min.css">
<link rel="stylesheet" media="screen" href="assets/css/style.css">

<script></script>
<script src="assets/js/function.js"></script>


</head>
<body>

<%@include file="inc/spinner.jsp"%>
<%@include file="inc/navbar.jsp"%>
	<section class="container text-center pt-2 mt-2 mt-md-4">			
		<h2 class="h5 pt-2 pt-lg-0"> Manage Movies </h2>

		<!-- Button trigger modal -->
		<button type="button" class="btn btn-warning" data-bs-toggle="modal"
			data-bs-target="#exampleModal"><i class="bx bx-movie"></i>Add New Movie</button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Movie Details</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<!-- Form -->
					<form class="text-start" action="/bsc/AddNewMovie" method="post">
					<div class="modal-body">
						<div class="mb-3" >
							<label for="exampleFormControlInput1" class="form-label">Title
							</label> <input name="Title" type="text" class="form-control" placeholder="Barbie"
								id="exampleFormControlInput1" >
						</div>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label">Description</label>
							<input name="Description" class="form-control" id="exampleFormControlTextarea1" placeholder="A live-action musical film based on the popular Mattel toy line."
								rows="3"></input>
						</div>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label">Release Date</label>
							<input name="ReleaseDate" type="date" class="form-control"
								id="exampleFormControlInput1" >
						</div>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label">Classification</label>
							<input name="Classification" type="text" class="form-control" placeholder="13"
								id="exampleFormControlInput1" >
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Genre</label>
							<input name="Genre" type="text" class="form-control" placeholder="Musical, Comedy"
								id="exampleFormControlInput1">
								
						</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Landscape
									image </label> <input name="ImageLandscape" type="text" class="form-control"
									placeholder="https://www.kenosha.com/wp-content/uploads/2023/08/et00072466-jjadjvahwx-landscape-copy.png"
									id="exampleFormControlInput1">
							</div>
							<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label">Portrait image</label>
							<input name="ImagePortrait" type="text" class="form-control" placeholder="https://media-cache.cinematerial.com/p/500x/q63ztpjf/barbie-movie-poster.jpg?v=1687352716"
								id="exampleFormControlInput1" >
						</div>
					</div>
					<!--  -->
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-warning">Submit</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<table class="table table-bordered table-hover mt-2">
		<thead>
			<tr>
				<th >Movie Title</th>
				<th >Mall</th>
				<th >Date</th>
				<th class="col-3">Movie Slot</th>
				<th class="col-2">Place</th>
				<th>Status</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<form action="/bsc/AddMovieSlot" method="POST">
					<td>
						<select name="movieID" class="form-select">
							<option value="0" selected disabled><em>- Select movie -</em></option>
							
							<%ArrayList<Movies> movie=  (ArrayList<Movies>)request.getAttribute("movies");
								
							for(Movies m:movie){%>
								<option value="<%= m.getMovieID() %>"><%= m.getTitle() %></option>
							<%}%>
						</select>
					</td>
					<td>
						<select name="mall" class="form-select">
							<option value="0" selected disabled><em>- Select mall -</em></option>
							
						<%ArrayList<Malls> mall =  (ArrayList<Malls>)request.getAttribute("malls");
							
						for(Malls m:mall){%>
							<option value="<%= m.getMallID() %>"><%= m.getMallName()%></option>
						<%}%>
						</select>
					</td>
					<td>
					    <div class="form-check px-0 my-0">
					        <%
					        // Get the current date
					        java.util.Date currentDate = new java.util.Date();
					
					        // Create a Calendar instance and set it to the current date
					        java.util.Calendar calendar = java.util.Calendar.getInstance();
					        calendar.setTime(currentDate);
					
					        // Create options for today, tomorrow, and the day after tomorrow
					        for (int i = 0; i < 5; i++) {
					            // Format the date in yyyy-MM-dd format
					            java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
					            java.text.SimpleDateFormat displayDate = new java.text.SimpleDateFormat("dd-MMM");
					            String dateValue = dateFormat.format(calendar.getTime());
					        %>
					        <div class="form-check mt-2">
					            <input class="form-check-input" type="checkbox" name="dates" value="<%= dateValue %>" id="date<%= i %>">
					            <label class="form-check-label" for="date<%= i %>"><%= displayDate.format(calendar.getTime()) %></label>
					        </div>
					        <%
					            // Increment the calendar to the next day
					            calendar.add(java.util.Calendar.DAY_OF_MONTH, 1);
					        }
					        %>
					    </div>
					</td>

					
					<td>
						<div class="form-check">
						  <div class="row">
							  <div class="col-4 mt-2">
								  <input class="form-check-input" type="checkbox" name="times" value="10.00 am" id="time1">
								  <label class="form-check-label" for="time1">
								    10.00 am
								  </label>
							  </div>
							   <div class="col-4 mt-2">
								  <input class="form-check-input" type="checkbox" name="times" value="12.00 pm" id="time2">
								  <label class="form-check-label" for="time2">
								    12.00 pm
								  </label>
							  </div>
							   <div class="col-4 mt-2">
								  <input class="form-check-input" type="checkbox" name="times" value="02.00 pm" id="time3">
								  <label class="form-check-label" for="time3">
								    02.00 pm
								  </label>
							  </div>
							  <div class="col-4 mt-2">
								  <input class="form-check-input" type="checkbox" name="times" value="04.00 pm" id="time4">
								  <label class="form-check-label" for="time4">
								    04.00 pm
								  </label>
							  </div>
							  <div class="col-4 mt-2">
								  <input class="form-check-input" type="checkbox" name="times" value="06.00 pm" id="time5">
								  <label class="form-check-label" for="time5">
								    06.00 pm
								  </label>
							  </div>
							  <div class="col-4 mt-2">
								  <input class="form-check-input" type="checkbox" name="times" value="08.00 pm" id="time6">
								  <label class="form-check-label" for="time6">
								    08.00 pm
								  </label>
							  </div>
							  <div class="col-4 mt-2">
								  <input class="form-check-input" type="checkbox" name="times" value="10.00 pm" id="time7">
								  <label class="form-check-label" for="time7">
								    10.00 pm
								  </label>
							  </div>
							  <div class="col-4 mt-2">
								  <input class="form-check-input" type="checkbox" name="times"value="12.00 am" id="time8">
								  <label class="form-check-label" for="time8">
								    12.00 am
								  </label>
							  </div>
							  <div class="col-4 mt-2">
								  <input class="form-check-input" type="checkbox" name="times" value="02.00 am" id="time9">
								  <label class="form-check-label" for="time9">
								    02.00 am
								  </label>
							  </div>
						  </div>
						</div>
					</td>
					<td>
						<div class="form-check">
							<div class="row">
								<%
								ArrayList<Halls> hall =  (ArrayList<Halls>)request.getAttribute("halls");
								for(Halls h:hall){
								%>
									
									  <div class="col-6">
										  <input class="form-check-input" type="checkbox" value="<%= h.getHallID() %>" name="halls" id="hall<%=h.getHallID()%>">
										  <label class="form-check-label" for="hall<%=  h.getHallName() %>">
										    <%=h.getHallName()%> (<%=h.getCategory()%>)
										  </label>
									  </div>
									  
								  
								<%}%>
							</div>
						</div>
						
						
					</td>
					<td>
						<span class="badge bg-warning rounded-pill px-3"> 50 seats left</span>
					</td>
					<td>
						<div class="d-grid gap-2">
							<button type="submit" class="btn btn-success btn-sm">Add</button>
							<button type="reset" class="btn btn-danger btn-sm">Clear</button>
						</div>
					</td>
				</form>
			</tr>
			
			
			
		</tbody>
	</table>
	
	
		<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

	<!-- Main Theme Script -->
	<script src="assets/js/theme.min.js"></script>
</body>
</html>