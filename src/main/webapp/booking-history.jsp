<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>

<%@page import="com.bsc.beans.Malls"%>
<%@page import="com.bsc.beans.Movies"%>
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
        <div class="row d-flex justify-content-center">

  
          


          <!-- Account collections -->
          <div class="col-md-11  pb-5 mb-lg-2 pt-md-5 mt-n3 mt-md-0">
            <div class="ps-md-3 ps-lg-0  ">
              <div class="d-sm-flex align-items-center justify-content-between mb-3 pb-3">
                <h1 class="h2 mb-sm-0">My Movies</h1>
                
              </div>

              
              <!-- Item -->
              <div class="card border-0 shadow-sm overflow-hidden mb-4">
                <div class="row g-0">
                  <a href="#" class="col-sm-3 bg-repeat-0 bg-position-center bg-size-cover" style="background-image: url(https://kakimuvee.net/wp-content/uploads/2023/05/350459467_6210333149047026_4053920908481757867_n-edited.jpg); min-height: 13rem;"></a>
                  <div class="col-sm-8">
                    <div class="card-body">
                      <div class="fs-sm text-muted mb-1">Nov 30, 2021 (Release Date)</div>
                      <h2 class="h4 pb-1 mb-2">
                        <a href="#">Malbatt Misi Bakara (Movie Title)</a>
                      </h2>
                      <p class="mb-4 mb-lg-5">Wed 06 Sep | 8.25 pm | Hall 6</p>
                      <div class="d-flex">
                        <button type="button" class="btn btn-outline-primary px-3 px-lg-4 me-3">
                          <i class="bx bx-edit fs-xl me-xl-2"></i>
                          <span class="d-none d-xl-inline">View</span>
                        </button>
                        <button type="button" class="btn btn-outline-danger px-3 px-lg-4">
                          <i class="bx bx-trash-alt fs-xl me-xl-2"></i>
                          <span class="d-none d-xl-inline">Appeal Refund</span>
                        </button>
                      </div>
                    </div>
                  </div>
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