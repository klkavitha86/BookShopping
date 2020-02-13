package com.beans;

public class ProductBean implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sku, category, vendor, identifier, description,
		features, image;
	private float cost, retail;
    private int onhand;
	public ProductBean() {}
	public ProductBean(String sku,String identifier, String vendor,String category, String description, String features, float cost, float retail,String image,int onhand) {
		this.sku = sku;
        this.identifier = identifier;
        this.vendor = vendor;
		this.category = category;
		this.description = description;
		this.features = features;
		this.cost = cost;
		this.retail = retail;
        this.image = image;
        this.onhand = onhand;
		}

	public String getSku() { return sku; }
	public String getCategory() { return category; }
	public String getVendor() { return vendor; }
	public String getIdentifier() { return identifier; }
	public String getDescription() { return description; }
	public String getFeatures() { return features; }
	public String getImage() { return image; }
	public float getCost() { return cost; }
	public float getRetail() { return retail; }
    public int getOnhand() { return onhand; }
	
	public void setSku(String s) { sku = s; }
	public void setCategory(String s) { category = s; }
	public void setVendor(String s) { vendor = s; }
	public void setIdentifier(String s) { identifier = s; }
	public void setDescription(String s) { description = s; }
	public void setFeatures(String s) { features = s; }
	public void setImage(String s) { image = s; }
	public void setCost(float c) { cost = c; }
	public void setRetail(float r) { retail = r; }  
    public void setOnhand(int r) { onhand = r; } 
	
	}
