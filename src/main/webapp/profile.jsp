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
          <div class="col-md-8 offset-lg-1 pb-5 mb-2 mb-lg-4  mt-md-0">
            <div class="ps-md-3 ps-lg-0 mt-md-2 pb-md-4">
              <h1 class="h2 pb-3">Account Details</h1>

              <!-- Basic info -->
              <h2 class="h5 text-warning mb-4">Basic info</h2>
              
              <% 
              Users user = (Users) request.getAttribute("user");  %>
              
              <form class="needs-validation border-bottom pb-3 pb-lg-4"  action="/bsc/Profile" method="POST"  novalidate>
                <div class="row pb-2">
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
                  <button type="reset" class="btn btn-secondary me-3">Cancel</button>
                  <button type="submit" class="btn btn-warning">Save changes</button>
                </div>
              </form>


              <!-- Delete account -->
              <h2 class="h5 text-primary pt-1 pt-lg-3 mt-4">Delete account</h2>
              <p>When you delete your account, your public profile will be deactivated immediately. If you change your mind before the 14 days are up, sign in with your email and password, and we will send you a link to reactivate your account.</p>
              <div class="form-check mb-4">
                <input type="checkbox" id="delete-account" class="form-check-input">
                <label for="delete-account" class="form-check-label fs-base">Yes, I want to delete my account</label>
              </div>
              <button type="button" class="btn btn-danger">Delete</button>
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