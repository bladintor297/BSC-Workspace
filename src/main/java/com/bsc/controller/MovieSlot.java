package com.bsc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsc.beans.Halls;
import com.bsc.beans.Malls;
import com.bsc.beans.MovieSlots;
import com.bsc.beans.Movies;
import com.bsc.beans.Users;

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
			
			int movieID = Integer.parseInt(request.getParameter("movieID")); //Tukar id to dynamic 

			ArrayList<MovieSlots> movieslots = new ArrayList<>();
			ArrayList<Users> userlist = new ArrayList<>();
			Movies movie = null;
			
			try {
				// Load the MySQL JDBC driver
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				
				
				/*------  Retrieve Movie Slots ------ */
				
				String query = "SELECT "
				        + "movieslot.*, "
				        + "mall.MallName as MallName, "
				        + "movie.Title AS MovieTitle, "
				        + "hall.HallName AS HallName, "
				        + "hall.Category AS HallCategory "
				        + "FROM movieslot "
				        + "JOIN hall ON movieslot.Hall = hall.HallID "
				        + "JOIN mall ON movieslot.Mall = mall.MallID "
				        + "JOIN movie ON movieslot.MovieID = movie.MovieID "
				        + "WHERE movieslot.MovieID = ?";

			    PreparedStatement preparedStatement = con.prepareStatement(query);
			    preparedStatement.setInt(1, movieID); // Set the movieID parameter

			    // Execute the query
			    ResultSet resultSet = preparedStatement.executeQuery();

				// Iterate through the result set and populate the ArrayList
				while (resultSet.next()) {
					
					int movieSlotID = resultSet.getInt("MovieSlotID");
					int mallID = resultSet.getInt("Mall");
					int hallID = resultSet.getInt("Hall");
					String slot = resultSet.getString("Slot");
					String date = resultSet.getString("Date");
					int status = resultSet.getInt("status");
					String category = resultSet.getString("HallCategory");
					String movieTitle = resultSet.getString("MovieTitle");
					String hallName = resultSet.getString("HallName");
					String mallName = resultSet.getString("MallName");

					MovieSlots movieslot = new MovieSlots (movieSlotID, movieID, hallID, mallID, slot, date, category, movieTitle, hallName, mallName, status);
					movieslots.add(movieslot);
				}
				
				
				
				/*------  Retrieve Movie Details ------ */
				
				query = "SELECT * FROM movie WHERE MovieID = ?";
				preparedStatement = con.prepareStatement(query);
			    preparedStatement.setInt(1, movieID);
			    
			    // Execute the query
			    resultSet = preparedStatement.executeQuery();
			    
			    while (resultSet.next()) {
			        int MovieID = resultSet.getInt("MovieID");
					String title = resultSet.getString("Title");
					String description = resultSet.getString("Description");
					String releaseDate = resultSet.getString("ReleaseDate");
					int classification = resultSet.getInt("Classification");
					String genre = resultSet.getString("Genre");
					String imageLandscape = resultSet.getString("ImageLandscape");
					String imagePortrait = resultSet.getString("ImagePortrait");
					
					movie = new Movies (MovieID, title, description, releaseDate, classification, genre, imageLandscape, imagePortrait);
			    }
			    
			    
			    /*------  Retrieve Customers ------ */
				
				query = "SELECT * FROM users WHERE role = 0";
				preparedStatement = con.prepareStatement(query);
			    
			    // Execute the query
			    resultSet = preparedStatement.executeQuery();
			    
			    while (resultSet.next()) {
			        int userID = resultSet.getInt("id");
					String name= resultSet.getString("name");
					String email = resultSet.getString("email");
					String phone = resultSet.getString("phone");
	
					
					Users user = new Users (userID, name, email, phone);
					userlist.add(user);
			    }


				// Close resources
				con.close();
				resultSet.close();
				preparedStatement.close();


			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("movieslots", movieslots);
			request.setAttribute("movie", movie);
			request.setAttribute("userlist", userlist);

			RequestDispatcher rd = request.getRequestDispatcher("slots.jsp");

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

			// Variables from Form
			int movieID = Integer.parseInt(request.getParameter("movieID"));
			String mall = request.getParameter("mall");
			String[] selectedDates = request.getParameterValues("dates");
			String[] selectedTimes = request.getParameterValues("times");
			String[] selectedHalls = request.getParameterValues("halls");
			
			
			//Format Date
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		    

			ArrayList<MovieSlots> movieslots = new ArrayList<>();

			try {
				// Load the MySQL JDBC driver
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				/*------  Retrieve Malls ------ */
				
				String query = " ";
				PreparedStatement preparedStatement = null;
				int resultSet = 0;

				for (String date : selectedDates) {
					for (String time : selectedTimes) {
						for (String hall : selectedHalls) {

							query = "INSERT INTO movieslot (MovieID, Mall, Hall, Slot, Date) VALUES (?, ?, ?, ?, ?)";
							preparedStatement = con.prepareStatement(query);

							MovieSlots movieslot = new MovieSlots();

							movieslot.setMovieID(movieID);
							movieslot.setMall(Integer.parseInt(mall));
							movieslot.setHall(Integer.parseInt(hall));
							movieslot.setSlot(time);

							movieslot.setDate(date);

							movieslots.add(movieslot);

							preparedStatement.setInt(1, movieID);
							preparedStatement.setString(2, mall);
							preparedStatement.setString(3, hall);
							preparedStatement.setString(4, time);
							preparedStatement.setString(5, date);


							// Execute the query
							resultSet = preparedStatement.executeUpdate();

						}
					}
				}

				con.close();
				preparedStatement.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}
}
