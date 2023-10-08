package com.bsc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bsc.beans.Notifications;
import com.bsc.beans.Users; // Assuming you have a User class

public class Notification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Notification() {
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

			ArrayList<Notifications> notificationlist = new ArrayList<>();
			HttpSession session = request.getSession();
			int row = 0;

			try {

				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"@dmin123");

				String query = "SELECT * FROM notifications";
				PreparedStatement preparedStatement = con.prepareStatement(query);

				// Execute the query
				ResultSet resultSet = preparedStatement.executeQuery();
				

				while (resultSet.next()) {

					int notificationID = resultSet.getInt("NotificationID");
					String title = resultSet.getString("Title");
					String content = resultSet.getString("Content");
					String dateTime = resultSet.getString("DateTime");
					int isRead = resultSet.getInt("IsRead");
					int userID = resultSet.getInt("UserID");
					
					Notifications notification = new Notifications (notificationID, title, content, dateTime, isRead, userID);
					System.out.println(title);
					notificationlist.add(notification);
					
					if (resultSet.getInt("IsRead") == 0)
					row ++;

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			session.removeAttribute("notificationCount");
			session.setAttribute("notificationCount", row);
			request.setAttribute("notificationlist", notificationlist);

			RequestDispatcher rd = request.getRequestDispatcher("notifications.jsp");
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


			HttpSession session = request.getSession();
			int notificationId = Integer.parseInt(request.getParameter("notificationId"));
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root", "@dmin123");
				String query = "UPDATE notifications SET IsRead = 1 WHERE NotificationID = ?";
				
				PreparedStatement preparedStatement = con.prepareStatement(query);
				preparedStatement.setInt(1, notificationId);
				preparedStatement.executeUpdate();
				
				response.sendRedirect("/bsc/Notification");

			} catch (Exception e) {
				e.printStackTrace();
			}
	}
}
