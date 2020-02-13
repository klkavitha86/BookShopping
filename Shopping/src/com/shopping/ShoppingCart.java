package com.shopping;

import java.util.*;

public class ShoppingCart{
    private ArrayList itemsOrdered;
    
    public ShoppingCart(){
        itemsOrdered = new ArrayList<ItemOrder>();
    }
    public List getItemsOrdered(){
        return(itemsOrdered);
    }
     
    public synchronized void addItem(String sku,int qty,float retail,String identifier,String image,int onhand){
        System.out.println("inside add shopping cart"+ sku+ qty+ retail+ identifier+ image+ onhand);
        ItemOrder order;
        for(int i=0; i < itemsOrdered.size();i++){
           
             order = (ItemOrder)itemsOrdered.get(i);
            System.out.println("order.getCartSku()"+order.getCartSku()+"sku"+sku);
            if(order.getCartSku().equals(sku)){
                 System.out.println("inside if");
                int oldQty = order.getCartQty();
                System.out.println("oldQty"+oldQty);
                order.setCartQty(qty+oldQty);
                return;
            }
        }
        ItemOrder newOrder = new ItemOrder(sku,qty,retail,identifier,image,onhand);
        itemsOrdered.add(newOrder);
    }
    
     public synchronized void editItem(String sku,int qty){
        ItemOrder order;
        for(int i=0; i < itemsOrdered.size();i++){
            order = (ItemOrder)itemsOrdered.get(i);
            if(order.getCartSku().equals(sku)){
                order.setCartQty(qty);
                return;
            }
        }
    }
    
    public synchronized void deleteItem(String sku){
        ItemOrder order;
        for(int i=0; i < itemsOrdered.size();i++){
            order = (ItemOrder)itemsOrdered.get(i);
            if(order.getCartSku().equals(sku)){
                itemsOrdered.remove(i);
                return;
            }
        }
    }
    
}

