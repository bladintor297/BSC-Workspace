<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Calendar" %>
<%@ page import="java.util.Date" %>

<%@page import="com.bsc.beans.Users"%>
<%@page import="com.bsc.beans.Halls"%>
<%@page import="com.bsc.beans.Malls"%>
<%@page import="com.bsc.beans.Movies"%>
<%@page import="com.bsc.beans.MovieSlots"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <title>Black Screen Cinema</title>
    
    <%@include file="inc/header-links.jsp" %>

</head>

<!-- Body -->
<body>

    <main class="page-wrapper">
		
		<%@include file="inc/spinner.jsp" %>
        <%@include file="inc/navbar.jsp" %>
        	
        	<%
        	ArrayList<MovieSlots> movieslots = (ArrayList<MovieSlots>) request.getAttribute("movieslots");
        	java.util.Set<Integer> visitedMallIDs = new java.util.HashSet<Integer>();
        	java.util.Set<Integer> visitedMovieSlots = new java.util.HashSet<Integer>();
        	SimpleDateFormat displaySlot = new SimpleDateFormat("EEE, dd MMMM yyyy");
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
                    	SimpleDateFormat daySlotFormat = new SimpleDateFormat("EEEE");
                    	SimpleDateFormat slotFormat = new SimpleDateFormat("dd MMMM yyyy");
                    	
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
			            String dateSlot = slotFormat.format(calendar.getTime());	
			            String daySlot = daySlotFormat.format(calendar.getTime());
			            
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
                                                <a type="button" class="btn-link text-decoration-none"  data-bs-toggle="modal" data-bs-target="#select-seat<%=movieslots.get(j).getMovieSlotID() %>">
                                                    <div class="pt-2">
                                                        <h5 class="mb-1"> <%= movieslots.get(j).getSlot() %></h5>
                                                        <hr
                                                            class="bg-warning bg-opacity-10 border border-warning border-start-0 rounded-end mx-5">
                                                        <p class="fs-sm text-muted mb-0">
                                                             <%= movieslots.get(j).getHallCategory() %> (<%= movieslots.get(j).getHallName() %>)
                                                        </p>
                                                    </div>
                                                    </a>
                                                    <!-- Modal -->
													<div class="modal fade" id="select-seat<%=movieslots.get(j).getMovieSlotID()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" >
													  <div class="modal-dialog">
													    <div class="modal-content px-0" style="position: fixed !important; top: auto; right: auto; left: 0; bottom: 0;">
													      <div class="modal-header border-0">
													        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
													        <button type="button" class="btn-close me-3" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <form action="/bsc/Seat">
													      <div class="modal-body text-center ">
													      
													      	
													        <h4 class="fw-bold"> <%= movieslots.get(j).getMovieTitle() %></h4>
													        <div class="text-center d-grid">
													        	<span class="text-muted">
													        		<%= movieslots.get(j).getHallCategory() %> - 
													        	
														        	<% if (movieslots.get(j).getMall() == 3 || movieslots.get(j).getMall() == 4){ %>
														        		Premier Class
														        	<%} else if (movieslots.get(j).getMall() == 5 || movieslots.get(j).getMall() == 6){ %>
														        		4D Experience Cinema
														        	<%} else {%>
														        		Digital 2D
														        	<%} %>
													        	</span>
													        	
													        	
													        	<span>
													        		<%= movieslots.get(j).getSlot() %>, <%= daySlot %>
													        	</span>
													        	<span>
													        		<%= dateSlot %>
													        	</span>
													       
													        	<br>
													        	<span>
														        	<%= movieslots.get(j).getMallName() %> 
														        	(<%= movieslots.get(j).getHallName() %>)
													        	</span>

													        </div>
													        <% if((int)session.getAttribute("role") != 0) {%>
														        <div class="form-group row mt-3 g-3">
														        	
														        	<div class="col-4 offset-4">
															        	<select name="user" class="form-select" >
																			<option value="-1, invalid" selected disabled><em>- Select Customer -</em></option>
																			
																		<%ArrayList<Users> userlist=  (ArrayList<Users>)request.getAttribute("userlist");
																			
																		for(Users user:userlist){%>
																			<option value="<%= user.getUserID() %>, <%= user.getName() %>">ID: <%= String.format("%04d", user.getUserID()) %> - <%= user.getName() %>  </option>
																		<%}%>
																		<option value="0, Guest"> <em>(Guest)</em></option>
																		</select>
														        	</div>
														        	<div class="col-4 offset-4">
														        		  <input class="form-control" type="text" value="" name="custEmail" placeholder="Customer's email">
														        	</div>	
														        	
														        			        	
														        </div>
													        <%} %>
													        
													        
													        <input type="hidden" name="movieSlotID" value="<%=movieslots.get(j).getMovieSlotID()%>">
													        <input type="hidden" name="movieID" value="<%=movieslots.get(j).getMovieID()%>">
													      
													      </div>
													      
													        <button type="submit" class="btn btn-secondary btn-lg bg-warning text-uppercase fw-bold btn-block mb-3	" >Select Seat</button>
													     </form>
													        
													    </div>
													  </div>
													</div>
                                                

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