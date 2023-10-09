package com.bsc.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bsc.beans.*;
import com.bsc.model.DBConnection;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("register.jsp");

	}

	/**
	 * @return
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		Users rb = new Users();

		rb.setName(name);
		rb.setEmail(email);
		rb.setPassword(password);

		UserDB ud = new UserDB();
		int userID = ud.insertUser(rb); // Get the generated user ID

		// Insert notification with the user ID
		String query = "INSERT INTO notifications "
		        + "(Title, Content, DateTime, UserID) "
		        + "VALUES (?, ?, ?, ?) ";
		
		DBConnection db = new DBConnection();
		try (Connection con = db.getCon();
		     PreparedStatement preparedStatement = con.prepareStatement(query)) {
		    preparedStatement.setString(1, "Set Phone Number");
		    preparedStatement.setString(2, "Please set your phone number");
		    preparedStatement.setString(3, LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		    preparedStatement.setInt(4, userID);
		    int rowsInserted = preparedStatement.executeUpdate();
		    if (rowsInserted > 0) {
		    	session.removeAttribute("notificationCount");
				session.setAttribute("notificationCount", rowsInserted);
		    }
		} catch (SQLException ex) {
		    ex.printStackTrace();
		}
		

		// out.println(name);
		// out.println(email);
		// out.println(password);
		request.setAttribute("name", name);
		request.getRequestDispatcher("login.jsp").forward(request, response);
		;
	}

}
