<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>

<%@page import="com.bsc.beans.Malls"%>
<%@page import="com.bsc.beans.Movies"%>
<%@page import="com.bsc.beans.Bookings"%>

<!DOCTYPE html><html lang="en">
	<head>
	<meta charset="utf-8">
	<title>Black Screen Cinema</title>
	<%@include file="inc/header-links.jsp"%>
	
</head>


<!-- Body -->
<body>
<main class="page-wrapper">
	
	<%@include file="inc/navbar.jsp"%>


	<!-- Page content -->
      <section class="container pt-5">
        <div class="row d-flex justify-content-center">

  

          <!-- Account collections -->
          <div class="col-md-11  pb-5 mb-lg-2 mt-n3 mt-md-0">
            <div class="ps-md-3 ps-lg-0  ">
              <div class="d-sm-flex align-items-center justify-content-center mb-3 pb-3">
                <h1 class="h2 mb-sm-0">My Movies</h1>
              </div>
              <div class="d-flex justify-content-between">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
					  <li class="nav-item" role="presentation">
					    <a class="nav-link rounded-pill px-5 active" id="ongoing-tab" data-bs-toggle="tab" data-bs-target="#ongoing" type="button" role="tab" aria-controls="ongoing" aria-selected="true">Ongoing</a>
					  </li>
					  <li class="nav-item" role="presentation">
					    <a class="nav-link rounded-pill px-5 " id="history-tab" data-bs-toggle="tab" data-bs-target="#history" type="button" role="tab" aria-controls="history" aria-selected="false">History</a>
					  </li>
	
					</ul>
					<div>
						<button class="btn btn-danger"><i class='bx bxs-file-pdf'></i> &nbsp;&nbsp;  Generate Report</button>
					</div>
				</div>


				
				
				<%
				ArrayList<Bookings> ongoinglist = (ArrayList<Bookings>)request.getAttribute("ongoinglist");
				ArrayList<Bookings> historylist = (ArrayList<Bookings>)request.getAttribute("historylist");
			   	SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			   	SimpleDateFormat outputDateFormat = new SimpleDateFormat("d MMMM, yyyy");
				%>
				<div class="tab-content">
				  <div class="tab-pane active" id="ongoing" role="tabpanel" aria-labelledby="ongoing-tab">
				  
				   	
				   	<% for (Bookings booking:ongoinglist){%>
				    <!-- Item -->
		              <div class="card border-0 shadow-sm overflow-hidden mb-4">
		                <div class="row g-0">
		                <a href="#" class="col-sm-3 bg-repeat-0 bg-position-center bg-size-cover" style="background-image: url(<%= booking.getImagePortrait() %>); min-height: 13rem;">
					      <span class="badge badge-success position-absolute top-0 end-0 zindex-5">New</span>
					    </a>
		                 
		                  <div class="col-sm-9">
		                      <!-- Ticket card -->
					            <div class="ms-2 position-relative">
					              <div class="position-relative overflow-hidden rounded-3 zindex-5  p-sm-5 bg-ticket">
					                <span class="position-absolute top-50 start-0 translate-middle bg-light rounded-circle p-4"></span>
					                <span class="position-absolute top-0 start-0 w-100 h-100 bg-repeat-0 bg-position-center-end bg-size-cover" style="background-image: url(assets/img/landing/conference/price-card-pattern.png);"></span>
					                <div class="px-md-4 position-relative zindex-5">
					                  <div class="d-sm-flex align-items-start justify-content-between">
					                    <div class="text-center text-sm-start me-sm-4">
					                      <div class="h5 fst-italic fw-semibold text-light text-uppercase mb-1"><%= outputDateFormat.format(inputDateFormat.parse(booking.getBookingDate())) %></div>
					                      <h3 class="h2 text-light"><%= booking.getTitle() %></h3>
					                      <p class="text-muted pb-0 mb-0"><%= booking.getSlot() %> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 
					                      <%=booking.getSeat() %>  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 
					                      <%=booking.getHall()%>  
					                      </p>
					                      <p class="text-muted pt-0 mt-0"><%= booking.getMall() %></p>
					                      <p class="text-light pt-0 mt-0"><%= booking.getCustName() %> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <%= booking.getCustEmail() %></p>
					                      
					                      
					                    </div>
					                    <div class="d-table bg-white rounded-3 p-4 flex-shrink-0 mx-auto mx-sm-0">
					                      <img src="assets/img/landing/conference/qr.png" width="102" alt="QR Code">
					                      
					                    </div>
					                  </div>
					                  <div class="d-flex flex-column flex-sm-row align-items-center ">
					                    <a class="btn btn-secondary rounded-pill btn-lg mb-3 mb-sm-0 me-sm-3 px-5">
					                    	RM<%= String.format("%.2f", booking.getAmount() )%>
					                    </a>
					                    <div class="d-flex align-items-center">
					                      <span class="fs-lg text-light me-2"></span>
					                    </div>
					                  </div>
					                </div>
					                <span class="position-absolute top-50 end-0 translate-middle-y bg-light rounded-circle p-4 me-n4"></span>
					              </div>
					              
					            </div>
		                    
		                  </div>
		                </div>
		              </div>
		              <%} %>
				  </div>
				  <div class="tab-pane" id="history" role="tabpanel" aria-labelledby="history-tab">
				   	<% for (Bookings booking:historylist){%>
				    <!-- Item -->
		              <div class="card border-0 shadow-sm overflow-hidden mb-4">
		                <div class="row g-0">
		                <a href="#" class="col-sm-3 bg-repeat-0 bg-position-center bg-size-cover" style="background-image: url(<%= booking.getImagePortrait() %>); min-height: 13rem;">
					      <span class="badge badge-success position-absolute top-0 end-0 zindex-5">New</span>
					    </a>
		                 
		                  <div class="col-sm-9">
		                      <!-- Ticket card -->
					            <div class="ms-2 position-relative">
					              <div class="position-relative overflow-hidden rounded-3 zindex-5  p-sm-5 bg-ticket-history">
					                <span class="position-absolute top-50 start-0 translate-middle bg-light rounded-circle p-4"></span>
					                <span class="position-absolute top-0 start-0 w-100 h-100 bg-repeat-0 bg-position-center-end bg-size-cover" style="background-image: url(assets/img/landing/conference/price-card-pattern.png);"></span>
					                <div class="px-md-4 position-relative zindex-5">
					                  <div class="d-sm-flex align-items-start justify-content-between">
					                    <div class="text-center text-sm-start me-sm-4">
					                      <div class="h5 fst-italic fw-semibold text-light text-uppercase mb-1"><%= outputDateFormat.format(inputDateFormat.parse(booking.getBookingDate())) %></div>
					                      <h3 class="h2 text-light"><%= booking.getTitle() %></h3>
					                      <p class="text-muted pb-0 mb-0"><%= booking.getSlot() %> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 
					                      <%=booking.getSeat() %>  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 
					                      <%=booking.getHall()%>  
					                      </p>
					                      <p class="text-muted pt-0 mt-0"><%= booking.getMall() %></p>
					                      <p class="text-light pt-0 mt-0"><%= booking.getCustName() %> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <%= booking.getCustEmail() %></p>
					                      
					                    </div>
					                    <div class="d-table bg-white rounded-3 p-4 flex-shrink-0 mx-auto mx-sm-0">
					                      <img src="assets/img/landing/conference/qr.png" width="102" alt="QR Code" style="opacity: 0.8; filter: grayscale(100%);">
					                    </div>
					                  </div>
					                  <div class="d-flex flex-column flex-sm-row align-items-center ">
					                    <a class="btn btn-secondary rounded-pill btn-lg mb-3 mb-sm-0 me-sm-3 px-5">
					                    	RM<%= String.format("%.2f", booking.getAmount() )%>
					                    </a>
					                    <div class="d-flex align-items-center">
					                      <span class="fs-lg text-light me-2">
					                      	<span class="fs-lg text-light me-2"></span>
					                      </span>

					                    </div>
					                  </div>
					                </div>
					                <span class="position-absolute top-50 end-0 translate-middle-y bg-light rounded-circle p-4 me-n4"></span>
					              </div>
					              
					            </div>
		                    
		                  </div>
		                </div>
		              </div>
		              <%} %>
				  </div>
				</div>
              	
            </div>
          </div>
        </div>
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