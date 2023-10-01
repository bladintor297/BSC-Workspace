package com.bsc.beans;

import java.util.Objects;

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
	
	@Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Malls otherMall = (Malls) obj;
        return MallID == otherMall.MallID &&
               Objects.equals(MallName, otherMall.MallName) &&
               Objects.equals(Address, otherMall.Address);
    }

    @Override
    public int hashCode() {
        return Objects.hash(MallID, MallName, Address);
    }

}
