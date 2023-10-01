package com.bsc.beans;

public class Malls {
	
	private int MallID;
	private String MallName;
	private String Address;
	
	public Malls (int MallID, String MallName, String Address) {
		this.MallID = MallID;
        this.MallName = MallName;
        this.Address = Address;
	}
	
	
	public String getMallName() {
		return MallName;
	}
	public void setMallName(String mallName) {
		MallName = mallName;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public int getMallID() {
		return MallID;
	}
	public void setMallID(int mallID) {
		MallID = mallID;
	}

}
