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
import javax.servlet.http.HttpSession;

import com.bsc.beans.Halls;
import com.bsc.beans.Malls;
import com.bsc.beans.Movies;
import com.bsc.beans.Users;

/**
 * Servlet implementation class Movie
 */
public class Movie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Movie() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {

			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			Movies movie = new Movies();
			int movieID = Integer.parseInt(request.getParameter("movieID"));
			HttpSession session = request.getSession();
	
			try {

				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				String query = "SELECT * FROM movie WHERE MovieID = ?";
				PreparedStatement preparedStatement = con.prepareStatement(query);

				preparedStatement.setInt(1, movieID); 	
				

				// Execute the query
				ResultSet resultSet = preparedStatement.executeQuery();


				if (resultSet.next()) {
				    // Retrieve the data from the result set and set it in the Users object
				    
					movie.setMovieID(movieID);
					movie.setClassification(resultSet.getInt("Classification"));
					movie.setTitle(resultSet.getString("Title"));
					movie.setDescription(resultSet.getString("Description"));
					movie.setImageLandscape(resultSet.getString("ImageLandscape"));
					movie.setImagePortrait(resultSet.getString("ImagePortrait"));
					movie.setGenre(resultSet.getString("Genre"));
					movie.setReleaseDate(resultSet.getString("ReleaseDate"));
				}

				
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("movie", movie);
			RequestDispatcher rd = request.getRequestDispatcher("movie-detail.jsp");
			rd.forward(request, response);

			out.println("</body>");
			out.println("</html>");
			
			// Handle success or failure as needed
		} catch (Exception e) {
			e.printStackTrace();
		}

		}
		//Page to Return to add-movie.jsp
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
	}

}