<!-- Navbar -->
<!-- Remove "navbar-sticky" class to make navigation bar scrollable with the page -->
<header class="header navbar navbar-expand-lg bg-dark navbar-sticky shadow shadow-sm shadow-white">
	<div class="container ps-3">
		<a href="/bsc/Welcome" class="navbar-brand pe-1"> <img src="assets/img/logonew.png" width="100"
				alt="Black Screen Cinema"></a>
		<div id="navbarNav" class="offcanvas offcanvas-end">
			<% if (session !=null && session.getAttribute("email") !=null) { %>
				<div class="offcanvas-header border-bottom">
					<h5 class="offcanvas-title">Menu</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a href="/bsc/Welcome" id="home" class="nav-link active navigation">Home</a></li>
						<li class="nav-item me-1">
							<a href="/bsc/Booking" id="booking" class="nav-link navigation">Bookings</a>
						</li>
						
						
						<% if ((int)session.getAttribute("role") != 0 ){ %>
						<li><a class="nav-link text-white"> | </a> </li>
						<li class="nav-item ms-1"><a href="/bsc/AddNewMovie" id="movie" class="nav-link navigation">Manage Movies</a></li>
							<%  if ((int)session.getAttribute("role") == 2 )  {%>
							<li class="nav-item"><a href="/bsc/AddMall" id="mall" class="nav-link navigation">Manage Mall</a></li>
							<li class="nav-item"><a href="/bsc/AddNewUser" id="users" class="nav-link navigation">Manage Users</a></li>
							<%} %>
						<%}%>
					</ul>
				</div>
				<div class="offcanvas-header border-top">

					<a href="/bsc/Profile" class="btn btn-warning w-100" target="_blank" rel="noopener">
						<i class="bx bx-cart fs-4 lh-1 me-1"></i> &nbsp;My Profile
					</a>
				</div>
		</div>

		<% if ((int)session.getAttribute("notificationCount") > 0) { %>
		<a href="/bsc/Notification" class="text-warning pt-2 me-2" style="font-size:1.5rem !important;">
		  <i class="fa-regular fa-bell fa-bounce" style="color: #ffb404;"></i>
		</a>
		<%} else { %>
		<a href="/bsc/Notification" class="text-warning pt-2 me-2" style="font-size:1.5rem !important;">
		  <i class="fa-regular fa-bell" style="color: #ffb404;"></i>
		</a>
		<%} %>
		<a href="/bsc/Profile" class="btn btn-warning btn-sm fs-sm rounded d-none d-lg-inline-flex " target="_self"
			rel="noopener">
			<i class='bx bxs-user-circle fs-5 lh-1 me-1'></i> &nbsp;My Profile
		</a>
		<a href="/bsc/Logout"
			class="btn btn-link text-warning btn-sm fs-sm rounded d-none d-lg-inline-flex ms-1 rounded-pill">
			<i class='bx bx-log-out  fs-5 lh-1 me-1 text-warning'></i>
		</a>
		<% } else {%>
			<div class="d-flex justify-content-end">
				<a href="/bsc/Login" class="btn btn-warning btn-sm fs-sm rounded d-none d-lg-inline-flex ms-2"
					target="_self" rel="noopener"> <i class='bx bxs-user-circle fs-5 lh-1 me-1'></i> &nbsp;Login
				</a>
			</div>

			<% } %>
	</div>
</header>

