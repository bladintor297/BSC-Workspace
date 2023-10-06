package com.bsc.beans;

public class Bookings {
	
	private int BookingID;
	private int UserID;
	private int MovieSlotID;
	private String PaymentID;
	private String Seat;
	private double Amount;
	private String BookingDate;
	private int Status;
	private Movies movie;
	private int MovieID;
	private String Title;
	private String Description;
	private String ReleaseDate;
	private int Classification;
	private String Genre;
	private String ImageLandscape;
	private String ImagePortrait;
	private String slot;
	private String mall;
	private String hall; 
	private String custName;
	private String custEmail;
    
	
	public Bookings(int bookingID, int userID, int movieSlotID, String paymentID, String seat, double amount,
			String bookingDate, int status, int movieID, String title, String description, String releaseDate, 
			int classification, String genre, String imageLandscape, String imagePortrait, String Slot, String Mall, 
			String Hall, String CustName, String CustEmail) {
		super();
		BookingID = bookingID;
		UserID = userID;
		MovieSlotID = movieSlotID;
		PaymentID = paymentID;
		Seat = seat;
		Amount = amount;
		BookingDate = bookingDate;
		Status = status;
		MovieID = movieID;
		Title = title;
		Description = description;
		ReleaseDate = releaseDate;
		Classification = classification;
		Genre = genre;
		ImageLandscape = imageLandscape;
		ImagePortrait = imagePortrait;
		slot = Slot;
		mall = Mall;
		hall = Hall;
		custName = CustName;
		custEmail = CustEmail;
	}



	// For Select From
	public Bookings(int bookingID, int userID, int movieSlotID, String paymentID, 
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
	public Bookings(int userID, int movieSlotID, String paymentID, 
			String seat, double amount, String bookingDate, int status) {
		UserID = userID;
		MovieSlotID = movieSlotID;
		PaymentID = paymentID;
		Seat = seat;
		Amount = amount;
		BookingDate = bookingDate;
		Status = status;
	}
	
	public Movies getMovie() {
        return movie;
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
	public String getPaymentID() {
		return PaymentID;
	}
	public void setPaymentID(String paymentID) {
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
	
	public int getMovieID() {
		return MovieID;
	}
	public void setMovieID(int movieID) {
		MovieID = movieID;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getReleaseDate() {
		return ReleaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		ReleaseDate = releaseDate;
	}
	public int getClassification() {
		return Classification;
	}
	public void setClassification(int classification) {
		Classification = classification;
	}
	public String getGenre() {
		return Genre;
	}
	public void setGenre(String genre) {
		Genre = genre;
	}
	public String getImageLandscape() {
		return ImageLandscape;
	}
	public void setImageLandscape(String imageLandscape) {
		ImageLandscape = imageLandscape;
	}
	public String getImagePortrait() {
		return ImagePortrait;
	}
	public void setImagePortrait(String imagePortrait) {
		ImagePortrait = imagePortrait;
	}



	public String getSlot() {
		return slot;
	}



	public void setSlot(String slot) {
		this.slot = slot;
	}



	public String getMall() {
		return mall;
	}



	public void setMall(String mall) {
		this.mall = mall;
	}



	public String getHall() {
		return hall;
	}



	public void setHall(String hall) {
		this.hall = hall;
	}



	public String getCustName() {
		return custName;
	}



	public void setCustName(String custName) {
		this.custName = custName;
	}



	public String getCustEmail() {
		return custEmail;
	}



	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}
	
	
}
