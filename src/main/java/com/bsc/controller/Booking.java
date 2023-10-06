package com.bsc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

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

			ArrayList<Bookings> ongoinglist = new ArrayList<>();
			ArrayList<Bookings> historylist = new ArrayList<>();
			HttpSession session = request.getSession();
			String query = null;
			PreparedStatement preparedStatement = null;
			
			try {

				// Connect DB
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");
				
				
				if ((int)session.getAttribute("role") != 0) {
					query = "SELECT booking.*, movie.* "
							+ "FROM booking "
							+ "INNER JOIN movie ON booking.MovieID = movie.MovieID ";
					preparedStatement = con.prepareStatement(query);
					
				}
				else {
					query = "SELECT booking.*, movie.* "
							+ "FROM booking "
							+ "INNER JOIN movie ON booking.MovieID = movie.MovieID "
							+ "WHERE booking.UserID = ? ";
					preparedStatement = con.prepareStatement(query);
					preparedStatement.setInt(1, (int)session.getAttribute("id"));
				}		
				 
				ResultSet resultSet = preparedStatement.executeQuery();
				ResultSet resultSet2 = null;
				String _slot = null;
				String _mall = null;
				String _hall = null;
				
				while (resultSet.next()) {
					int movieID = resultSet.getInt("MovieID");
					
					query = "SELECT DISTINCT movieslot.*, "
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
				    
				    String custName = resultSet.getString("CustName");
				    String custEmail= resultSet.getString("UserEmail");
				    
				    // Create a Bookings object that combines data from both Bookings and Movies
				    Bookings booking = new Bookings(bookingID, userID, movieSlotID, paymentID,
				            seat, amount, bookingDate, status, movieID, title, description, 
				            releaseDate, classification, genre, imageLandscape, imagePortrait, slot, 
				            mall, hall, custName, custEmail);

				    SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				    //inputDateFormat.parse(bookingDate);
				    // Check the booking date condition and add to the appropriate list
				    if (inputDateFormat.parse(bookingDate).after(new Date()) || inputDateFormat.parse(bookingDate).equals(new Date()) ) {
				        ongoinglist.add(booking);
				        System.out.println("1 booking added to ongoinglist");
				    } else {
				        historylist.add(booking);
				        System.out.println("1 booking added to historylist");
				    }
				}
				
				
				
				
				/* HISTORY LIST */
				
				
				
				// Close resources
				con.close();
				// resultSet2.close();
				// preparedStatement2.close();
				
			} catch (Exception e) { 
				e.printStackTrace();
			}
			
			request.setAttribute("historylist", historylist);
			request.setAttribute("ongoinglist", ongoinglist);
			
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
