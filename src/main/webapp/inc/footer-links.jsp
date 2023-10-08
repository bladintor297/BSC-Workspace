
<script>
	document.addEventListener("DOMContentLoaded", function() {
		// Get the current URL to determine which tab should be active
		const currentURL = window.location.pathname;

		// Get all navigation links
		const links = document.querySelectorAll(".list-group-item");

		// Loop through the links and remove the 'active' class from all of them
		links.forEach(function(link) {
			link.classList.remove("active");
		});

		// Add the 'active' class to the link that matches the current URL
		links.forEach(function(link) {
			if (link.getAttribute("href") === currentURL) {
				link.classList.add("active");
			}
		});
	});
</script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		// Get the current URL to determine which tab should be active
		const currentURL = window.location.pathname;

		// Get all navigation links
		const links = document.querySelectorAll(".navigation");

		// Loop through the links and remove the 'active' class from all of them
		links.forEach(function(link) {
			link.classList.remove("active");
		});

		// Add the 'active' class to the link that matches the current URL
		links.forEach(function(link) {
			if (link.getAttribute("href") === currentURL) {
				link.classList.add("active");
			}
		});
	});
</script>



<!-- Vendor Scripts -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/lightgallery/lightgallery.min.js"></script>
<script src="assets/vendor/lightgallery/plugins/fullscreen/lg-fullscreen.min.js"></script>
<script src="assets/vendor/lightgallery/plugins/zoom/lg-zoom.min.js"></script>

<!-- Main Theme Script -->
<script src="assets/js/theme.min.js"></script>