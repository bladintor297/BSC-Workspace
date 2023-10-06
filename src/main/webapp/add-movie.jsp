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
		<h2 class="h5 pt-2 pt-lg-0"> Manage Movies </h2>
		
		<!-- Button trigger modal -->
		<div class="d-flex justify-content-end">
		<button type="button" class="btn btn-warning btn-sm me-1" data-bs-toggle="modal"
			data-bs-target="#exampleModal"><i class="bx bx-movie"></i>Add New Movie</button>
			<a href="/bsc/AddMovieSlot?movieID=0" class="btn btn-warning btn-sm" >
				<i class="bx bx-chair"></i>Manage Movie Slot
			</a>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog ">
				<div class="modal-content ">
					<div class="modal-header">
						<h1 class="modal-title fs-5 " id="exampleModalLabel">Movie Details</h1>
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
							 <select name="Classification" class="form-select" id="autoSizingSelect">
									<option selected>Choose...</option>
									<option value="13">13</option>
									<option value="16">16</option>
									<option value="18">18</option>
								</select>
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
	
	<table class="table table-bordered table-hover mt-2 align-middle border-white">
		<thead class="bg-success ">
			<tr>
				<th >Movie ID</th>
				<th >Title</th>
				<th >Description</th>
				<th >Date</th>
				<th >Classification</th>
				<th >Genre</th>
				<th>Poster</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody class="bg-black">
			
				<% ArrayList<Movies> movies = (ArrayList<Movies>) request.getAttribute("movies"); %>
				<%
				for (int i = 0; i < movies.size(); i++) {
					
					

					SimpleDateFormat formattedDate = new SimpleDateFormat("dd-MMM");
				
					
				%>
				<tr>
						<th ><%=movies.get(i).getMovieID() %></th>
						<td><%=movies.get(i).getTitle() %></td>
						<td><%=movies.get(i).getDescription()%></td>
						<td><%= movies.get(i).getReleaseDate()%></td>
						<td><%=movies.get(i).getClassification()%></td>
						<td><%=movies.get(i).getGenre()%></td>
						<td><img src="<%=movies.get(i).getImagePortrait()%>" style="height:250px; width: 200px; object-fit:cover;"></td>
						<td>
							<div class="d-grid my-auto gap-3">
								<a href="AddMovieSlot?movieID=<%=movies.get(i).getMovieID()%>" class="btn btn-warning btn-sm">Add slot</a>
								<a  href="ManageMovie?movieID=<%=movies.get(i).getMovieID()%>" class="btn btn-danger btn-lg btn-block btn-sm">Delete</a>
								
							
							</div>
						</td>
				</tr>
	
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