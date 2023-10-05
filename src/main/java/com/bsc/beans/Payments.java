package com.bsc.beans;

public class Payments {

	private String PaymentID;
	private int BookingID;
	private int UserID;
	private double Price;
	private String PaymentDate;
	private int Method;
	
	public Payments () {}
	
	public Payments(String paymentID, int bookingID, int userID, double price, String paymentDate) {
		PaymentID = paymentID;
		BookingID = bookingID;
		UserID = userID;
		Price = price;
		PaymentDate = paymentDate;
	}

	public String getPaymentID() {
		return PaymentID;
	}

	public void setPaymentID(String paymentID) {
		PaymentID = paymentID;
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

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		Price = price;
	}

	public String getPaymentDate() {
		return PaymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		PaymentDate = paymentDate;
	}

	public int getMethod() {
		return Method;
	}

	public void setMethod(int method) {
		Method = method;
	}
	
	

}
