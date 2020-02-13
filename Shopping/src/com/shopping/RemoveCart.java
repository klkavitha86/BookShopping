package com.shopping;

/* Name :Kavitha Venkatesan
   Class Account :jadrn054
   Semester: Spring 2017
   Project#3 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


/**
 * The simplest possible servlet.
 *
 * @author James Duncan Davidson
 */
@WebServlet("/RemoveCart")
public class RemoveCart extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	PrintWriter out = response.getWriter();
    String sku = request.getParameter("sku");
    int count = 0;
    int cartCount = 0;
    String result="failure";
    System.out.println("From DeleteCart"+sku);

    
    HttpSession session = request.getSession(true);
    ShoppingCart cart;
    List itemsOrdered;
    ItemOrder order;
            
    
    synchronized(session){
        cart = (ShoppingCart) session.getAttribute("shoppingcart");
        if(cart != null){
            
                 if(sku != null){
                    cart.deleteItem(sku);
                      itemsOrdered = cart.getItemsOrdered();
                      count = itemsOrdered.size();
                      result = "success";
                     ShoppingCart cart1 = (ShoppingCart) session.getAttribute("shoppingcart");
                    if(cart1 !=null){
                        itemsOrdered = cart1.getItemsOrdered();
                         count = itemsOrdered.size();
                        //result = "Your Cart:"+count;
                        for(int i=0;i<count;i++){
                            order = (ItemOrder)itemsOrdered.get(i);
                            System.out.println("cart delete sku"+order.getCartSku());
                   
                            cartCount = cartCount+order.getCartQty();
            
               
                        }
                    }
                   
                }   
            }				         
        }
    System.out.println("delete cart result"+result); 
    if(result.equalsIgnoreCase("success")){
    result = "status=Item deleted successfully!!&count="+cartCount;
    
    }
    out.println(result); 
    }   
}



