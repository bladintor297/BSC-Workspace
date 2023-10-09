<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.bsc.beans.Users"%>

<!DOCTYPE html>
<html lang="en">
<head>

	<title>Black Screen Cinema</title>
	<%@include file="inc/header-links.jsp"%>
	
</head>


<!-- Body -->
<body>
<main class="page-wrapper">
	
	<%@include file="inc/navbar.jsp"%>
	

	<!-- Page content -->
      <section class="container pt-5">
        <div class="row">
          <!-- Sidebar (User info + Account menu) -->
          <%@include file="profile-aside.jsp"%>
          <%
			String invalidPasswordMessage = (String) request.getAttribute("invalidPasswordMessage");
			if (invalidPasswordMessage != null) {
			%>
			<script>
			    alert("<%= invalidPasswordMessage %>");
			</script>
		  <% } %>
		          
          <!-- Password -->
          <div class="col-md-8 offset-lg-1 pb-5 mb-2 mb-lg-4  mt-md-0">
            <div class="ps-md-3 ps-lg-0 mt-md-2 pb-md-4">
              <h1 class="h2 pb-3">Password</h1>

              <!-- Basic info -->
              <h2 class="h5 text-warning mb-4">Change Password</h2>
              
              <% 
              Users user = (Users) request.getAttribute("user");  %>
              

              <!-- Password -->
              <form class="needs-validation border-bottom pb-3 pb-lg-4" action="/bsc/ChangePassword" method="POST"  novalidate> 
                <div class="row">
                  <div class="col-sm-6 mb-4">
                    <label for="password" class="form-label fs-base">Password</label>
	                <div class="password-toggle">
	                  <input type="password" id="password"  name="password" class="form-control form-control-lg" required>
	                  <label class="password-toggle-btn" aria-label="Show/hide password">
	                    <input class="password-toggle-check" type="checkbox">
	                    <span class="password-toggle-indicator"></span>
	                  </label>
	                  <div class="invalid-feedback position-absolute start-0 top-100">Please enter your password!</div>
	                </div>
                  </div>
                </div>
                <div class="row pb-2">
                  <div class="col-sm-6 mb-4">
                    <label for="np" class="form-label fs-base">New password</label>
                    <div class="password-toggle">
                      <input type="password" name="np" id="np" class="form-control form-control-lg" required>
                      <label class="password-toggle-btn" aria-label="Show/hide password">
                        <input class="password-toggle-check" type="checkbox">
                        <span class="password-toggle-indicator"></span>
                      </label>
                      <div class="invalid-tooltip position-absolute top-100 start-0">Incorrect password!</div>
                    </div>
                  </div>
                  <div class="col-sm-6 mb-4">
                    <label for="cnp" class="form-label fs-base">Confirm new password</label>
                    <div class="password-toggle">
                      <input type="password" name="cnp" id="cnp" class="form-control form-control-lg" required>
                      <label class="password-toggle-btn" aria-label="Show/hide password">
                        <input class="password-toggle-check" type="checkbox">
                        <span class="password-toggle-indicator"></span>
                      </label>
                      <div class="invalid-tooltip position-absolute top-100 start-0">Incorrect password!</div>
                    </div>
                  </div>
                </div>
                <div class="d-flex mb-3">
                  <a href="/bsc/ChangePassword" class="btn btn-secondary me-3">Cancel</a>
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