<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList, java.text.SimpleDateFormat, java.util.Calendar" %>

<%@page import="com.bsc.beans.Halls"%>
<%@page import="com.bsc.beans.Malls"%>
<%@page import="com.bsc.beans.Movies"%>
<%@page import="com.bsc.beans.MovieSlots"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Black Screen Cinema</title>

    <!-- Viewport -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    	<!-- Favicon and Touch Icons -->
	<link rel="icon" href="assets/favicon/logobsc.ico">
	<meta name="msapplication-TileColor" content="#080032">
	<meta name="msapplication-config" content="assets/favicon/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">

    <%@include file="inc/header-links.jsp" %>


</head>


<!-- Body -->

<body>





    <main class="page-wrapper">



        <%@include file="inc/navbar.jsp" %>
        	
        	<%
        	ArrayList<MovieSlots> movieslots = (ArrayList<MovieSlots>) request.getAttribute("movieslots");
        	java.util.Set<Integer> visitedMallIDs = new java.util.HashSet<Integer>();
        	java.util.Set<Integer> visitedMovieSlots = new java.util.HashSet<Integer>();
        	%>

            <!-- Page title + Filters -->
            <section class="container text-center pt-2 mt-2 mt-md-4 ">
                <h2 class="h1 pt-2 pt-lg-0"> Movie Showtime </h2>

                <div class="row pb-lg-3 d-flex justify-content-center">
                    <% Movies m = (Movies) request.getAttribute("movie");  %>

                        <!-- Item -->
                        <div class="col-md-3 ">
                            <div class="card card-portfolio">
                                <div class="card-img">
                                    <img src="<%= m.getImagePortrait() %>" alt="<%= m.getTitle() %>"
                                        style="height: 300px; width: 100%; object-fit: cover;">
                                </div>
                                <div class="card-body text-center">
                                    <h2 class="h4 mb-2">
                                        <a class="stretched-link">
                                            <%= m.getTitle() %>
                                        </a>
                                    </h2>
                                    <div class="card-portfolio-meta">
                                        <span class="text-muted">
                                            <%= m.getGenre().replace(", ", " /") %>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                       

                </div>
            </section>

            <div class="container-fluid bg-warning bg-opacity-10 border border-warning border-start-0 rounded-end">
                <div class="container my-0 py-0">
                    <p class="text-white text-start my-0 py-3">Select date</p>
                </div>
            </div>
            <section class="container text-center pt-2 mt-2 mt-md-4 ">

                <div class="row pb-lg-3 d-flex justify-content-center">
                
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                    
                    <%
			            SimpleDateFormat standardFormat = new SimpleDateFormat("yyyy-MM-dd");
                    	SimpleDateFormat dayFormat = new SimpleDateFormat("dd");
                    	SimpleDateFormat monthFormat = new SimpleDateFormat("MMM");
                    	SimpleDateFormat dayWeekFormat = new SimpleDateFormat("EEE");
                    
			            Calendar calendar = Calendar.getInstance();
			
			            for (int i = 0; i < 3; i++) {
			            String formattedDate = standardFormat.format(calendar.getTime());
			            String day = dayFormat.format(calendar.getTime());
			            String dayWeek = dayWeekFormat.format(calendar.getTime());
			            String month = monthFormat.format(calendar.getTime());
			         %>
			         	<li class="nav-item d-grid" role="presentation">
                            <span><%= month %></span>
                            <button class="nav-link rounded-pill day<%=i%>" id="day<%=i%>-tab" data-bs-toggle="tab"
                                data-bs-target="#day<%=i%>" type="button" role="tab" aria-controls="day<%=i%>"
                                aria-selected="true">
                                <span class="h4 p-2 my-auto"><%= day %></span>
                            </button>
                            <span class="text-uppercase fw-bold"><%= dayWeek %></span>
                        </li>
			          
			        <%
			        calendar.add(Calendar.DAY_OF_YEAR, 1);
			        } %>
                        
                    </ul>
                    
                </div>
            </section>

            <div class="container-fluid bg-warning bg-opacity-10 border border-warning border-start-0 rounded-end">
                <div class="container my-0 py-0">
                    <p class="text-white text-start my-0 py-3">
                        Select time
                    </p>
                </div>
            </div>
            <div class="accordion container" id="accordionPanelsStayOpenExample">

                <div class="tab-content" style="min-height: 500px;">
                
                	<%
			            calendar = Calendar.getInstance();
			
			            for (int i = 0; i < 3; i++) {
			            String formattedDate = standardFormat.format(calendar.getTime());
			            String day = dayFormat.format(calendar.getTime());
			            String dayWeek = dayWeekFormat.format(calendar.getTime());
			            String month = monthFormat.format(calendar.getTime());
			         %>
			         
			         <div class="tab-pane tab<%=i%>" id="day<%=i%>" role="tabpanel" aria-labelledby="day<%=i%>-tab" tabindex="0">
                        
                       
                        <div class="accordion-item border-0 mt-3">
							
							<% 
							
							for (MovieSlots movieslot: movieslots) { 
							if (formattedDate.equals(movieslot.getDate()) && visitedMallIDs.add(movieslot.getMall())) {
							%>
							<h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapse<%= movieslot.getMall() %>" aria-expanded="false"
                                    aria-controls="flush-collapse<%= movieslot.getMall() %>">
                                    <%= movieslot.getMallName() %> (Mall ID: <%= movieslot.getMall() %>)
                                </button>
                            </h2>


                            <div id="flush-collapse<%= movieslot.getMall() %>" class="accordion-collapse collapse show"
                                data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    <div class="row">

										<% for (int j = 0; j < movieslots.size(); ++j) { 
											if (formattedDate.equals(movieslots.get(j).getDate()) 
													&& (movieslots.get(j).getMall() == (movieslot.getMall()))
													&& visitedMovieSlots.add(movieslots.get(j).getMovieSlotID())){
										
										%>
                                        <div class="col-2 ">
                                            <div class="position-relative text-center my-3 border-end mx-n1">
                                                <a href="/bsc/seats.jsp" class="btn-link text-decoration-none">
                                                    <div class="pt-2">
                                                        <h5 class="mb-1"> <%= movieslots.get(j).getSlot() %></h5>
                                                        <hr
                                                            class="bg-warning bg-opacity-10 border border-warning border-start-0 rounded-end mx-5">
                                                        <p class="fs-sm text-muted mb-0">
                                                             <%= movieslots.get(j).getHallCategory() %> (<%= movieslots.get(j).getHallName() %>)
                                                        </p>
                                                    </div>
                                                </a>

                                            </div>
                                        </div>
                                        
                                        	<%} 
										} %>

                                    </div>
                                </div>

                            </div>
                            
							<%
							}
							} %>

                        </div>

                    </div>
			         
			         <%
			         calendar.add(Calendar.DAY_OF_YEAR, 1);
			         visitedMallIDs.clear();
			         visitedMovieSlots.clear();
			         } %>
                
                </div>

            </div>
            <!-- Tab panes -->

            <div class="row pb-lg-3"></div>


    </main>

    <%@include file="inc/top-btn.jsp" %>
		
		<script>
			// Get the first li element with the class .nav-link
			const firstNavLink = document.querySelector('.day0');
	
			// Add the active class to the firstNavLink element
			firstNavLink.classList.add('active');
	
			// Get the tab-pane element with the id day0
			const day0TabPane = document.querySelector('.tab0');
	
			// Set the active class to the day0TabPane element
			day0TabPane.classList.add('active');
		</script>


        <!-- Vendor Scripts -->
        <script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

        <!-- Main Theme Script -->
        <script src="assets/js/theme.min.js"></script>
</body>

</html>