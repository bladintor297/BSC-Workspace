package com.bsc.beans;

public class Users {
	
	private int userID;
	private String name;
	private String email;
	private String password;
	private String phone;
	private int role;
	
	public Users() {}
	
	public Users(String name, String email, String phone) {
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	
	public Users(int userID, String name, String email, String phone) {
		this.userID = userID;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}
	
	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}


	
	

}
