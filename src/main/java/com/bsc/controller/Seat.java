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
import java.util.UUID;

import com.bsc.beans.Seats;

/**
 * Servlet implementation class Seat
 */
public class Seat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Seat() {
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
			out.println("<title>Select Seat</title>");
			out.println("</head>");
			out.println("<body>");

			// Initialize Variables
			HttpSession session = request.getSession();
			int movieID = Integer.parseInt(request.getParameter("movieID"));
			int movieSlotID = Integer.parseInt(request.getParameter("movieSlotID"));
			String movieDate = request.getParameter("movieDate");
			
			String selectedValue = null;
			String[] selectedValues = null;
			String custID = null;
			String custName = null;
			
			ArrayList<Seats> seatlist = new ArrayList<>();
			
			if ((int)session.getAttribute("role") != 0) {
				selectedValue = request.getParameter("user");
				selectedValues = selectedValue.split(",");
				
				custID = selectedValues[0]; // The userID
				custName = selectedValues[1]; // The userName	
			}
			
			String paymentID = UUID.randomUUID().toString();
			
			session.setAttribute("paymentID", "P"+paymentID);
			session.setAttribute("movieID", movieID);
			session.setAttribute("movieSlotID", movieSlotID);
			
			if ((int)session.getAttribute("role") != 0) {
				session.setAttribute("custID", Integer.parseInt(custID));
				session.setAttribute("custEmail", request.getParameter("custEmail"));
				session.setAttribute("custName", custName);
			}
			
			session.setAttribute("movieDate", movieDate);
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
								"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", 
								"root",
								"@dmin123");
				
				String query = "SELECT Seat FROM booking WHERE MovieSlotID = ?";
				PreparedStatement preparedStatement = con.prepareStatement(query);
				preparedStatement.setInt(1, movieSlotID);
				
				ResultSet resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					String seatNumbers = resultSet.getString("Seat");
					String[] seats = seatNumbers.split(", ");
					for (String seat : seats) {
					    
						// Assuming you have a Seats constructor that takes a seat number
					    Seats seatsObject = new Seats(seat);
					    seatlist.add(seatsObject);
					}
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			

			request.setAttribute("seatslist", seatlist);

			RequestDispatcher rd = request.getRequestDispatcher("seats.jsp");

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
		
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			
			ArrayList<Seats> seatslist = new ArrayList<>();
			String[] selectedSeats = request.getParameterValues("seats");
			double amount = 0;
			HttpSession session = request.getSession();
			StringBuilder seats = new StringBuilder(); 
			
			
			try {
				// Connect to DB
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
								"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", 
								"root",
								"@dmin123");
				
				// Execute Query
				String query = "SELECT * FROM seat";
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					
					
					for (String seat:selectedSeats) {
						
						if (rs.getString("SeatNumber").equals(seat)) {
							
							int seatID = rs.getInt("SeatID");
							double price = rs.getDouble("Price");
							String seatNumber = rs.getString("SeatNumber");
							
							Seats s = new Seats (seatID, price, seatNumber);
							seatslist.add(s);
							
							amount += price;
							// Append the seatNumber to the StringBuilder with a comma and space
					        if (seats.length() > 0) {
					            seats.append(", ");
					        }
					        seats.append(seatNumber);
							
							// Check 
							System.out.println("Added string: " + seatNumber);
							System.out.printf("Total Amount: RM%.2f", amount);
						}
						
						else {
							continue;
						}
						
					}
					
				}
				
				
				session.setAttribute("amount", amount);
				System.out.print("Movie Date Session: " + session.getAttribute("movieDate"));
				session.setAttribute("seats", seats.toString());
			}catch (Exception e) {
				e.printStackTrace();
			}

			
			
			response.sendRedirect("/bsc/payment-page.jsp"); 

			out.println("</body>");
			out.println("</html>");
			
			
		}
	}
}
