package com.domain;

public class Student {
	
	
	private int id;
	private String sname;
	private int snumber;
	private int sage;
	private String ssex;
	private String sclass;
	private String phone;
	private int dor_rid;
	private String dor_number;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getSnumber() {
		return snumber;
	}
	public void setSnumber(int snumber) {
		this.snumber = snumber;
	}
	public int getSage() {
		return sage;
	}
	public void setSage(int sage) {
		this.sage = sage;
	}
	public String getSsex() {
		return ssex;
	}
	public void setSsex(String ssex) {
		this.ssex = ssex;
	}
	public String getSclass() {
		return sclass;
	}
	public void setSclass(String sclass) {
		this.sclass = sclass;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getDor_rid() {
		return dor_rid;
	}
	public void setDor_rid(int dor_rid) {
		this.dor_rid = dor_rid;
	}
	public String getDor_number() {
		return dor_number;
	}
	public void setDor_number(String dor_number) {
		this.dor_number = dor_number;
	}
	
	
	@Override
	public String toString() {
		return "Student [id=" + id + ", sname=" + sname + ", snumber=" + snumber + ", sage=" + sage + ", ssex=" + ssex
				+ ", sclass=" + sclass + ", phone=" + phone + ", dor_rid=" + dor_rid + ", dor_number=" + dor_number
				+ "]";
	}
	
}
