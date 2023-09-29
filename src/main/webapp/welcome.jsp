<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<title>Black Screen Cinema</title>
	
	<!-- Viewport -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Favicon and Touch Icons -->
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


<!-- Body -->
<body>





	<main class="page-wrapper">

	<%
		if (session != null && session.getAttribute("email") != null) { %>
		
			<%@include file="inc/navbar.jsp"%>
			<p class="text-white fst-italic">Session exist:  <%=  session.getAttribute("email") %></p>
			
			
			
			
		  
		<% } else { %>
			<p class="text-white fst-italic">No user logged in </p>
		<%
		}
	%>

		<!-- Page title + Filters -->
		<section class="container text-center pt-2 mt-2 mt-md-4 ">
			<h2 class="h1 pt-2 pt-lg-0">Showtime</h2>
			<p class="fs-lg pb-2 pb-md-3 pb-lg-0 mb-4 mb-lg-5">All movies
				from our cinema around Malaysia</p>

		</section>


		<!-- Movie grid -->
		<section class="container pb-5 mb-2 mb-md-4 mb-lg-5">
			<div class="row pb-lg-3 d-flex justify-content-center">

				<!-- Item -->
				<div class="col-md-12 mb-2">
					<div class="card card-portfolio">
						<div class="card-img">
							<img
								src="https://www.grimoireofhorror.com/wp-content/uploads/2023/07/Untitled-design-1.png"
								alt="Image"
								style="height: 600px; width: 100%; object-fit: cover;">
						</div>
						<div class="card-body text-center">
							<h2 class="h4 mb-2">
								<a href="movie-selection.html" class="stretched-link">Talk
									to Me (2023)</a>
							</h2>
							<div class="card-portfolio-meta">
								<span class="text-muted">Horror/Thriller/Drama</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row ">

				<div
					class="col-3 card-hover shadow-none bg-none position-relative mb-4 mb-lg-5">
					<a href="
					
					<% if (session != null && session.getAttribute("email") != null) { %>
						/Seats
					<% }else { %>
						/bsc/Login
					<% } %>
					"
						class="text-decoration-none text-center" id="movie-item"> <img
						src="https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg"
						class="b-block border rounded-3 shadow-sm"
						alt="Mobile App Showcase v.1"
						style="height: 450px; width: 300px; object-fit: cover;">
						<h3 class="h5 mt-4 mb-3 mb-lg-0 text-white">Interstellar</h3>
					</a>
				</div>

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