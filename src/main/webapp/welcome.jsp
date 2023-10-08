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
        
         <!-- Gallery (carousels) -->
      <section class="mb-5 ">

		    <div class="pb-2 pb-sm-3 pb-md-4">
		
		        <!-- LTR -->
		        <div class="swiper" data-swiper-options='{
		            "loop": true,
		            "grabCursor": false,
		            "centeredSlides": true,
		            "autoplay": {
		                "delay": 0,
		                "disableOnInteraction": false
		            },
		            "freeMode": true,
		            "speed": 38000,
		            "freeModeMomentum": false,
		            "breakpoints": {
		                "0": {
		                    "slidesPerView": 1,
		                    "spaceBetween": 8
		                },
		                "500": {
		                    "spaceBetween": 16
		                },
		                "768": {
		                    "slidesPerView": 2,
		                    "spaceBetween": 24
		                }
		            }
		        }'>
		            <div class="swiper-wrapper">
		
		                <!-- Item -->
		                <div class="swiper-slide">
		                    <div class="image-container">
		                        <img src="https://i.ytimg.com/vi/fw-wLR6xxwE/maxresdefault.jpg" alt="Gallery image" class="rounded-3">
		                    </div>
		                </div>
		                
		                <!-- Item -->
		                <div class="swiper-slide">
		                    <div class="image-container">
		                        <img src="https://my-flixer.online/wp-content/uploads/2023/03/Everything-Everywhere-All-at-Once-2022.jpg" alt="Gallery image" class="rounded-3">
		                    </div>
		                </div>
		                
		                 <!-- Item -->
		                <div class="swiper-slide">
		                    <div class="image-container">
		                        <img src="https://i.ytimg.com/vi/NIl0d3_SzdU/maxresdefault.jpg" alt="Gallery image" class="rounded-3">
		                    </div>
		                </div>
		
		                <!-- Item -->
		                <div class="swiper-slide">
		                    <div class="image-container">
		                        <img src="https://i.ytimg.com/vi/Js6oJqWse8w/maxresdefault.jpg" alt="Gallery image" class="rounded-3">
		                    </div>
		                </div>
		
		                <!-- Item -->
		                <div class="swiper-slide">
		                    <div class="image-container">
		                        <img src="https://dotcreative.my/data/2018/05/Dot-Microsite_GSC-image-09-2.jpg" alt="Gallery image" class="rounded-3">
		                    </div>
		                </div>
		            </div>
		        </div>
		
		    </div>
		</section>

		        
	

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
						<div class="card-body ">
							<a href="/bsc/Movie?movieID=<%=m.getMovieID() %>" class="bx bx-info-circle fs-1 lh-1 me-1 position-absolute top-0 left-0 text-start zindex-5 p-2 text-decoration-none text-warning"></a>
							<h2 class="h4 mb-2 text-center">
								<a href="
								<% if (session != null && session.getAttribute("email") != null) { %>
									/bsc/MovieSlot?movieID=<%=m.getMovieID() %>
								<% }else { %>
									/bsc/Login
								<% } %>
								" class="stretched-link"><%= m.getTitle() %></a>
							</h2>
							<div class="card-portfolio-meta text-center">
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
					        	
				
								
								<a href="/bsc/Movie?movieID=<%=m.getMovieID() %>" class="bx bx-info-circle fs-2 lh-1 me-1 position-absolute top-0 right-auto left-auto zindex-5 p-2 text-decoration-none text-warning"></a>
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


	<%@include file="inc/footer.jsp"%>
	<%@include file="inc/top-btn.jsp"%>
	<%@ include file="inc/footer-links.jsp" %>
</body>
</html>