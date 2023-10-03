package com.bsc.beans;

public class MovieSlots {

	private int movieSlotID;
	private int movieID;
	private int hall;
	private int mall;
	private String slot;
	private String date;
	
	
	//Foreign Keys Data
	
	private String hallCategory;
	private String hallName;
	private String movieTitle;
	private String mallName;
	
	
	public MovieSlots() {}
	
	public MovieSlots(int movieSlotID, int movieID, int hall, int mall, String slot, String date) {
		this.movieSlotID = movieSlotID;
		this.movieID = movieID;
		this.hall = hall;
		this.mall = mall;
		this.slot = slot;
		this.date = date;
	}
	

	public MovieSlots(int movieSlotID, int movieID, int hall, int mall, String slot, String date, String hallCategory,
			String movieTitle, String hallName, String mallName) {
		this.movieSlotID = movieSlotID;
		this.movieID = movieID;
		this.hall = hall;
		this.mall = mall;
		this.slot = slot;
		this.date = date;
		this.hallCategory = hallCategory;
		this.hallName = hallName;
		this.movieTitle = movieTitle;
		this.mallName = mallName;
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
	
	
	/* --- Foreign Keys Getters and Setters --- */

	public String getHallCategory() {
		return hallCategory;
	}

	public void setHallCategory(String hallCategory) {
		this.hallCategory = hallCategory;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMallName() {
		return mallName;
	}

	public void setMallName(String mallName) {
		this.mallName = mallName;
	}


}