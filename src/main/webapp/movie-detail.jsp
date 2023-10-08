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
        
        <%
        	Movies movie = (Movies) request.getAttribute("movie");
        %>
		
		<section class="position-relative ">


        <div class="container pt-1 pt-lg-2">
          <div class="row " style="height:90vh;">
          
	        <!-- Swiper tabs (Project images) -->
	        <div class="col-lg-7 my-auto" style="height: 60%;">
	          <div id="project-1" class="swiper-tab bg-position-center bg-repeat-0 bg-size-cover active" 
	          style="background-image: url(<%= movie.getImageLandscape() %>);
	          background-fit: cover;
	          backgroun-repeat: none">
	          </div>
	        </div>
          
            <div class="col-lg-5 my-auto">

              <div class="swiper pt-4 pt-md-0">
                <div class="swiper-wrapper">

                  <!-- Item -->
                  <div class="swiper-slide" data-swiper-tab="#project-1">
                    <h2 class="h1 mb-4"> <%= movie.getTitle() %></h2>
                    <p class="pb-3 mb-3"><%= movie.getDescription() %>.</p>
                    <table class="mb-5">
                      <tbody>
                      	<tr>
                          <th class="text-dark fw-bold pb-2" scope="row">Category</th>
                          <td class="ps-3 ps-sm-4 pb-2">> <%= movie.getClassification() %> years old</td>
                        </tr>
                        <tr>
                          <th class="text-dark fw-bold pb-2" scope="row">Genre</th>
                          <td class="ps-3 ps-sm-4 pb-2">
                          	<%= movie.getGenre() %>
                          </td>
                        </tr>
                        <tr>
                          <th class="text-dark fw-bold pb-2" scope="row">Release Date</th>
                          <td class="ps-3 ps-sm-4 pb-2"><%= movie.getReleaseDate() %></td>
                        </tr>
                      </tbody>
                    </table>
                    <a href="
						<% if (session != null && session.getAttribute("email") != null) { %>
							/bsc/MovieSlot?movieID=<%=movie.getMovieID() %>
						<% }else { %>
							/bsc/Login
								<% } %>
							" class="btn btn-warning shadow-warning mt-2 px-5 rounded-pill">But Ticket Now</a>
                  </div>

              </div>
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