<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList, java.text.SimpleDateFormat, java.util.Calendar, java.util.Date" %>


<%@page import="com.bsc.beans.Malls"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=0.9">
<title>Add Mall</title>

	<!-- Favicon and Touch Icons -->
	<link rel="icon" href="assets/favicon/logobsc.ico">
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

<%@include file="inc/spinner.jsp"%>
<%@include file="inc/navbar.jsp"%>
	<section class="container text-center pt-2 mt-2 mt-md-4">			
		<h2 class="h5 pt-2 pt-lg-0"> Manage Mall </h2>
		
		<!-- Button trigger modal -->
		<div class="d-flex justify-content-end">
		<button type="button" class="btn btn-warning btn-sm me-1" data-bs-toggle="modal"
			data-bs-target="#exampleModal"><i class="bx bx-movie"></i>Add Mall</button>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog ">
				<div class="modal-content ">
					<div class="modal-header">
						<h1 class="modal-title fs-5 " id="exampleModalLabel">Mall Details</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					
					<!-- Form -->
					<form class="text-start" action="/bsc/AddMall" method="post">
					<div class="modal-body">
						<div class="mb-3" >
							<label for="exampleFormControlInput1" class="form-label">MallName</label> 
							<input name="MallName" type="text" class="form-control" placeholder="3 Damansara Shopping Mall"
								id="exampleFormControlInput1" >
						</div>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label">Address</label>
							<input name="Address" class="form-control" id="exampleFormControlTextarea1" placeholder="3 Lebuhraya Damansara Puchong 47400 Sungai Buloh Selangor."
								rows="3"></input>
						</div>
					</div>
					<!--  -->
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-warning">Submit</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	
	<table class="table table-bordered table-hover mt-2 align-middle">
		<thead class="bg-success ">
			<tr>
				<th >Mall ID</th>
				<th >Mall Name</th>
				<th >Address</th>
		</thead>
		<tbody class="bg-black">
			
				<% ArrayList<Malls> malls = (ArrayList<Malls>) request.getAttribute("malls"); %>
				<%
				for (int i = 0; i < malls.size(); i++) {
					
				%>
				<tr>
						<th ><%=malls.get(i).getMallID() %></th>
						<td><%=malls.get(i).getMallName() %></td>
						<td><%=malls.get(i).getAddress()%></td>
						
				</tr>
	
				<%}%>
				

			
			
		</tbody>
	</table>
	</section>
	
	
	
		<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

	<!-- Main Theme Script -->
	<script src="assets/js/theme.min.js"></script>
</body>
</html>