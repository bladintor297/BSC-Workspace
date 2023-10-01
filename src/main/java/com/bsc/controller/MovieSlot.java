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

import com.bsc.beans.Halls;
import com.bsc.beans.Malls;
import com.bsc.beans.Movies;

/**
 * Servlet implementation class MovieSlot
 */
public class MovieSlot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieSlot() {
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

		ArrayList<Malls> malls = new ArrayList<>();
		ArrayList<Movies> movies = new ArrayList<>();
		ArrayList<Halls> halls = new ArrayList<>();
		
        
        try {
            // Load the MySQL JDBC driver
        	Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root", "@dmin123");

			
			/*------  Retrieve Malls ------ */
			
            // SQL query to retrieve mall data from the database
            String query = "SELECT MallID, MallName, Address FROM mall";
            PreparedStatement preparedStatement = con.prepareStatement(query);

            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Iterate through the result set and populate the ArrayList
            while (resultSet.next()) {
                int mallID = resultSet.getInt("MallID");
                String mallName = resultSet.getString("MallName");
                String address = resultSet.getString("Address");

                Malls mall = new Malls (mallID, mallName, address);
                malls.add(mall);
            }
            
            
            /*------  Retrieve Movies ------ */
            
            // SQL query to retrieve mall data from the database
            String query2 = "SELECT MovieID, Title, Description, ReleaseDate, Classification, Genre, ImageLandscape, ImagePortrait FROM movie";
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
            
            
            /*------  Retrieve Movies ------ */
            
            // SQL query to retrieve mall data from the database
            String query3 = "SELECT * FROM hall";
            PreparedStatement preparedStatement3 = con.prepareStatement(query3);

            // Execute the query
            ResultSet resultSet3 = preparedStatement3.executeQuery();

            // Iterate through the result set and populate the ArrayList
            while (resultSet3.next()) {
                String hallName = resultSet3.getString("HallName"); // Replace with the actual column name
                String category = resultSet3.getString("Category"); // Replace with the actual column name
                int capacity = resultSet3.getInt("Capacity"); // Replace with the actual column name
                int status = resultSet3.getInt("Status"); // Replace with the actual column name

                Halls hall = new Halls(hallName, category, capacity, status);
                halls.add(hall);
            }

            // Close resources
            con.close();
            resultSet.close();
            preparedStatement.close();
           
            
            resultSet2.close();
            preparedStatement2.close();
            
            resultSet3.close();
            preparedStatement3.close();
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }

		// Setting the attribute of the request object
		// which will be later fetched by a JSP page
			request.setAttribute("malls", malls);
			request.setAttribute("movies", movies);
			request.setAttribute("halls", halls);

		// Creating a RequestDispatcher object to dispatch
		// the request the request to another resource
			RequestDispatcher rd = request.getRequestDispatcher("add-movie.jsp");

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
		
		int movieID = Integer.parseInt(request.getParameter("movieID"));
		String mall = request.getParameter("mall");
		String[] selectedDates= request.getParameterValues("dates");
		String[] selectedTimes = request.getParameterValues("times");

		if (selectedTimes != null) {
	        for (String time : selectedTimes) {
	            // Process each selected time here
	            System.out.println("Selected time: " + time);
	        }
	    }
		
	}

}
