package com.bsc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bsc.beans.Users; // Assuming you have a User class

public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangePassword() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			Users user = new Users();
			HttpSession session = request.getSession();
	
			try {

				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				String query = "SELECT * FROM users WHERE id = ?";
				PreparedStatement preparedStatement = con.prepareStatement(query);

				preparedStatement.setInt(1, (int)session.getAttribute("id")); 
				preparedStatement.executeQuery();



			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("user", user);
			RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
			rd.forward(request, response);

			out.println("</body>");
			out.println("</html>");
			
			// Handle success or failure as needed
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			/* ---- LAYOUT FOR UPDATE QUERY ---- */

			// Step 1: Create HTML layout
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			// Step 2: Create ArrayList using associated Beans
			
			Users u = new Users();

			// Step 3: Get variables (if neccessary)

			/* Example: */
			String Password = request.getParameter("password");
			String ConfirmNewPassword = request.getParameter("cnp");
			String NewPassword = request.getParameter("np");
			String password = null;
			HttpSession session = request.getSession();
			Users user_passed  = new Users();
			user_passed.setPassword(ConfirmNewPassword);
			int row = 0;
			
			
			// String password = request.getParameter("password");

			try {
				// Step 4: Connect to Database
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				// Step 5: Initialize MySQL Variables
				String query = null;
				PreparedStatement preparedStatement = null;

				String query2 = "SELECT password FROM users WHERE id = ?";
				preparedStatement = con.prepareStatement(query2);
				preparedStatement.setInt(1, ((int) session.getAttribute("id")));
				ResultSet rs = preparedStatement.executeQuery();
				
				while (rs.next()) {
					password = rs.getString("Password");
				}


				
				if (!password.equals(Password))
					request.setAttribute("invalidPasswordMessage", "Invalid Password");
				
				// Step 6: Run query
				query = "UPDATE users SET password = ? WHERE id = ?";
				preparedStatement = con.prepareStatement(query);
				preparedStatement = con.prepareStatement(query);
				

				// Step 7: Create single variable from arraylist
	
				// Step 8: Set data to variable
				preparedStatement.setString(1, ConfirmNewPassword);
				preparedStatement.setInt(2, ((int) session.getAttribute("id"))); // Assuming 'id' is an integer
				/* -- Add more here -- */
				
				
				

				/* INSERT INTO TABLE NOTIFICATION */
    			
    			query = "INSERT INTO notifications "
    					+ "(Title, Content, DateTime, UserID) "
    					+ "VALUES (?, ?, ?, ?) ";

    			preparedStatement = con.prepareStatement(query);

                preparedStatement.setString(1, "Password Changed");
                LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
                String formattedDateTime = now.format(formatter);
                preparedStatement.setString(2, "Your password has been changed at " + formattedDateTime);
                preparedStatement.setString(3, LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                preparedStatement.setInt(4, (int)session.getAttribute("id"));
                row = 1;
                
                preparedStatement.executeUpdate();

				

			} catch (Exception e) {
				e.printStackTrace();
			}
			
            session.removeAttribute("notificationCount");
			session.setAttribute("notificationCount", row);
			
			request.setAttribute("user", u);
			RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
			rd.forward(request, response);

			out.println("</body>");
			out.println("</html>");

			// Handle success or failure as needed
		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}
