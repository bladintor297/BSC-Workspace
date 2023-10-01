//package com.bsc.controller;
//
//import java.sql.Statement;
//import java.sql.Connection;
//import java.sql.SQLException;
//
//import com.bsc.beans.Movies;
//import com.bsc.model.DBConnection;
//
//public class MovieSlotDB {
//
//	String s1 = null;
//
//	public String insertUser(Movies rb) {
//		DBConnection db = new DBConnection();
//		Connection con = db.getCon();
//		try {
//			Statement stat = con.createStatement();
//			stat.executeUpdate("insert into movie(movieID,cinemaHallID,place,slot) values('" + rb.getMovieID() + "','" + rb.getCinemaHallID()
//					+ "','" + rb.getPlace() + "','" + rb.getSlot() + "')");
//			s1 = "Data Insert Successfully";
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//		}
//		return s1;
//	}
//
//}