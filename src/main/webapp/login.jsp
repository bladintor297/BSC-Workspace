<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Sign Up</title>
	
	<!-- SEO Meta Tags -->
	<meta name="description" content="Silicon - Multipurpose Technology Bootstrap Template">
	<meta name="keywords" content="bootstrap, business, creative agency, mobile app showcase, saas, fintech, finance, online courses, software, medical, conference landing, services, e-commerce, shopping cart, multipurpose, shop, ui kit, marketing, seo, landing, blog, portfolio, html5, css3, javascript, gallery, slider, touch, creative">
	<meta name="author" content="Createx Studio">
	
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
	
	
	<script src="assets/js/function.js"></script>

</head>


	<!-- Body -->
	<body>
	
		<%@include file="inc/spinner.jsp"%>
		
		<main class="page-wrapper">
	
	      <!-- Page content -->
	      <section class="position-relative h-100 pt-5 pb-4">
	      
	     <div class="m-3">
	      Email: <%= session.getAttribute("email") %> <br>
	      Name: <%= session.getAttribute("name") %> <br>
	      Phone: <%= session.getAttribute("phone") %>
	     </div>
	        <!-- Sign in form -->
	        <div class="container d-flex flex-wrap justify-content-center justify-content-xl-start h-100 pt-5">
	          <div class="position-absolute top-0 end-0 w-50 h-100 bg-position-center bg-repeat-0 bg-size-cover d-none d-xl-block" style="background-image: url(assets/img/account/signin.png);"></div>
	
	          <div class="w-100 align-self-end pt-1 pt-md-4 pb-4" style="max-width: 526px;">
	            <h1 class="text-center text-xl-start">Welcome Back</h1>
	            <p class="text-center text-xl-start pb-3 mb-3">New to Black Screen Cinema? <a href="register.jsp" class="text-warning">Register here.</a></p>
	            <form class="needs-validation mb-2" action="/bsc/Login" method="POST" novalidate>
	              <div class="position-relative mb-4">
	                <label for="email" class="form-label fs-base">Email</label>
	                <input type="email" id="email" name="email" class="form-control form-control-lg" required>
	                <div class="invalid-feedback position-absolute start-0 top-100">Please enter a valid email address!</div>
	              </div>
	              <div class="mb-4">
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
	              <div class="mb-4">
	                <div class="form-check">
	                  <input type="checkbox" id="remember" class="form-check-input">
	                  <label for="remember" class="form-check-label fs-base">Remember me</label>
	                </div>
	              </div>
	              <button type="submit" class="btn btn-warning shadow-warning btn-lg w-100">Sign in</button>
	            </form>
	            <a href="#" class="btn btn-link btn-lg w-100 text-warning">Forgot your password?</a>
	            <hr class="my-4">
	            
	          </div>
	          
	        </div>
	        
	        <!-- Background -->
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