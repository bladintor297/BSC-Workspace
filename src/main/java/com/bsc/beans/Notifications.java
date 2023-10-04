package com.bsc.beans;

public class Notifications {
    private int notificationID;
	private String content;
    private String tittle;
    private String type;
    
    public Notifications(int notificationID, String content, String tittle, String type) {
		super();
		this.notificationID = notificationID;
		this.content = content;
		this.tittle = tittle;
		this.type = type;
	}
    
    // Getter and Setter methods
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

	public String getTittle() {
		return tittle;
	}

	public void setTittle(String tittle) {
		this.tittle = tittle;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
