<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.bsc.beans.Users"%>
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
	<%@include file="inc/navbar.jsp"%>
	
	<!-- Page content -->
      <section class="container pt-5">
        <div class="row">

         <!-- Sidebar (User info + Account menu) -->
         <%@include file="profile-aside.jsp"%>

          <!-- Account details -->
          <div class="col-md-8 offset-lg-1 pb-5 mb-2 mb-lg-4 pt-lg-5 mt-md-0" >
            <div class="ps-md-3 ps-lg-0 mt-md-2 pb-md-4 pt-lg-5 mt-5">
              <h1 class="h2 pb-3">Account Details</h1>

              <!-- Basic info -->
              <h2 class="h5 text-warning mb-4">Basic info</h2>
              
              <% 
              Users user = (Users) request.getAttribute("user");  
              int userID = (int) session.getAttribute("id"); 
              int role = (int) session.getAttribute("role"); 
              String userLabel = null; %>
              
              <form class="needs-validation border-bottom pb-3 pb-lg-4"  action="/bsc/Profile" method="POST"  novalidate>
                <div class="row pb-2">
                  <div class="col-sm-6 mb-4">
                    <label for="fn" class="form-label fs-base">
                    	<% if (role != 0) { 
                    		userLabel = "ST";%>
                    		Staff
                    	<%} else { 
                    		userLabel = "CS";%>
                    		Customer
                    	<%} %>
                     ID</label>
                    <input type="text" id="fn" name="name" class="form-control form-control-lg text-start" value="

                    <%= String.format("%S%04d", userLabel.trim(), userID) %>" readonly>

                  </div>
                  
                  <div class="col-sm-6 mb-4">
                    <label for="fn" class="form-label fs-base">Full name</label>
                    <input type="text" id="fn" name="name" class="form-control form-control-lg" value="<%= user.getName() %>" required>
                    <div class="invalid-feedback">Please enter your first name!</div>
                  </div>
               
                  <div class="col-sm-6 mb-4">
                    <label for="email" class="form-label fs-base">Email address</label>
                    <input type="email" id="email" name="email" class="form-control form-control-lg" value=<%= user.getEmail() %> required>
                    <div class="invalid-feedback">Please provide a valid email address!</div>
                  </div>
                  <div class="col-sm-6 mb-4">
                    <label for="phone" class="form-label fs-base">Phone <small class="text-muted">(optional)</small></label>
                    <input type="text" id="phone" name="phone" class="form-control form-control-lg" data-format='{"numericOnly": true, "delimiters": ["+60 ", " ", " "], "blocks": [0, 3, 3, 2]}' value="<%= user.getPhone()%>">
                  </div>
                  
                </div>
                <div class="d-flex mb-3">
                  <a href="/bsc/Profile" class="btn btn-secondary me-3">Cancel</a>
                  <button type="submit" class="btn btn-warning">Save changes</button>
                </div>
              </form>

            </div>
          </div>
        </div>
      </section>
	</main>

	<%@include file="inc/top-btn.jsp"%>
	<%@include file="inc/footer.jsp"%>
	<%@ include file="inc/footer-links.jsp" %>
</body>
</html>