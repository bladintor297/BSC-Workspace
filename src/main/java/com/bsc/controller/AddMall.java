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

import com.bsc.beans.Malls;

/**
 * Servlet implementation class AddMall
 */
public class AddMall extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddMall() {
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

			ArrayList<Malls> malls = new ArrayList<>();

			try {

				// Connect DB
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				// SQL query to retrieve mall data from
				
				String query = "SELECT * FROM mall WHERE Status=0";
//				String query = "SELECT * FROM mall";
				PreparedStatement preparedStatement = con.prepareStatement(query);
				
				ResultSet resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					int mallId = resultSet.getInt("MallID");
					String mallName = resultSet.getString("MallName");
					String address = resultSet.getString("Address");

					Malls mall = new Malls (mallId, mallName, address);
					malls.add(mall);
				}
				
				// Close resources
				con.close();
				resultSet.close();
				preparedStatement.close();


			} catch (Exception e) { 
				e.printStackTrace();
			}
			
			request.setAttribute("malls", malls);
			RequestDispatcher rd = request.getRequestDispatcher("add-mall.jsp");

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

			ArrayList<Malls> malls = new ArrayList<>();
			// Variable dari form
			String mallName = request.getParameter("MallName");
			String address = request.getParameter("Address");

			try {

				// Connect DB
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

	
				String query = "INSERT INTO mall (MallName, Address, Status) VALUES (?, ?, 0)";
				PreparedStatement preparedStatement = con.prepareStatement(query);
				

				// Call constructor
				Malls mall = new Malls();
				mall.setMallName(mallName);
				mall.setAddress(address);
				
				malls.add(mall);

				preparedStatement.setString(1, mallName);
				preparedStatement.setString(2, address);

				preparedStatement.executeUpdate();
				
				String query1 = "SELECT * FROM mall WHERE Status=0";
//				String query1 = "SELECT * FROM mall";
				preparedStatement = con.prepareStatement(query1);
				
				ResultSet resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					int mallId = resultSet.getInt("MallID");
					String mallName1 = resultSet.getString("MallName");
					String address1 = resultSet.getString("Address");

					Malls mall1 = new Malls (mallId, mallName1, address1);
					malls.add(mall1);
				}
				

				// Close resources
				con.close();
				preparedStatement.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("malls", malls);
			RequestDispatcher rd = request.getRequestDispatcher("add-mall.jsp");

			rd.forward(request, response);
//			response.sendRedirect("/add-mall.jsp");
			out.println("</body>");
			out.println("</html>");
		}	
	}
}