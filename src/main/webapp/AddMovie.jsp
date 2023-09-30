<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Movie</title>

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
<body>

	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Movie ID</th>
				<th>Cinema Hall Name</th>
				<th>Movie Slot</th>
				<th>Place</th>
				<th>Status</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>123456</td>
				<td><select name="cinema_hall_name">
					<option value="">Select a cinema hall</option>
					<option value="Cinema Hall 1">Cinema Hall 1</option>
					<option value="Cinema Hall 2">Cinema Hall 2</option>
				</select>
				</td>
				<td><select name="movie_slot">
						<option value="">Select a movie slot</option>
						<option value="12:00 PM">12:00 PM</option>
						<option value="2:00 PM">2:00 PM</option>
						<option value="4:00 PM">4:00 PM</option>
				</select>
				<td><input type="checkbox" name="movie_place[]" value="Midvalley">
					Midvalley <input type="checkbox" name="movie_place[]" value="IOI City mall">
					IOI City mall <input type="checkbox" name="movie_place[]" value="KLCC">
					KLCC >
					<select name="movie_place">
						<option value="">Select a movie slot</option>
						<option value="12:00 PM">12:00 PM</option>
						<option value="2:00 PM">2:00 PM</option>
						<option value="4:00 PM">4:00 PM</option>
				</select></td>
				<td></td>
				<td>
					<button class="btn btn-primary">Add</button>
					<button class="btn btn-danger">Delete</button>
				</td>
			</tr>
		</tbody>
	</table>
	</table>
	
		<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

	<!-- Main Theme Script -->
	<script src="assets/js/theme.min.js"></script>
</body>
</html>