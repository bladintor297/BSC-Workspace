<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.bsc.beans.Users"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<title>Black Screen Cinema</title>
	
	<!-- Viewport -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Favicon and Touch Icons -->
<link rel="apple-touch-icon" sizes="180x180" href="assets/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="assets/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="assets/favicon/favicon-16x16.png">
<link rel="manifest" href="assets/favicon/site.webmanifest">
<link rel="mask-icon" href="assets/favicon/safari-pinned-tab.svg" color="#6366f1">
<link rel="shortcut icon" href="assets/favicon/favicon.ico">
<meta name="msapplication-TileColor" content="#080032">
<meta name="msapplication-config" content="assets/favicon/browserconfig.xml">
<meta name="theme-color" content="#ffffff">

<!-- Vendor Styles -->
<link rel="stylesheet" media="screen" href="assets/vendor/boxicons/css/boxicons.min.css" />

<!-- Main Theme Styles + Bootstrap -->
<link rel="stylesheet" media="screen" href="assets/css/theme.min.css">
<link rel="stylesheet" media="screen" href="assets/css/style.css">

<script></script>
<script src="assets/js/function.js"></script>


</head>


<!-- Body -->
<body>
<main class="page-wrapper">
	
	<%@include file="inc/navbar.jsp"%>
	

	<!-- Page content -->
      <section class="container pt-5">
        <div class="row">
        <!-- Sidebar (User info + Account menu) -->
          <aside class="col-lg-3 col-md-4 border-end pb-5 mt-n5">
            <div class="position-sticky top-0">
              <div class="text-center pt-5">
                <div class="d-table position-relative mx-auto mt-2 mt-lg-4 pt-5 mb-3">
                  <img src="assets/img/account/baam.png" class="d-block rounded-circle" style="height: 150px; width: 150px; object-fit: cover;" alt="John Doe">
                  <button type="button" class="btn btn-icon btn-light bg-white btn-sm border rounded-circle shadow-sm position-absolute bottom-0 end-0 mt-4" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Change picture">
                    <i class="bx bx-refresh"></i>
                  </button>
                </div>
                <h2 class="h5 mb-1">Baam Hensem</h2>
                <p class="mb-3 pb-3">baamhensem@email.com</p>
                <button type="button" class="btn btn-secondary w-100 d-md-none mt-n2 mb-3" data-bs-toggle="collapse" data-bs-target="#account-menu">
                  <i class="bx bxs-user-detail fs-xl me-2"></i>
                  Account menu
                  <i class="bx bx-chevron-down fs-lg ms-1"></i>
                </button>
                <div id="profile.jsp" class="list-group list-group-flush collapse d-md-block">
                  <a href="account-details.html" class="list-group-item list-group-item-action d-flex align-items-center">
                    <i class="bx bx-cog fs-xl opacity-60 me-2"></i>
                    Account Details
                  </a>
                  <a href="profile.jsp" class="list-group-item list-group-item-action d-flex align-items-center  active">
                    <i class="bx bx-lock-alt fs-xl opacity-60 me-2"></i>
                    Password
                  </a>
                  <a href="profile.jsp" class="list-group-item list-group-item-action d-flex align-items-center">
                    <i class="bx bx-bell fs-xl opacity-60 me-2"></i>
                    Notifications
                  </a>             
                  <a href="Logout.java" class="list-group-item list-group-item-action d-flex align-items-center">
                    <i class="bx bx-log-out fs-xl opacity-60 me-2"></i>
                    Sign Out
                  </a>
                </div>
              </div>
            </div>
          </aside>
          
          
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
                    <label for="cp" class="form-label fs-base">Current password</label>
                    <div class="password-toggle">
                      <input type="password" id="cp" name="cp" class="form-control form-control-lg" required>
                      <label class="password-toggle-btn" aria-label="Show/hide password">
                        <input class="password-toggle-check" type="checkbox">
                        <span class="password-toggle-indicator"></span>
                      </label>
                      <div class="invalid-tooltip position-absolute top-100 start-0">Incorrect password!</div>
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
                  <button type="reset" class="btn btn-secondary me-3">Cancel</button>
                  <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
              </form>
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