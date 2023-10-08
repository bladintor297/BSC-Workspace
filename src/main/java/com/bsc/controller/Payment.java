package com.bsc.controller;

import com.bsc.beans.Movies;
import com.bsc.beans.Payments;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import com.stripe.param.ChargeCreateParams;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

public class Payment extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		HttpSession session = request.getSession();
		
		String paymentID = (String) session.getAttribute("paymentID");
		
		String movieDate = (String) session.getAttribute("movieDate");
	
		int movieID = (int) session.getAttribute("movieID");
		int movieSlotID = (int) session.getAttribute("movieSlotID");
		int userID = 0;
		String userName = null;
		String userEmail = null;
		int row = 0;
		
		if ((int)session.getAttribute("role") != 0) {
			userID = (int) session.getAttribute("custID");
			userName = (String) session.getAttribute("custName");
			userEmail = (String) session.getAttribute("custEmail");
		} else {
			userID = (int) session.getAttribute("id");
			userName = (String) session.getAttribute("email");
			userEmail = (String) session.getAttribute("name");
		}

		String seats = (String) session.getAttribute("seats");
		Double amount = (Double) session.getAttribute("amount");
		
		
		// Set your Stripe secret key
        Stripe.apiKey = "sk_test_51Mu9GvJML1sZdHEFkftQO2IHFX1QBaGxXRoHxA2TpeTrPMrznpTE61j0C0br46OOXbosW04RAVRC0j8eoZu7kjKP006X2K1o3c";

        // Retrieve the token from the form
        String token = request.getParameter("stripeToken");


        // Create a map with charge details
        Map<String, Object> chargeParams = new HashMap<>();
        chargeParams.put("amount", (int)(amount*100));
        chargeParams.put("currency", "myr");
        chargeParams.put("description", seats);

        // Set the source (token) for the charge
        chargeParams.put("source", token);

        try {
            // Create the charge
            Charge charge = Charge.create(chargeParams);

            // Payment successful, you can perform additional actions here
            
            
            // Add Payment to DB
            
            
            try {
            	// Connect DB
    			Class.forName("com.mysql.jdbc.Driver");
    			Connection con = DriverManager.getConnection(
    					"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
    					"@dmin123");
    			
    			/* INSERT INTO TABLE BOOKING */
    			
    			String query = "INSERT INTO booking "
    					+ "(MovieSlotID, MovieID, PaymentID, UserID, UserEmail, CustName, Seat, BookingDate, Amount, Status) "
    					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    			PreparedStatement preparedStatement = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
    			
    			//Add Booking to DB
    			preparedStatement.setInt(1, movieSlotID); // MovieSlotID
    			preparedStatement.setInt(2, movieID); // MovieID
    			preparedStatement.setString(3, paymentID); // PaymentID
    			preparedStatement.setInt(4, userID); // UserID
    			preparedStatement.setString(5, userEmail); // UserEmail
    			preparedStatement.setString(6, userName); // CustName
    			preparedStatement.setString(7, seats); // Seat
    			preparedStatement.setString(8, movieDate); // BookingDate
    			preparedStatement.setDouble(9, amount); // Amount
    			preparedStatement.setInt(10, 1); // Status
    			
    			preparedStatement.executeUpdate();
    			
    			ResultSet generatedKeys = preparedStatement.getGeneratedKeys();

    			int bookingID = -1; // Initialize bookingID to a default value

    			if (generatedKeys.next()) {
    			    bookingID = generatedKeys.getInt(1); // Retrieve the generated bookingID
    			}
    			
    			
    			/* INSERT INTO TABLE PAYMENT */
    			
    			query = "INSERT INTO payment "
    					+ "(PaymentID, UserID, BookingID, Amount, PaymentDate, Method) "
    					+ "VALUES (?, ?, ?, ?, ?, ?)";
    			preparedStatement = con.prepareStatement(query);
    			
    			
    			// Add Payment to DB
				preparedStatement.setString(1, paymentID); // PaymentID
				preparedStatement.setInt(2, userID); // UserID
				preparedStatement.setInt(3, bookingID); // BokingID
				preparedStatement.setDouble(4, amount); // Amount
				preparedStatement.setString(5, LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))); // PaymentDate
				preparedStatement.setInt(6, 1); // Method
				
				preparedStatement.executeUpdate();
				
				
				/* INSERT INTO TABLE NOTIFICATION */
    			
    			query = "INSERT INTO notifications "
    					+ "(Title, Content, DateTime, UserID) "
    					+ "VALUES (?, ?, ?, ?) ";

    			preparedStatement = con.prepareStatement(query);

                preparedStatement.setString(1, "Successfull Booking (B" + String.format("%04d", bookingID) + ")");
                preparedStatement.setString(2, "Your booking at " + movieDate +" is successfull");
                preparedStatement.setString(3, LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                preparedStatement.setInt(4, userID);
                row = 1;

				preparedStatement.executeUpdate();
				
				preparedStatement.setString(1, "Successfull Payment for Booking (B" + String.format("%04d", bookingID) + ")");
                preparedStatement.setString(2, String.format("You have been charged with RM %f for your movie booking", amount));
                preparedStatement.setString(3, LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                preparedStatement.setInt(4, userID);
				
				preparedStatement.executeUpdate();
				
			
				// Close resources
				con.close();
				generatedKeys.close();
				preparedStatement.close();
				
				
    			
            }catch (Exception e) {
				e.printStackTrace();
			}
            
            session.removeAttribute("notificationCount");
			session.setAttribute("notificationCount", row);
            response.sendRedirect("/bsc/Booking");
        } catch (StripeException e) {
            // Payment failed, handle the error appropriately
            response.getWriter().write("Payment failed. Error message: " + e.getMessage());
        }
        
        
    }
}
