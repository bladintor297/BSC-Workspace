<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>

<%@page import="com.bsc.beans.Malls"%>
<%@page import="com.bsc.beans.Movies"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<title>Black Screen Cinema</title>
    
    <%@include file="inc/header-links.jsp" %>

</head>

<!-- Body -->
<body>

    <main class="page-wrapper">
		
		<%@include file="inc/spinner.jsp" %>
        <%@include file="inc/navbar.jsp" %>
	

		<!-- Page title + Filters -->
		<section class="container text-center pt-2 mt-2 mt-md-4 ">
			<h2 class="h1 pt-2 pt-lg-0">Showtime</h2>
			<p class="fs-lg pb-2 pb-md-3 pb-lg-0 mb-4 mb-lg-5">All movies
				from our cinema around Malaysia</p>

		</section>


		<!-- Movie grid -->
		<section class="container pb-5 mb-2 mb-md-4 mb-lg-5">
			<div class="row pb-lg-3 d-flex justify-content-center">

				<%
					ArrayList<Movies> movie = (ArrayList<Movies>) request.getAttribute("movies");
					if (movie != null && !movie.isEmpty()) {
					    Movies m = movie.get(0); // Get the first element at index 0
					    
				%>
		
					
				<!-- Item -->
				<div class="col-md-9 mb-2">
					<div class="card card-portfolio">
						<div class="card-img">
							<img
								src="<%= m.getImageLandscape() %>"
								alt="Image"
								style="height: 400px; width: 100%; object-fit: cover;">
						</div>
						<div class="card-body text-center">
							<h2 class="h4 mb-2">
								<a href="
								<% if (session != null && session.getAttribute("email") != null) { %>
									/bsc/MovieSlot?movieID=<%=m.getMovieID() %>
								<% }else { %>
									/bsc/Login
								<% } %>
								" class="stretched-link"><%= m.getTitle() %></a>
							</h2>
							<div class="card-portfolio-meta">
								<span class="text-muted"><%= m.getGenre().replace(", ", "/") %></span>
							</div>
						</div>
					</div>
				</div>
				<%} %>
				
			</div>
			<div class="row  ">
				
				

				<%
					if (movie != null && !movie.isEmpty()) {
					    for (int i = 1; i < movie.size(); i++) {
					        Movies m = movie.get(i);
					%>

					        <div class="col-3 card-hover shadow-none bg-none position-relative mb-4 mb-lg-5">
					        	
								<a href="
								
								<% if (session != null && session.getAttribute("email") != null) { %>
									/bsc/MovieSlot?movieID=<%=m.getMovieID() %>
								<% }else { %>
									/bsc/Login
								<% } %>
								"
									
									class="text-decoration-none text-center" id="movie-item"> 
									
									<img
										
										src="<%= m.getImagePortrait() %>"
										class="b-block border rounded-3 shadow-sm"
										alt="<%= m.getTitle() %>"
										style="height: 450px; width: 300px; object-fit: cover;">
									<h3 class="h5 mt-4 mb-3 mb-lg-0 text-white"><%= m.getTitle() %></h3>
								</a>
							</div>
					<%
					    }
					}
				%>
				

			</div>
			<div class="row pb-lg-3"></div>


		</section>

	</main>

	<%@include file="inc/top-btn.jsp"%>



	<!-- Vendor Scripts -->
	<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

	<!-- Main Theme Script -->
	<script src="assets/js/theme.min.js"></script>
</body>
</html>