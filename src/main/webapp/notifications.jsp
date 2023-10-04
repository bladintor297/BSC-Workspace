<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bsc.beans.Users"%>
<%@page import="com.bsc.beans.Notifications"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Black Screen Cinema</title>

<!-- SEO Meta Tags -->
<meta name="description"
	content="Silicon - Multipurpose Technology Bootstrap Template">
<meta name="keywords"
	content="bootstrap, business, creative agency, mobile app showcase, saas, fintech, finance, online courses, software, medical, conference landing, services, e-commerce, shopping cart, multipurpose, shop, ui kit, marketing, seo, landing, blog, portfolio, html5, css3, javascript, gallery, slider, touch, creative">
<meta name="author" content="Createx Studio">

<!-- Viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon and Touch Icons -->
<link rel="icon" href="assets/favicon/logobsc.ico">
<meta name="msapplication-TileColor" content="#080032">
<meta name="msapplication-config"
	content="assets/favicon/browserconfig.xml">
<meta name="theme-color" content="#ffffff">

<!-- Vendor Styles -->
<link rel="stylesheet" media="screen"
	href="assets/vendor/boxicons/css/boxicons.min.css" />
<link rel="stylesheet" media="screen"
	href="assets/vendor/swiper/swiper-bundle.min.css" />

<!-- Main Theme Styles + Bootstrap -->
<link rel="stylesheet" media="screen" href="assets/css/theme.min.css">

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
							<div
								class="d-table position-relative mx-auto mt-2 mt-lg-4 pt-5 mb-3">
								<img src="assets/img/account/baam.png"
									class="d-block rounded-circle"
									style="height: 150px; width: 150px; object-fit: cover;"
									alt="John Doe">
								<button type="button"
									class="btn btn-icon btn-light bg-white btn-sm border rounded-circle shadow-sm position-absolute bottom-0 end-0 mt-4"
									data-bs-toggle="tooltip" data-bs-placement="bottom"
									title="Change picture">
									<i class="bx bx-refresh"></i>
								</button>
							</div>
							<h2 class="h5 mb-1">Baam Hensem</h2>
							<p class="mb-3 pb-3">baamhensem@email.com</p>
							<button type="button"
								class="btn btn-secondary w-100 d-md-none mt-n2 mb-3"
								data-bs-toggle="collapse" data-bs-target="#account-menu">
								<i class="bx bxs-user-detail fs-xl me-2"></i> Account menu <i
									class="bx bx-chevron-down fs-lg ms-1"></i>
							</button>
							<div id="profile.jsp"
								class="list-group list-group-flush collapse d-md-block">
								<a href="account-details.html"
									class="list-group-item list-group-item-action d-flex align-items-center">
									<i class="bx bx-cog fs-xl opacity-60 me-2"></i> Account Details
								</a> <a href="profile.jsp"
									class="list-group-item list-group-item-action d-flex align-items-center">
									<i class="bx bx-lock-alt fs-xl opacity-60 me-2"></i> Password
								</a> <a href="profile.jsp"
									class="list-group-item list-group-item-action d-flex align-items-center active">
									<i class="bx bx-bell fs-xl opacity-60 me-2"></i> Notifications
								</a> <a href="Logout.java"
									class="list-group-item list-group-item-action d-flex align-items-center">
									<i class="bx bx-log-out fs-xl opacity-60 me-2"></i> Sign Out
								</a>
							</div>
						</div>
					</div>
				</aside>


				<!-- Account messages -->
				<div
					class="col-md-8 col-lg-9 pb-5 mb-lg-2 mb-lg-4 pt-md-5 mt-n3 mt-md-0">
					<div class="ps-md-3 mt-md-2 pt-md-4 pb-md-2">
						<div
							class="row g-0 border rounded-3 shadow-sm position-relative overflow-hidden">

							<!-- Contacts list -->
							<div id="contactsList" class="col-lg-12">
								<div
									class="offcanvas-lg offcanvas-start position-absolute position-lg-relative h-100 bg-secondary shadow-none border-end"
									data-bs-scroll="true" data-bs-backdrop="false"
									style="max-height: 712px;">
									<div class="card-header w-100 border-0 p-4">
										<div
											class="d-flex align-items-center justify-content-between mb-4">
											<h1 class="h3 mb-0">Notifications</h1>
											<button type="button"
												class="btn btn-link nav-link bg-faded-primary-hover d-lg-none py-2 ps-2 pe-3 me-n3"
												data-bs-dismiss="offcanvas" data-bs-target="#contactsList">
												<i class="bx bx-x fs-xl me-1"></i> Close
											</button>
										</div>
										
									</div>
									<div id="contactsContainer"
										class="card-body swiper scrollbar-hover overflow-hidden w-100 p-0"
										data-swiper-options='{
						      "direction": "vertical",
						      "slidesPerView": "auto",
						      "freeMode": true,
						      "scrollbar": {
						        "el": ".swiper-scrollbar"
						      },
						      "mousewheel": true
						    }'>
										<div class="swiper-wrapper"></div>
										<div class="swiper-scrollbar end-0"></div>
									</div>
								</div>
							</div>

							<!-- Contact -->
				


					<%@include file="inc/top-btn.jsp"%>

					<!-- Vendor Scripts -->
					<script
						src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
					<script
						src="assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
					<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>


					<!-- Notifications Here -->

					<div class="list-group">
						<!-- Loop here -->
						<%ArrayList<Notifications> notificationlist = (ArrayList<Notifications>) request.getAttribute("notificationlist");
						for (Notifications notification : notificationlist) {
						%>

						<a href="#" class="list-group-item list-group-item-action "
							aria-current="true">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="mb-1">
									<%=notification.getTitle()%></h5>
								<small><%=notification.getDateTime()%></small>
							</div>
							<p class="mb-1">
								<%=notification.getContent()%></p>

						</a>
						<%
						}
						%>

					</div>


					<!-- Back to top button -->
					<a href="#top" class="btn-scroll-top" data-scroll> <span
						class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span> <i
						class="btn-scroll-top-icon bx bx-chevron-up"></i>
					</a>


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