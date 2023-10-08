package com.bsc.beans;

public class Notifications {
	
	private int notificationID;
	private String content;
	private String title;
	private String dateTime;
	private int isRead;
	private int userID;
	
	public Notifications() {}

	public Notifications(int notificationID, String title, String content, String dateTime, int isRead, int userID) {
		this.notificationID = notificationID;
		this.content = content;
		this.title = title;
		this.dateTime = dateTime;
		this.isRead = isRead;
		this.userID = userID;
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

	public int getIsRead() {
		return isRead;
	}

	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}


	
	
}
