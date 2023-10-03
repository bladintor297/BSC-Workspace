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
			
			int movieID = 1; //Tukar id to dynamic 
			
			ArrayList<Malls> malls = new ArrayList<>();
			ArrayList<MovieSlots> movieslots = new ArrayList<>();
			ArrayList<Halls> halls = new ArrayList<>();

			try {
				// Load the MySQL JDBC driver
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				
				/*------  Retrieve Movies ------ */

				// SQL query to retrieve movie data from the database
			    String query2 = "SELECT * FROM movieslot WHERE movieID = ?";
			    PreparedStatement preparedStatement2 = con.prepareStatement(query2);
			    preparedStatement2.setInt(1, movieID); // Set the movieID parameter

			    // Execute the query
			    ResultSet resultSet2 = preparedStatement2.executeQuery();

				// Iterate through the result set and populate the ArrayList
				while (resultSet2.next()) {
					int movieSlotID = resultSet2.getInt("MovieSlotID");
					int mall = resultSet2.getInt("Mall");
					int hall = resultSet2.getInt("Hall");
					String slot = resultSet2.getString("Slot");
					String date = resultSet2.getString("Date");

					MovieSlots movieslot = new MovieSlots (movieSlotID, movieID, hall, mall, slot, date);
					movieslots.add(movieslot);
				}
				
				
				/*------  Retrieve Malls ------ */

				// SQL query to retrieve mall data from the database
				String query = "SELECT mall.* FROM mall JOIN movieslot ON mall.MallID = movieslot.Mall WHERE movieslot.MovieID ='" + movieID + "'";
				
				PreparedStatement preparedStatement = con.prepareStatement(query);

				// Execute the query
				ResultSet resultSet = preparedStatement.executeQuery();

				// Iterate through the result set and populate the ArrayList
				while (resultSet.next()) {
					int mallID = resultSet.getInt("MallID");
					String mallName = resultSet.getString("MallName");
					String address = resultSet.getString("Address");

					
					Malls mall = new Malls(mallID, mallName, address);
					malls.add(mall);
					
					// Create a Set to remove duplicates
					Set<Malls> uniqueMalls = new HashSet<>(malls);

					// Clear the original list and add unique malls back to it
					malls.clear();
					malls.addAll(uniqueMalls);
				}


				

				/*------  Retrieve Movies ------ */

				// SQL query to retrieve mall data from the database
				String query3 = "SELECT * FROM hall";
				PreparedStatement preparedStatement3 = con.prepareStatement(query3);

				// Execute the query
				ResultSet resultSet3 = preparedStatement3.executeQuery();
				

				// Iterate through the result set and populate the ArrayList
				while (resultSet3.next()) {
					int id = resultSet3.getInt("HallID");
					String hallName = resultSet3.getString("HallName"); // Replace with the actual column name
					String category = resultSet3.getString("Category"); // Replace with the actual column name
					int capacity = resultSet3.getInt("Capacity"); // Replace with the actual column name
					int status = resultSet3.getInt("Status"); // Replace with the actual column name

					Halls hall = new Halls(id, hallName, category, capacity, status);
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
			//request.setAttribute("movie", movieslots.get(0));
			request.setAttribute("halls", halls);
			request.setAttribute("movieslots", movieslots);

			// Creating a RequestDispatcher object to dispatch
			// the request the request to another resource
			RequestDispatcher rd = request.getRequestDispatcher("slots.jsp");

			// The request will be forwarded to the resource
			// specified, here the resource is a JSP named,
			// "stdlist.jsp"
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
