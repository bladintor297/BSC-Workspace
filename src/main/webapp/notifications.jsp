<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bsc.beans.Users"%>
<%@page import="com.bsc.beans.Notifications"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html lang="en">
<head>	

	<title>Black Screen Cinema</title>

    <%@include file="inc/header-links.jsp" %>

</head>

<!-- Body -->
<body>
	<%@include file="inc/navbar.jsp"%>

<main class="page-wrapper">
    <!-- Page content -->
    <section class="container pt-5">
      <div class="row">

		
        <!-- Sidebar (User info + Account menu) -->
        <%@include file="profile-aside.jsp"%>
        
        <!-- Account messages -->
        <div class="col-md-8 col-lg-9 pb-5 mb-lg-2 mb-lg-4 mt-n3 mt-md-0">
          <div class="ps-md-3 mt-md-2  pb-md-2">
          
          		  <h2 class="h1 pt-2 pt-lg-0 text-center">My Notifications</h2>
                  <!-- Notifications Here -->
                  <div class="list-group">
                  		
                  <!-- Loop here -->
                      <% ArrayList<Notifications> notificationlist = (ArrayList<Notifications>)request.getAttribute("notificationlist");

                          for (Notifications notification:notificationlist){
						
                          %>
                          <a class="list-group-item d-flex justify-content-between align-items-start notification-list
                          <% if (notification.getIsRead()==1){%>
							 read
						  <% } %>
                          ">
						    <div class="ms-2 me-auto">
						      <div class="fw-bold"><%= notification.getTitle() %></div>
						      <%= notification.getContent() %>
						    </div>
						    <div class="d-grid justify-content-start">
		                        <div class="row">
		                        	<small><%= notification.getDateTime() %></small>
		                        </div>
		                        <form  class="row" action="/bsc/Notification" method="POST">
		                        <div class="form-check">
		                          <input type="hidden" name="notificationId" value="<%= notification.getNotificationID() %>">
								  <button type="submit" class="btn py-1 btn-sm 
								  <%
								  if (notification.getIsRead()==1){%>
								  btn-warning disabled
								  <% } else {%>
								  btn-outline-warning
								  <%} %>
								  " id="btn-check"><i class="fa-solid fa-circle-check" ></i></button>
								  <label class="form-check-label" for="btn-check">
								    Mark as Read
								  </label>
								</div>
								</form>
							</div>
		
						  </a>

		                    
		                  <%} %>

                  </div>
          </div>
        </div>
      </div>
    </section>
</main>
	
	<%@include file="inc/top-btn.jsp"%>
	<%@include file="inc/footer.jsp"%>
	<%@ include file="inc/footer-links.jsp" %>
</body>

</html>