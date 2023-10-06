<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bsc.beans.Users"%>
<%@page import="com.bsc.beans.Notifications"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html lang="en">
<head>

	<title>Black Screen Cinema</title>

    <%@include file="inc/header-links.jsp" %>

</head>

<!-- Body -->
<body>
	<%@include file="inc/navbar.jsp"%>

<main class="page-wrapper">
    <!-- Page content -->
    <section class="container pt-5">
      <div class="row">

		
        <!-- Sidebar (User info + Account menu) -->
        <%@include file="profile-aside.jsp"%>
        
        <!-- Account messages -->
        <div class="col-md-8 col-lg-9 pb-5 mb-lg-2 mb-lg-4 pt-md-5 mt-n3 mt-md-0">
          <div class="ps-md-3 mt-md-2 pt-md-4 pb-md-2">
            <div class="row g-0 border rounded-3 shadow-sm position-relative overflow-hidden">

              <div id="contactsList" class="col-lg-12">
                <div
                  class="offcanvas-lg offcanvas-start position-absolute position-lg-relative h-100 bg-secondary shadow-none border-end"
                  data-bs-scroll="true" data-bs-backdrop="false" style="max-height: 712px;">
                  <div class="card-header w-100 border-0 p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                      <h1 class="h3 mb-0">Notifications</h1>
                      <button type="button"
                        class="btn btn-link nav-link bg-faded-primary-hover d-lg-none py-2 ps-2 pe-3 me-n3"
                        data-bs-dismiss="offcanvas" data-bs-target="#contactsList">
                        <i class="bx bx-x fs-xl me-1"></i>
                        Close
                      </button>
                    </div>

                  </div>


                  <!-- Notifications Here -->

                  <div class="list-group">
                  <!-- Loop here -->
                      <% ArrayList<Notifications> notificationlist = (ArrayList<Notifications>)request.getAttribute("notificationlist");

                          for (Notifications notification:notificationlist){

                          %>

		                    <a href="#" class="list-group-item list-group-item-action " aria-current="true">
		                      <div class="d-flex w-100 justify-content-between">
		                        <h5 class="mb-1"> <%= notification.getTitle() %></h5>
		                        <small><%= notification.getDateTime() %></small>
		                      </div>
		                      <p class="mb-1"> <%= notification.getContent() %></p>
		                    
		                    </a>
		                  <%} %>

                  </div>

       

                </div>
              </div>


            </div>
          </div>
        </div>
      </div>
    </section>
</main>

	
					
					<!-- Vendor Scripts -->
					<script
						src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
					<script
						src="assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
					<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

					<!-- Main Theme Script -->
					<script src="assets/js/theme.min.js"></script>
				
					
</body>

</html>
