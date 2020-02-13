package com.beans;

public class ThumbnailBean implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String thumbSku,thumbIdentifier,thumbImage;
	private float thumbRetail;
    private int thumbOnhand;
	public ThumbnailBean() {}
	public ThumbnailBean(String sku,String identifier,float retail,String image,int onhand) {
		this.thumbSku = sku;
        this.thumbIdentifier = identifier;
		this.thumbRetail = retail;
        this.thumbImage = image;
        this.thumbOnhand = onhand;
		}
		
	public String getThumbSku() { return thumbSku; }
	public String getThumbIdentifier() { return thumbIdentifier; }
	public String getThumbImage() { return thumbImage; }
	public float getThumbRetail() { return thumbRetail; }
    public int getThumbOnhand() { return thumbOnhand; }
	
	public void setThumbSku(String s) { thumbSku = s; }
	public void setThumbIdentifier(String s) { thumbIdentifier = s; }
	public void setThumbImage(String s) { thumbImage = s; }
	public void setThumbRetail(float r) { thumbRetail = r; }  
    public void setThumbOnhand(int r) { thumbOnhand = r; } 
	}
