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
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.sendRedirect("welcome.jsp");
		response.getWriter().append("This is a get function in Login.java \nHantar user balik pegi login page. \nRedirect sini when no session created");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bsc?allowPublicKeyRetrieval=true&useSSL=false", "root", "@dmin123");
			PreparedStatement pst = con.prepareStatement("select * from users where email='" + email + "' and password='" + password + "'");
			ResultSet rs = pst.executeQuery();
			System.out.println("RS: " + rs);
			if(rs.next()) {
				System.out.println("Before session");
				
				// Create Session
				session.setAttribute("email", rs.getString("email"));
				session.setAttribute("nama", rs.getString("name"));
				System.out.println("After session");

				response.sendRedirect("welcome.jsp");
			}else {
				session.setAttribute("status", "failed");
				System.out.println("Wrong email or password");

				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
		} catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
