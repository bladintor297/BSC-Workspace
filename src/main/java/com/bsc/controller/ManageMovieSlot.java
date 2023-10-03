package com.bsc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsc.beans.MovieSlots;

/**
 * Servlet implementation class ManageMovieSlot
 */
public class ManageMovieSlot extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageMovieSlot() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			// Variables from Form

			ArrayList<MovieSlots> deletemov = new ArrayList<>();

			try {
				// Load the MySQL JDBC driver
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				/*------  Delete Malls ------ */

				String query = "DELETE FROM movieslot WHERE ";
				PreparedStatement preparedStatement = con.prepareStatement(query);
				int resultSet = preparedStatement.executeUpdate();

				// Execute the query

				con.close();
				preparedStatement.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			response.sendRedirect("/bsc/AddMovieSlot");
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
		response.getWriter().append(
				"This is a get function in Login.java \nHantar user balik pegi login page. \nRedirect sini when no session created");
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			// Variables from Form

			ArrayList<MovieSlots> deletemov = new ArrayList<>();
			


			try {
				// Load the MySQL JDBC driver
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				/*------  Retrieve Malls ------ */

				String query = "DELETE * FROM movieslot *";
				PreparedStatement preparedStatement = con.prepareStatement(query);
				ResultSet resultSet = preparedStatement.executeQuery();

				/*
				 * MovieSlots movieslot = new MovieSlots();
				 * 
				 * movieslot.setMovieID(movieID); movieslot.setMall(Integer.parseInt(mall));
				 * movieslot.setHall(Integer.parseInt(hall)); movieslot.setSlot(time);
				 * movieslot.setDate(date);
				 * 
				 * 
				 * movieslots.add(movieslot);
				 * 
				 * preparedStatement.setInt(1, movieID); preparedStatement.setString(2, mall);
				 * preparedStatement.setString(3, hall); preparedStatement.setString(4, time);
				 * preparedStatement.setString(5, date);
				 */

				// Execute the query

				con.close();
				preparedStatement.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			response.sendRedirect("/bsc/AddMovieSlot");
			out.println("</body>");
			out.println("</html>");

		}
	}

}
