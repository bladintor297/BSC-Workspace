package com.bsc.controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Movie
 */
public class Movie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Movie() {
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
		
		String movieID = request.getParameter("movieID");
		String cinemaHallID = request.getParameter("cinemaHallID");
		String place = request.getParameter("place");
		String slot = request.getParameter("slot");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root", "@dmin123");
			PreparedStatement pst = con.prepareStatement("select * from movie where movieID='" + movieID + "', cinemaHallID='" + cinemaHallID + "', place='" + place + "', slot='" + slot + "'");
			ResultSet rs = pst.executeQuery();
			System.out.println("RS: " + rs);
			if(rs.next()) {
				
				// Create Session
				session.setAttribute("movieID", rs.getString("movieID"));
				session.setAttribute("cinemaHallID", rs.getString("cinemaHallID"));
				session.setAttribute("place", rs.getString("place"));
				session.setAttribute("slot", rs.getString("slot"));

				response.sendRedirect("cinemaHall.jsp");
			}else {
				session.setAttribute("status", "failed");
				System.out.println("Movie not available");

				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
		} catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
