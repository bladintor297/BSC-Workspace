package com.bsc.beans;

public class Seats {
	
	private int SeatID;
	private double price;
	private String SeatNumber;
	
	
	public Seats(int seatID, double price, String seatNumber) {
		this.SeatID = seatID;
		this.price = price;
		this.SeatNumber = seatNumber;
	}
	
	public Seats(String seatNumber) {
		this.SeatNumber = seatNumber;
	}
	
	public int getSeatID() {
		return SeatID;
	}
	public void setSeatID(int seatID) {
		SeatID = seatID;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getSeatNumber() {
		return SeatNumber;
	}
	public void setSeatNumber(String seatNumber) {
		SeatNumber = seatNumber;
	}
	
	

}
