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

import com.bsc.beans.Movies;

/**
 * Servlet implementation class MovieUpdate
 */
public class MovieUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");
			
			int movieID = 0;
			if (request.getParameter("movieID") != null) 
				movieID = Integer.parseInt(request.getParameter("movieID"));

			
			String newTitle = request.getParameter("Title"); 
			String newDescription = request.getParameter("Description"); 
			String newReleaseDate = request.getParameter("ReleaseDate");
			int newClassification = Integer.parseInt(request.getParameter("Classification")); 
			String newGenre = request.getParameter("Genre"); 
			String newImageLandscape = request.getParameter("ImageLandscape"); 
			String newImagePortrait = request.getParameter("ImagePortrait");
			
			

			ArrayList<Movies> movies = new ArrayList<>();
			
			try {

				// Connect DB
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				// SQL query to update movie data
				String updateQuery = "UPDATE movie SET Title = ?, Description = ?, ReleaseDate = ?, Classification = ?, Genre = ?, ImageLandscape = ?, ImagePortrait = ? WHERE MovieID = ?";

				// Create a PreparedStatement for the update query
				PreparedStatement updateStatement = con.prepareStatement(updateQuery);

				// Set the new values for the update
				updateStatement.setString(1, newTitle); // Replace newTitle with the new title value
				updateStatement.setString(2, newDescription); // Replace newDescription with the new description value
				updateStatement.setString(3, newReleaseDate); // Replace newReleaseDate with the new release date value
				updateStatement.setInt(4, newClassification); // Replace newClassification with the new classification value
				updateStatement.setString(5, newGenre); // Replace newGenre with the new genre value
				updateStatement.setString(6, newImageLandscape); // Replace newImageLandscape with the new landscape image URL
				updateStatement.setString(7, newImagePortrait); // Replace newImagePortrait with the new portrait image URL
				updateStatement.setInt(8, movieID); // Replace movieIDToUpdate with the MovieID of the record to update

				// Execute the update query
				updateStatement.executeUpdate();
				
				//Retrieve data from db
				String query2 = "SELECT * FROM movie WHERE status = 0";
				PreparedStatement preparedStatement2 = con.prepareStatement(query2);

				// Execute the query
				ResultSet resultSet2 = preparedStatement2.executeQuery();

				// Iterate through the result set and populate the ArrayList
				while (resultSet2.next()) {
					int id2 = resultSet2.getInt("MovieID");
					String title2 = resultSet2.getString("Title");
					String description2 = resultSet2.getString("Description");
					String releaseDate2 = resultSet2.getString("ReleaseDate");
					int classification2 = resultSet2.getInt("Classification");
					String genre2 = resultSet2.getString("Genre");
					String imageLandscape2 = resultSet2.getString("ImageLandscape");
					String imagePortrait2 = resultSet2.getString("ImagePortrait");

					Movies movie = new Movies (id2, title2, description2, releaseDate2, classification2, genre2, imageLandscape2, imagePortrait2);
					movies.add(movie);
				}

				// Close resources
				con.close();
				updateStatement.close();
				resultSet2.close();
				preparedStatement2.close();

			} catch (Exception e) { 
				e.printStackTrace();
			}
			
			request.setAttribute("movies", movies);
			RequestDispatcher rd = request.getRequestDispatcher("add-movie.jsp");

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
		
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			ArrayList<Movies> movies = new ArrayList<>();
			// Variable dari form
			String title = request.getParameter("Title");
			String description = request.getParameter("Description");
			String releaseDate = request.getParameter("ReleaseDate");
			int classification = Integer.parseInt(request.getParameter("Classification"));
			String genre = request.getParameter("Genre");
			String imageLandscape = request.getParameter("ImageLandscape");
			String imagePortrait = request.getParameter("ImagePortrait");

			try {

				// Connect DB
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				// SQL query to retrieve mall data from

				String query = "UPDATE " 
						+ "movie "
						+ "SET title = ?, description = ?, genre = ?, releaseDate = ?, imageLandscape = ?, imagePortrait = ? "
						+ "WHERE movieID = ?";
				PreparedStatement preparedStatement = con.prepareStatement(query);

				preparedStatement.setString(1, title);
				preparedStatement.setString(2, description);
				preparedStatement.setString(3, releaseDate);
				preparedStatement.setInt(4, classification);
				preparedStatement.setString(5, genre);
				preparedStatement.setString(6, imageLandscape);
				preparedStatement.setString(7, imagePortrait);

				preparedStatement.executeUpdate();
				

				// Close resources
				con.close();
				preparedStatement.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			response.sendRedirect("/bsc/AddNewMovie");

			out.println("</body>");
			out.println("</html>");
		}
	}

}
