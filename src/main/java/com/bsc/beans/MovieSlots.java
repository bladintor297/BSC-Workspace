package com.bsc.beans;

import java.sql.Date;

public class MovieSlots {

	private int movieSlotID;
	private int movieID;
	private int hall;
	private int mall;
	private String slot;
	private String date;

	public MovieSlots() {}
	
	public MovieSlots(int movieSlotID, int movieID, int hall, int mall, String slot, String date) {
		this.movieSlotID = movieSlotID;
		this.movieID = movieID;
		this.hall = hall;
		this.mall = mall;
		this.slot = slot;
		this.date = date;
	}

	public int getMovieID() {
		return movieID;
	}

	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}

	public int getHall() {
		return hall;
	}

	public void setHall(int hall) {
		this.hall = hall;
	}

	public int getMall() {
		return mall;
	}

	public void setMall(int mall) {
		this.mall = mall;
	}

	public String getSlot() {
		return slot;
	}

	public void setSlot(String time) {
		this.slot = time;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getMovieSlotID() {
		return movieSlotID;
	}

	public void setMovieSlotID(int movieSlotID) {
		this.movieSlotID = movieSlotID;
	}

}