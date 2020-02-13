package com.beans;

public class BillingBean implements java.io.Serializable {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String firstName,lastName;
    private String address,address2,city,state,zip;
    private String area,prefix,phone;

	public BillingBean() {}
	public BillingBean(String firstName,String lastName,String address,String address2,String city,String state,String zip,String area,String prefix,String phone) {
		this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.address2 = address2;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.area = area;
        this.prefix = prefix;
        this.phone = phone;
		}
		
	public String getFirstName() { return firstName; }
	public String getLastName() { return lastName; }
    public String getAddress() { return address; }
    public String getAddress2() { return address2; }
    public String getCity() { return city; }
    public String getState() { return state; }
    public String getZip() { return zip; }
    public String getArea() { return area; }
    public String getPrefix() { return prefix; }
    public String getPhone() { return phone; }
	
	
	public void setFirstName(String i) { firstName = i; }
	public void setLastName(String s) { lastName = s; }
    public void setAddress(String i) { address = i; }
	public void setAddress2(String s) { address2 = s; }
    public void setCity(String i) { city = i; }
    public void setState(String i) { state = i; }
	public void setZip(String s) { zip = s; }
    public void setArea(String i) { area = i; }
	public void setPrefix(String s) { prefix = s; }
    public void setPhone(String s) { phone = s; }
    
    
	}
