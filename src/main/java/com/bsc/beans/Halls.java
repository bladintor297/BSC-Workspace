package com.bsc.beans;

public class Halls {
	
	private int HallID;
	private String HallName;
	private String Category;
	private int Capacity;
	private int Status;
	
	
	public Halls(int hallID, String hallName, String category, int capacity, int status) {
		this.HallID = hallID;
		this.HallName = hallName;
		this.Category = category;
		this.Capacity = capacity;
		this.Status = status;
	}
	
	public String getHallName() {
		return HallName;
	}
	public void setHallName(String hallName) {
		HallName = hallName;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public int getCapacity() {
		return Capacity;
	}
	public void setCapacity(int capacity) {
		Capacity = capacity;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}

	public int getHallID() {
		return HallID;
	}

	public void setHallID(int hallID) {
		HallID = hallID;
	}

}
