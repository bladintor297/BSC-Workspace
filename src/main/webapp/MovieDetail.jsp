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
    
    <%@include file="inc/header-links.jsp" %>

</head>

<!-- Body -->
<body >

    <main class="page-wrapper" >
		
		<%@include file="inc/spinner.jsp" %>
        <%@include file="inc/navbar.jsp" %>
		
		<section class="position-relative pt-5 py-lg-5 mt-3 mt-md-4">

        <!-- Swiper tabs (Project images) -->
        <div class="swiper-tabs position-md-absolute top-0 end-0 w-md-50 h-100">
          <div id="project-1" class="swiper-tab position-md-absolute w-100 h-100 bg-position-center bg-repeat-0 bg-size-cover active" style="background-image: url(assets/img/portfolio/slider/01.jpg);">
          </div>
        </div>


        <div class="container pt-1 pt-lg-2">
          <div class="row">
            <div class="col-lg-5 col-md-6">
  
              <!-- Project description (Slider) -->
              <div class="d-none d-lg-block" style="height: 160px;"></div>
              <div class="d-none d-md-block d-lg-none" style="height: 80px;"></div>
              <div class="swiper pt-4 pt-md-0" data-swiper-options='{
                "spaceBetween": 30,
                "loop": true,
                "tabs": true,
                "pagination": {
                  "el": ".swiper-pagination",
                  "type": "fraction"
                },
                "navigation": {
                  "prevEl": ".btn-prev",
                  "nextEl": ".btn-next"
                }
              }'>
                <div class="swiper-wrapper">

                  <!-- Item -->
                  <div class="swiper-slide" data-swiper-tab="#project-1">
                    <h2 class="h1 mb-4"> </h2>
                    <p class="pb-3 mb-3">Proin odio elit fringilla pellentesque erat sapien, cursus id. Sed mi semper amet fringilla. Eget morbi arcu ac vestibulum sodales. Montes, integer lacinia amet tristique tincidunt.</p>
                    <table class="mb-5">
                      <tbody>
                        <tr>
                          <th class="text-dark fw-bold pb-2" scope="row">Client</th>
                          <td class="ps-3 ps-sm-4 pb-2">Createx Inc.</td>
                        </tr>
                        <tr>
                          <th class="text-dark fw-bold pb-2" scope="row">Category</th>
                          <td class="ps-3 ps-sm-4 pb-2">Graphic Design</td>
                        </tr>
                        <tr>
                          <th class="text-dark fw-bold pb-2" scope="row">Date</th>
                          <td class="ps-3 ps-sm-4 pb-2">29 November 2021</td>
                        </tr>
                      </tbody>
                    </table>
                    <a href="/bsc/Slot" class="btn btn-warning shadow-warning mt-n2">BUY NOW</a>
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