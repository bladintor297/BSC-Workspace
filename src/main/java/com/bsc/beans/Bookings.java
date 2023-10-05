package com.bsc.beans;

public class Bookings {
	
	private int BookingID;
	private int UserID;
	private int MovieSlotID;
	private int PaymentID;
	private String Seat;
	private double Amount;
	private String BookingDate;
	private int Status;
	
	// For Select From
	public Bookings(int bookingID, int userID, int movieSlotID, int paymentID, 
			String seat, double amount, String bookingDate, int status) {
		BookingID = bookingID;
		UserID = userID;
		MovieSlotID = movieSlotID;
		PaymentID = paymentID;
		Seat = seat;
		Amount = amount;
		BookingDate = bookingDate;
		Status = status;
	}
	
	// For Insert Into
	public Bookings(int userID, int movieSlotID, int paymentID, 
			String seat, double amount, String bookingDate, int status) {
		UserID = userID;
		MovieSlotID = movieSlotID;
		PaymentID = paymentID;
		Seat = seat;
		Amount = amount;
		BookingDate = bookingDate;
		Status = status;
	}
	
	public int getBookingID() {
		return BookingID;
	}
	public void setBookingID(int bookingID) {
		BookingID = bookingID;
	}
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public int getMovieSlotID() {
		return MovieSlotID;
	}
	public void setMovieSlotID(int movieSlotID) {
		MovieSlotID = movieSlotID;
	}
	public int getPaymentID() {
		return PaymentID;
	}
	public void setPaymentID(int paymentID) {
		PaymentID = paymentID;
	}
	public String getSeat() {
		return Seat;
	}
	public void setSeat(String seat) {
		Seat = seat;
	}
	public double getAmount() {
		return Amount;
	}
	public void setAmount(double amount) {
		Amount = amount;
	}
	public String getBookingDate() {
		return BookingDate;
	}
	public void setBookingDate(String bookingDate) {
		BookingDate = bookingDate;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	
	
}
