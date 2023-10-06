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
						<li class="nav-item"><a href="/bsc/Welcome" class="nav-link active">Home</a></li>
						<li class="nav-item me-1">
							<a href="/bsc/Booking" class="nav-link">Bookings</a>
						</li>
						
						
						<% if ((int)session.getAttribute("role") != 0 ){ %>
						<li><a class="nav-link text-warning"> | </a> </li>
						<li class="nav-item ms-1"><a href="/bsc/AddNewMovie" class="nav-link">Manage Movies</a></li>
							<%  if ((int)session.getAttribute("role") == 1 )  {%>
							<li class="nav-item"><a href="#" class="nav-link">Manage Mall</a></li>
							<li class="nav-item"><a href="#" class="nav-link">Manage Staff</a></li>
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
	
		<a href="/bsc/Profile" class="btn btn-warning btn-sm fs-sm rounded d-none d-lg-inline-flex" target="_self"
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
<script>
$(document).ready(function() {
    // Get the current page URL
    var currentUrl = window.location.pathname;

    // Loop through all navigation links and remove the "active" class
    $('.nav-link').removeClass('active-link');

    // Find the link that matches the current URL and add the "active" class
    $('.nav-link').each(function() {
        var linkUrl = $(this).attr('href');
        if (currentUrl === linkUrl) {
            $(this).addClass('active-link');
        }
    });
});
</script>


