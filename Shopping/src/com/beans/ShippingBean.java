package com.beans;

public class ShippingBean implements java.io.Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String firstName,lastName,month,year,billing;
    private String address,address2,city,state,zip;
    private String area,prefix,phone,payment,card,finalcard;

	public ShippingBean() {}
	public ShippingBean(String firstName,String lastName,String address,String address2,String city,String state,String zip,String area,String prefix,String phone,String payment,String card,String finalcard,String month,String year,String billing) {
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
        this.payment = payment;
        this.card = card;
        this.finalcard = finalcard;
        this.month = month;
        this.year = year;
        this.billing = billing;
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
    public String getPayment() { return payment; }
    public String getCard() { return card; }
    public String getMonth() { return month; }
    public String getYear() { return year; }
    public String getBilling() { return billing; }
    public String getFinalcard() { return finalcard; }
    
	
	
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
    public void setPayment(String s) { payment = s; }
    public void setCard(String s) { card = s; }
    public void setMonth(String s) { month = s; }
    public void setYear(String s) { year = s; }
    public void setBilling(String s) { billing = s; }
    public void setFinalcard(String s) { finalcard = s; }
	}
