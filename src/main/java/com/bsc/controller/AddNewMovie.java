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
 * Servlet implementation class AddNewMovie
 */
public class AddNewMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNewMovie() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

				// Connect DB
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				// SQL query to retrieve mall data from
				
				//Retrieve data from db
				String query2 = "SELECT * FROM movie WHERE status=0";
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

				String query = "INSERT INTO movie (Title, Description, ReleaseDate, Classification, Genre, ImageLandscape, ImagePortrait) VALUES (?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement preparedStatement = con.prepareStatement(query);

				// Call constructor
				Movies movie = new Movies();
				movie.setTitle(title);
				movie.setDescription(description);
				movie.setGenre(genre);
				movie.setReleaseDate(releaseDate);
				movie.setImageLandscape(imageLandscape);
				movie.setImagePortrait(imagePortrait);

				movies.add(movie);

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

			response.sendRedirect("/AddNewMovie");
			out.println("</body>");
			out.println("</html>");
		}
	}

}
