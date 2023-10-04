package com.bsc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsc.beans.Malls;
import com.bsc.beans.Movies;

/**
 * Servlet implementation class Welcome
 */
public class Welcome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Welcome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet StudentServlet</title>");
		out.println("</head>");
		out.println("<body>");

		ArrayList<Movies> movies = new ArrayList<>();
		
        
        try {
            // Load the MySQL JDBC driver
        	Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root", "@dmin123");
      
            /*------  Retrieve Movies ------ */
            
            // SQL query to retrieve mall data from the database
            String query2 = "SELECT * FROM movie WHERE status=0";
            PreparedStatement preparedStatement2 = con.prepareStatement(query2);

            // Execute the query
            ResultSet resultSet2 = preparedStatement2.executeQuery();

            // Iterate through the result set and populate the ArrayList
            while (resultSet2.next()) {
            	int movieID = resultSet2.getInt("MovieID");
                String title = resultSet2.getString("Title");
                String description = resultSet2.getString("Description");
                String releaseDate = resultSet2.getString("ReleaseDate");
                int classification = resultSet2.getInt("Classification");
                String genre = resultSet2.getString("Genre");
                String imageLandscape = resultSet2.getString("ImageLandscape");
                String imagePortrait = resultSet2.getString("ImagePortrait");

                Movies movie = new Movies (movieID, title, description, releaseDate, classification, genre, imageLandscape, imagePortrait);
                movies.add(movie);
            }
            

            // Close resources
            con.close();  
            resultSet2.close();
            preparedStatement2.close();
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }


			request.setAttribute("movies", movies);

		// Creating a RequestDispatcher object to dispatch
		// the request the request to another resource
			RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");

		// The request will be forwarded to the resource
		// specified, here the resource is a JSP named,
		// "stdlist.jsp"
			rd.forward(request, response);
				out.println("</body>");
				out.println("</html>");
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
