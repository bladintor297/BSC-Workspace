package com.bsc.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		out.println("Welcome to first servlet");
		Connection con;
		Statement stmt;
		ResultSet rs;
		String query = "select * from user";
		ArrayList<Users> userlist = new ArrayList<Users>();

		DBConnection db = new DBConnection();
		try {
			con = db.getCon();
			if (con == null) {
				out.println("Failed with connection" + con);
			} else {
				out.println("Successful with connection" + con);
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				while (rs.next()) {
					Users user = new Users();
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
					user.setPassword(rs.getString("password"));
					userlist.add(user);
				}
				request.setAttribute("UserData", userlist);
				request.getRequestDispatcher("jsp/UserList.jsp").forward(request, response);
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
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

		Users rb = new Users();

		rb.setName(name);
		rb.setEmail(email);
		rb.setPassword(password);

		UserDB ud = new UserDB();
		String s1 = ud.insertUser(rb);

		System.out.println(s1);
		// out.println(name);
		// out.println(email);
		// out.println(password);
		request.setAttribute("name", name);
		request.getRequestDispatcher("login.jsp").forward(request, response);
		;
	}

}
