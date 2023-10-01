<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<title>Black Screen Cinema</title>
	
	<!-- Viewport -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<%@include file="inc/header-links.jsp"%>


</head>


<!-- Body -->
<body>





	<main class="page-wrapper">

	<%
		//later tukar ni
		if (session != null && session.getAttribute("email") == null) { %>
		
		
		<%@include file="inc/navbar.jsp"%>	
			
		<!-- Page title + Filters -->
		<section class="container text-center pt-2 mt-2 mt-md-4 ">
			<h2 class="h1 pt-2 pt-lg-0">- Select Seats -</h2>
			
			<form action="/bsc/MovieSlot" method="POST">
				<div class="row mx-1 my-5" role="group" >
				  <button type="button" class="btn btn-warning" >Screen</button>
				  
				</div>
				<% for (char i = 'A'; i <= 'E'; ++i){ %>
					<div class="btn-group d-flex mt-2" role="group" id="btncheck<%= i %>" aria-label="Basic checkbox toggle button group">
						<% for (int j = 1; j <= 12; ++j){ %>
							
								<input type="checkbox" class="btn-check" id="btncheck<%= i + String.valueOf(j)%>" autocomplete="off">
						  		<label class="btn btn-outline-warning" for="btncheck<%= i + String.valueOf(j)%>"><%= i + String.valueOf(j)%></label>
					  		
						
						<% if (j == 3 || j == 9) {%>
							<div class="mx-2"></div>
						<%} %>
					<% } %>
					</div>
				<% } %>
				
				<button type="submit" class="btn btn-success btn-sm mt-4 rounded-pill px-5">Proceed	</button>
			</form>

		</section>
	
								 
				
				
								
			
		
			<div class="row pb-lg-3"></div>
			

	
			
		  
		<% } else { %>
			<p class="text-white fst-italic">No user logged in </p>
		<%
		}
	%>
		

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