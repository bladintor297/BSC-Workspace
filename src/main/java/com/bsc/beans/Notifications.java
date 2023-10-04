package com.bsc.beans;

public class Notifications {
	
	private int notificationID;
	private String content;
	private String title;
	private String dateTime;
	
	public Notifications() {}
	
	public Notifications(int notificationID, String content, String title, String dateTime) {
		this.notificationID = notificationID;
		this.content = content;
		this.title = title;
		this.dateTime = dateTime;
	}

	public int getNotificationID() {
		return notificationID;
	}

	public void setNotificationID(int notificationID) {
		this.notificationID = notificationID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}


	
	
}