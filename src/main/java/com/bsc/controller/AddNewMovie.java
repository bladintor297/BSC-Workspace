package com.bsc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddNewMovie
 */
public class AddNewMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewMovie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			out.println("</body>");
			out.println("</html>");
			
			//Variable dari form
			
			try {

				// Connect DB
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root","@dmin123");
				
				// SQL query to retrieve mall data from 
				String query = "INSERT INTO (table_name) (column1, column2, column3) VALUES (?, ?, ?)";
				PreparedStatement preparedStatement = con.prepareStatement(query);

				// Execute the query
				ResultSet resultSet = preparedStatement.executeQuery();

				// Proccess data
				while (resultSet.next()) {
					// int movieSlotID = resultSet.getInt("MovieSlotID");
					
					// Call constructor
					/// Movies movie = new Movies (title, description, releaseDate, classification,
					// genre, imageLandscape, imagePortrait);

				}

				// Close resources
				con.close();
				resultSet.close();
				preparedStatement.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
