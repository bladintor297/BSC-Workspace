package com.bsc.controller;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;

import com.bsc.beans.Users;
import com.bsc.model.DBConnection;

public class UserDB {
	
	String s1 = null;

	public String insertUser(Users rb) {
		DBConnection db = new DBConnection();
		Connection con = db.getCon();
		try {
			Statement stat = con.createStatement();
			stat.executeUpdate("insert into user(name,email,password) values('" + rb.getName() + "','" + rb.getEmail()
					+ "','" + rb.getPassword() + "')");
			s1 = "Data Insert Successfully";
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return s1;
	}

}
