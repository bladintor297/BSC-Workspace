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
<%@include file="inc/header-links.jsp"%>

</head>
<body>

<%@include file="inc/spinner.jsp"%>
<%@include file="inc/navbar.jsp"%>

	<section class="container pt-2 mt-2 mt-md-4">			
		<h2 class="h5 pt-2 pt-lg-0 text-center"> Manage Movies </h2>
		
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
				<th class="text-center" style="width:9%">Movie ID</th>
				<th >Title</th>
				<th >Description</th>
				<th style="width:10%">Date</th>
				<th class="text-center">Classification</th>
				<th style="width:10%">Genre</th>
				<th style="width:20%">Poster</th>
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
						<td>
							<p><%=movies.get(i).getTitle() %></p>
						</td>
						<td>
							<p align="justify"><%=movies.get(i).getDescription()%></p>
						</td>
						<td>
							<% 

							 // Assuming movies.get(i).getReleaseDate() returns a String in the format "yyyy-MM-dd HH:mm:ss.S"
							  String dateStr = movies.get(i).getReleaseDate();
							  SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
							  Date releaseDate = inputFormat.parse(dateStr);

							  SimpleDateFormat outputFormat = new SimpleDateFormat("dd MMM, yyyy");
							  String displayDate = outputFormat.format(releaseDate);
							%>
							<p><%= displayDate %></p>
						</td>
						<td class="text-center"><%=movies.get(i).getClassification()%></td>
						<td><%=movies.get(i).getGenre()%></td>
						<td><img src="<%=movies.get(i).getImagePortrait()%>" style="height:250px; width: 200px; object-fit:cover;"></td>
						<td>
							<div class="d-grid my-auto gap-3">
								<a href="AddMovieSlot?movieID=<%=movies.get(i).getMovieID()%>" class="btn btn-warning btn-sm">Add slot</a>
								<button type="button" class="btn btn-primary btn-sm me-1"
								data-bs-toggle="modal" data-bs-target="#updateMovie<%=movies.get(i).getMovieID()%>">
								Update
								</button>
								<a  href="ManageMovie?movieID=<%=movies.get(i).getMovieID()%>" class="btn btn-danger btn-lg btn-block btn-sm">Delete</a>
							

						</div>
						</td>
				</tr>
				
					<div class="modal fade" id="updateMovie<%=movies.get(i).getMovieID()%>" tabindex="-1" aria-labelledby="updateMovieLabel" aria-hidden="true">
						<div class="modal-dialog ">
							<div class="modal-content ">
								<div class="modal-header">
									<h1 class="modal-title fs-5 " id="updateMovieLabel">Update Movie</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<!-- Form -->
								<form class="text-start" action="/bsc/MovieUpdate" method="POST">
								<div class="modal-body">
									<input type = "hidden" name="movieID" value="<%=movies.get(i).getMovieID() %>">
									<div class="mb-3" >
										<label for="updateTitle" class="form-label">Title
										</label> <input name="Title" type="text" class="form-control"
											id="updateTitle" value="<%=movies.get(i).getTitle()%> ">
									</div>
									<div class="mb-3">
										<label for="updateDesc" class="form-label">Description</label>
										<textarea name="Description" class="form-control" id="updateDesc" rows="3"><%=movies.get(i).getDescription()%></textarea>
									</div>
									<div class="mb-3">
										<label for="updateDate" class="form-label">Release Date</label>
										<%
										// Assuming movies.get(i).getReleaseDate() returns a string like "2022-05-27 00:00:00"
										String dbDateStr = movies.get(i).getReleaseDate();
										String formattedDateStr = ""; // Initialize a formatted date string
										
										// Parse the database date string
										java.text.SimpleDateFormat dbDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
										java.util.Date dbDate = dbDateFormat.parse(dbDateStr);
										
										// Format the date as a string in "yyyy-MM-dd" format for the HTML date input
										java.text.SimpleDateFormat htmlDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
										formattedDateStr = htmlDateFormat.format(dbDate);
										%>
										
										<input name="ReleaseDate" type="date" class="form-control" id="updateDate" value="<%= formattedDateStr %>">
									</div>
									<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label">Classification</label>
										 <select name="Classification" class="form-select" id="updateClass">
												<option selected><%=movies.get(i).getClassification()%></option>
												<option value="13">13</option>
												<option value="16">16</option>
												<option value="18">18</option>
											</select>
										</div>
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">Genre</label>
										<input name="Genre" type="text" class="form-control" placeholder="Musical, Comedy"
											id="updateGenre" value="<%=movies.get(i).getGenre()%>">
											
									</div>
										<div class="mb-3">
											<label for="exampleFormControlInput1" class="form-label">Landscape
												image </label> <input name="ImageLandscape" type="text" class="form-control"
												placeholder="https://www.kenosha.com/wp-content/uploads/2023/08/et00072466-jjadjvahwx-landscape-copy.png"
												id="updateLandscape" value="<%=movies.get(i).getImageLandscape()%>">
										</div>
										<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label">Portrait image</label>
										<input name="ImagePortrait" type="text" class="form-control" placeholder="https://media-cache.cinematerial.com/p/500x/q63ztpjf/barbie-movie-poster.jpg?v=1687352716"
											id="updatePortrait" value="<%=movies.get(i).getImagePortrait()%>" >
									</div>
								</div>
								<!--  -->
								
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Cancel</button>
									<button type="submit" class="btn btn-warning">Update</button>
								</div>
								</form>
							</div>
						</div>
					</div>
	
				<%}%>
				

			
			
		</tbody>
	</table>

		
	</section>
	<%@include file="inc/top-btn.jsp"%>
	<%@include file="inc/footer.jsp"%>
	<%@ include file="inc/footer-links.jsp" %>
</body>
</html>