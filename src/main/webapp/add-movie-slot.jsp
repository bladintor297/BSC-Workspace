<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList, java.text.SimpleDateFormat, java.util.Calendar, java.util.Date" %>


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
<meta name="viewport" content="width=device-width, initial-scale=0.9">
<title>Add Movie</title>

	<!-- Favicon and Touch Icons -->
	<link rel="icon" href="assets/favicon/logobsc.ico">
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
		<h2 class="h5 pt-2 pt-lg-0"> Manage Movies Slot</h2>
	

	<table class="table table-bordered table-hover mt-2">
		<thead>
			<tr>
				<th scope="row">No.</th>
				<th >Movie Title</th>
				<th >Mall</th>
				<th style="width:content-width">Date</th>
				<th class="col-3">Movie Slot</th>
				<th class="col-2">Place</th>
				<th>Status</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<form action="/bsc/AddMovieSlot" method="POST">
					<td></td>
					<td>
						<select name="movieID" class="form-select">
							<option value="0" disabled><em>- Select movie -</em></option>
							
							<%ArrayList<Movies> movie=  (ArrayList<Movies>)request.getAttribute("movies");
							int mID = (Integer)request.getAttribute("mID");
								
							for(Movies m:movie){%>
								<option value="<%= m.getMovieID() %>"
								
								<% if (mID == m.getMovieID()) {%>
								selected
								<%} %>
								><%= m.getTitle() %></option>
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
					    <div class="form-check px-0 my-0 ">
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
			
			
				<% ArrayList<MovieSlots> movieslots = (ArrayList<MovieSlots>) request.getAttribute("movieslots");
												  
				//Collections.sort(movieslots, Collections.reverseOrder());
												  
				if (movieslots != null){ %>
				<%
				for (int i = 0; i < movieslots.size(); i++) {
					
					

					SimpleDateFormat formattedDate = new SimpleDateFormat("dd-MMM");
				
					
				%>
				<tr>
					<th scope="row"><%=i + 1%>.</th>
					<td><%=movieslots.get(i).getMovieTitle() %></td>
					<td><%=movieslots.get(i).getMallName()%></td>
					<td><%= movieslots.get(i).getDate() %></td>
					<td><%=movieslots.get(i).getSlot()%></td>
					<td><%=(movieslots.get(i).getHallName())%> (<%=movieslots.get(i).getHallCategory()%>)</td>
					<td>
						
						<% if (movieslots.get(i).getStatus() == 1){ %>
							<span class="badge bg-danger rounded-pill px-3"> Cancelled</span>
						<%} else { %>
							<span class="badge bg-success rounded-pill px-3"> Successful</span>
						<%}%>
					</td>
					<td>
							<a href="/bsc/ManageMovieSlot?movieslotID=<%=movieslots.get(i).getMovieSlotID()%>" class="btn btn-danger btn-lg btn-block btn-sm">Delete</a>
						
						
					</td>
				</tr>
	
				<%}%>
				<%}%>
				

			
			
		</tbody>
	</table>
	</section>
	
	
	
		<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

	<!-- Main Theme Script -->
	<script src="assets/js/theme.min.js"></script>
</body>
</html>