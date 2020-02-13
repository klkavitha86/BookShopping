package com.beans;

public class ViewCartBean implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cartSku,cartIdentifier,cartImage;
	private float cartRetail;
    private int cartOnhand,cartQty;
	public ViewCartBean() {}
	public ViewCartBean(String sku,float retail,int qty,int onhand,String identifier,String image) {
		this.cartSku = sku;
        this.cartIdentifier = identifier;
		this.cartRetail = retail;
        this.cartImage = image;
        this.cartOnhand = onhand;
        this.cartQty = qty;
		}
		
	public String getCartSku() { return cartSku; }
	public String getCartIdentifier() { return cartIdentifier; }
	public String getCartImage() { return cartImage; }
	public float getCartRetail() { return cartRetail; }
    public int getCartOnhand() { return cartOnhand; }
    public int getCartQty() { return cartQty; }
    public double getTotalCost(){ return (cartQty*cartRetail);}
	
	public void setCartSku(String s) { cartSku = s; }
	public void setCartIdentifier(String s) { cartIdentifier = s; }
	public void setCartImage(String s) { cartImage = s; }
	public void setCartRetail(float r) { cartRetail = r; }  
    public void setCartOnhand(int r) { cartOnhand = r; } 
    public void setCartQty(int r) { cartQty = r; } 
	}
