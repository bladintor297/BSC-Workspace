<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>

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
			<h2 class="h1 pt-2 pt-lg-0"> Movie Showtime </h2>
			
			<div class="row pb-lg-3 d-flex justify-content-center">
				<%
				Movies m = (Movies) request.getAttribute("movie");;
					if (m != null ) {
				%>
		
				<!-- Item -->
				<div class="col-md-3 ">
					<div class="card card-portfolio">
						<div class="card-img">
							<img
								src="<%= m.getImagePortrait() %>"
								alt="<%= m.getTitle() %>"
								style="height: 300px; width: 100%; object-fit: cover;">
						</div>
						<div class="card-body text-center">
							<h2 class="h4 mb-2">
								<a  class="stretched-link"><%= m.getTitle() %></a>
							</h2>
							<div class="card-portfolio-meta">
								<span class="text-muted"><%= m.getGenre().replace(", ", "/") %></span>
							</div>
						</div>
					</div>
				</div>
				
				<%} %>
				
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
				  <li class="nav-item d-grid" role="presentation">
				  
				  	<span><%= new java.text.SimpleDateFormat("E").format(new java.util.Date()) %></span>
				    <button class="nav-link active rounded-pill" id="day1-tab" data-bs-toggle="tab" data-bs-target="#day1" type="button" role="tab" aria-controls="day1" aria-selected="true">
				    	<span class="h4 p-2 my-auto"><%= new java.text.SimpleDateFormat("dd").format(new java.util.Date()) %></span>
				    </button>
				    <span class="text-uppercase fw-bold"><%= new java.text.SimpleDateFormat("MMM").format(new java.util.Date()) %></span>
				  </li>
				  
				  <li class="nav-item" role="presentation">
				  
				  <% 
				  java.util.Calendar calendar = java.util.Calendar.getInstance();
				  calendar.add(java.util.Calendar.DAY_OF_YEAR, 1); 
				  String day2 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
				  %>
				  
				  	<span><%= new java.text.SimpleDateFormat("E").format(calendar.getTime())%></span>
				    <button class="nav-link rounded-pill" id="day2-tab" data-bs-toggle="tab" data-bs-target="#day2" type="button" role="tab" aria-controls="day2" aria-selected="false">
				    	<span class="h4 p-2 my-auto"><%= new java.text.SimpleDateFormat("dd").format(calendar.getTime()) %></span>
				    </button>
				    <span class="text-uppercase fw-bold"><%= new java.text.SimpleDateFormat("MMM").format(calendar.getTime()) %></span>
				    
				  </li>
				  
				  <li class="nav-item" role="presentation">
				  
				  <% 
				  java.util.Calendar calendar2 = java.util.Calendar.getInstance();
				  calendar2.add(java.util.Calendar.DAY_OF_YEAR, 2);
				  String day3 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(calendar2.getTime());
				  %>
				  
				  	<span><%= new java.text.SimpleDateFormat("E").format(calendar2.getTime())%></span>
				    <button class="nav-link rounded-pill" id="day3-tab" data-bs-toggle="tab" data-bs-target="#day3" type="button" role="tab" aria-controls="day3" aria-selected="false">
				    	<span class="h4 p-2 my-auto"><%= new java.text.SimpleDateFormat("dd").format(calendar2.getTime()) %></span>
				    </button>
				    <span class="text-uppercase fw-bold"><%= new java.text.SimpleDateFormat("MMM").format(calendar2.getTime()) %></span>
				    
				  </li>
				  
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
		  		  <div class="tab-pane active" id="day1" role="tabpanel" aria-labelledby="day1-tab" tabindex="0">
				  	<div class="accordion-item border-0 mt-3">
					  
					  <%
					  	ArrayList<Malls> mall =  (ArrayList<Malls>)request.getAttribute("malls");
						
						for(Malls ml:mall){%>
						
						  	<h2 class="accordion-header">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= ml.getMallID() %>" aria-expanded="false" aria-controls="flush-collapse<%= ml.getMallID() %>">
						        <%= ml.getMallName() %>
						      </button>
						    </h2>
						    
							
						    <div id="flush-collapse<%= ml.getMallID() %>" class="accordion-collapse collapse show" data-bs-parent="#accordionFlushExample">
						      <div class="accordion-body">
						      	<div class="row">
						      	    <%
						      	    
						      	    
						      	    int count = 0;
						      	    ArrayList<MovieSlots> movieslot =  (ArrayList<MovieSlots>)request.getAttribute("movieslots");
						      	    
									
									for(MovieSlots ms:movieslot){
										if ((new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())).equals(ms.getDate())){%>
										
							            <div class="col-2 ">
							              <div class="position-relative text-center my-3 <% if (++count % 6 != 0) {%>border-end <%} %> mx-n1">
							                <a href="/bsc/seats.jsp" class="btn-link text-decoration-none">
								                 <div class="pt-4">
								                  <h5 class="mb-1"> <%= ms.getSlot() %></h5>
								                  <hr class="bg-warning bg-opacity-10 border border-warning border-start-0 rounded-end mx-5">
								                  <p class="fs-sm text-muted mb-0">
								                  <%
								                		  ArrayList<Halls> hall =  (ArrayList<Halls>)request.getAttribute("halls");
													
														for(Halls h:hall){
															if (h.getHallID() == ms.getHall()){ %>
																<%=  h.getCategory() %>
															<%	break;
															}
															
														}
								                  
								                  %>
								                  </p>
								                </div>
							                </a>
							                
							              </div>
							            </div>
							            <%}
							            
							            }%>
						      	</div> 	
						      </div>
						      
						    </div>
					    <%}%>
					    
					 </div>
					 
				  </div>
				  
				  
				  
				  
				  
				  <div class="tab-pane" id="day2" role="tabpanel" aria-labelledby="day2-tab" tabindex="0">
				  	<div class="accordion-item border-0 mt-3">
					  
					  <%
						
						for(Malls ml:mall){%>
						
						  	<h2 class="accordion-header">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= ml.getMallID() %>" aria-expanded="false" aria-controls="flush-collapse<%= ml.getMallID() %>">
						        <%= ml.getMallName() %>
						      </button>
						    </h2>
						    
							
						    <div id="flush-collapse<%= ml.getMallID() %>" class="accordion-collapse collapse show" data-bs-parent="#accordionFlushExample">
						      <div class="accordion-body">
						      	<div class="row">
						      	    <%
						      	    int count = 0;
						      	    ArrayList<MovieSlots> movieslot =  (ArrayList<MovieSlots>)request.getAttribute("movieslots");
						      	    
									
									for(MovieSlots ms:movieslot){
										if ((day2).equals(ms.getDate().toString())){%>
										
							            <div class="col-2 ">
							              <div class="position-relative text-center my-3 <% if (++count % 6 != 0) {%>border-end <%} %> mx-n1">
							                <a href="/bsc/seats.jsp" class="btn-link text-decoration-none">
								                 <div class="pt-4">
								                  <h5 class="mb-1"> <%= ms.getSlot() %></h5>
								                  <hr class="bg-warning bg-opacity-10 border border-warning border-start-0 rounded-end mx-5">
								                  <p class="fs-sm text-muted mb-0">
								                  <%
								                		  ArrayList<Halls> hall =  (ArrayList<Halls>)request.getAttribute("halls");
													
														for(Halls h:hall){
															if (h.getHallID() == ms.getHall()){ %>
																<%=  h.getCategory() %>
															<%	break;
															}
															
														}
								                  
								                  %>
								                  </p>
								                </div>
							                </a>
							                
							              </div>
							            </div>
							            <%}
							            
							            }%>
						      	</div> 	
						      </div>
						      
						    </div>
					    <%}%>
					    
					 </div>
				  </div>
				  
				  <div class="tab-pane" id="day3" role="tabpanel" aria-labelledby="day3-tab" tabindex="0">
				  	<div class="accordion-item border-0 mt-3">
					  
					  <%
						
						for(Malls ml:mall){%>
						
						  	<h2 class="accordion-header">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= ml.getMallID() %>" aria-expanded="false" aria-controls="flush-collapse<%= ml.getMallID() %>">
						        <%= ml.getMallName() %>
						      </button>
						    </h2>
						    
							
						    <div id="flush-collapse<%= ml.getMallID() %>" class="accordion-collapse collapse show" data-bs-parent="#accordionFlushExample">
						      <div class="accordion-body">
						      	<div class="row">
						      	    <%
						      	    int count = 0;
						      	    ArrayList<MovieSlots> movieslot =  (ArrayList<MovieSlots>)request.getAttribute("movieslots");
						      	    
									
									for(MovieSlots ms:movieslot){
										if ((day3).equals(ms.getDate().toString())){%>
										
							            <div class="col-2 ">
							              <div class="position-relative text-center my-3 <% if (++count % 6 != 0) {%>border-end <%} %> mx-n1">
							                <a href="/seats.jsp" class="btn-link text-decoration-none">
								                 <div class="pt-4">
								                  <h5 class="mb-1"> <%= ms.getSlot() %></h5>
								                  <hr class="bg-warning bg-opacity-10 border border-warning border-start-0 rounded-end mx-5">
								                  <p class="fs-sm text-muted mb-0">
								                  <%
								                		  ArrayList<Halls> hall =  (ArrayList<Halls>)request.getAttribute("halls");
													
														for(Halls h:hall){
															if (h.getHallID() == ms.getHall()){ %>
																<%=  h.getCategory() %>
															<%	break;
															}
															
														}
								                  
								                  %>
								                  </p>
								                </div>
							                </a>
							                
							              </div>
							            </div>
							            <%}
							            
							            }%>
						      	</div> 	
						      </div>
						      
						    </div>
					    <%}%>
					    
					 </div>
				  </div>
				  
			
		    
		  </div>
		  
		  
		</div>
		<!-- Tab panes -->
				
								 
				
				
								
			
		
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