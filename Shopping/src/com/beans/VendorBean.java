package com.beans;

public class VendorBean implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String vendorName;
    private int vendorId;

	public VendorBean() {}
	public VendorBean(int vendorId,String vendorName) {
		this.vendorId = vendorId;
        this.vendorName = vendorName;
		}
		
	public int getVendorId() { return vendorId; }
	public String getVendorName() { return vendorName; }
	
	
	public void setVendorId(int i) { vendorId = i; }
	public void setVendorName(String s) { vendorName = s; }
	}
