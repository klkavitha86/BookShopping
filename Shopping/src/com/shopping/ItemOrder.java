package com.shopping;

public class ItemOrder{
	private String cartSku,cartIdentifier,cartImage;
	private float cartRetail;
    private int cartQty,cartOnhand;
    
	public ItemOrder(String sku,int qty,float retail,String identifier,String image,int onhand) {
        setCartSku(sku);
        setCartIdentifier(identifier);
        setCartImage(image);
        setCartRetail(retail);
        setCartQty(qty);
        setCartOnhand(onhand);
		}
		
	public String getCartSku() { return cartSku; }
	public String getCartIdentifier() { return cartIdentifier; }
	public String getCartImage() { return cartImage; }
	public float getCartRetail() { return cartRetail; }
    public int getCartQty() { return cartQty; }
    public int getCartOnhand() { return cartOnhand; }
    public double getTotalCost(){ return (getCartQty() * getCartRetail());}
	
	public void setCartSku(String s) { cartSku = s; }
	public void setCartIdentifier(String s) { cartIdentifier = s; }
	public void setCartImage(String s) { cartImage = s; }
	public void setCartRetail(float r) { cartRetail = r; }  
    public void setCartQty(int r) { cartQty = r; } 
    public void setCartOnhand(int r) { cartOnhand = r; } 
	}
