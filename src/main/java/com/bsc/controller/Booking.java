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

import com.bsc.beans.Bookings;
import com.stripe.model.billingportal.Session;



/**
 * Servlet implementation class Booking
 */
public class Booking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Booking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");

			ArrayList<Bookings> bookinglist = new ArrayList<>();
			HttpSession session = request.getSession();
			
			try {

				// Connect DB
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");
				
				String query = "SELECT DISTINCT booking.*, movie.* "
						+ "FROM booking "
						+ "INNER JOIN movie ON booking.MovieID = movie.MovieID "
						+ "WHERE booking.UserID = ? "
						+ "AND booking.BookingDate >= NOW()";
				
				PreparedStatement preparedStatement = con.prepareStatement(query);
				preparedStatement.setInt(1, (int)session.getAttribute("id")); 
				ResultSet resultSet = preparedStatement.executeQuery();
				ResultSet resultSet2 = null;
				String _slot = null;
				String _mall = null;
				String _hall = null;
				
				while (resultSet.next()) {
					int movieID = resultSet.getInt("MovieID");
					
					query = "SELECT movieslot.*, "
							 + "mall.MallName AS MallName, "
							 + "hall.HallName AS HallName "
				             + "FROM movieslot "
				             + "INNER JOIN mall ON movieslot.Mall = mall.MallID "
				             + "INNER JOIN hall ON movieslot.Hall = hall.HallID "
				             + "WHERE movieslot.MovieID = '" + movieID + "' "
				             + "LIMIT 1";

					preparedStatement = con.prepareStatement(query);
					resultSet2 = preparedStatement.executeQuery();
					while (resultSet2.next()) {
						_slot = resultSet2.getString("Slot");
						_mall = resultSet2.getString("MallName");
						_hall = resultSet2.getString("HallName");
					}
					
				    int bookingID = resultSet.getInt("BookingID");
				    int userID = resultSet.getInt("UserID");
				    int movieSlotID = resultSet.getInt("MovieSlotID");
				    String slot =  _slot;
				    String mall =  _mall;
				    String hall =  _hall;
				    String paymentID = resultSet.getString("PaymentID");
				    String seat = resultSet.getString("Seat");
				    double amount = resultSet.getDouble("Amount");
				    String bookingDate = resultSet.getString("BookingDate");
				    int status = resultSet.getInt("Status");
				    
				    
				    String title = resultSet.getString("Title");
				    String description = resultSet.getString("Description");
				    String releaseDate = resultSet.getString("ReleaseDate");
				    int classification = resultSet.getInt("Classification");
				    String genre = resultSet.getString("Genre");
				    String imageLandscape = resultSet.getString("ImageLandscape");
				    String imagePortrait = resultSet.getString("ImagePortrait");
				    
				    // Create a Bookings object that combines data from both Bookings and Movies
				    Bookings booking = new Bookings(bookingID, userID, movieSlotID, paymentID,
				            seat, amount, bookingDate, status,
				            movieID, title, description, releaseDate,
				            classification, genre, imageLandscape, imagePortrait, slot, mall, hall);

				    // Add the Booking object to the ArrayList
				    bookinglist.add(booking);
				}
				
				
				// Close resources
				con.close();
				// resultSet2.close();
				// preparedStatement2.close();
				
			} catch (Exception e) { 
				e.printStackTrace();
			}
			
			request.setAttribute("bookinglist", bookinglist);
			
			RequestDispatcher rd = request.getRequestDispatcher("booking-history.jsp");
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
