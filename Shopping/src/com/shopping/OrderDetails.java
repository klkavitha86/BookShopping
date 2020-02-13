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
@WebServlet("/OrderDetails")
public class OrderDetails extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	PrintWriter out = response.getWriter();
    String action = request.getParameter("action");
    String sku = request.getParameter("sku");
    int qty = Integer.parseInt(request.getParameter("qty"));
    float retail = Float.parseFloat(request.getParameter("retail"));
    String identifier = request.getParameter("identifier");
    String image = request.getParameter("image");
    int onhand = Integer.parseInt(request.getParameter("onhand"));
    int count=0;
    String result="failure";
    System.out.println("From OrderDetails"+sku);
    System.out.println("action"+action);
    
    HttpSession session = request.getSession(true);
    ShoppingCart cart;
    List itemsOrdered;
    int cartCount=0;
    ItemOrder order;
            
     System.out.println("Initial result"+result); 
    synchronized(session){
        cart = (ShoppingCart) session.getAttribute("shoppingcart");
        if(cart == null){
            cart = new ShoppingCart();
            session.setAttribute("shoppingcart",cart);
            System.out.println("Step 1: cart null");
        }
    if(action.equalsIgnoreCase("add")){
        if(sku != null){
            cart.addItem(sku,qty,retail,identifier,image,onhand);
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
                    System.out.println("cart 1 sku"+order.getCartSku());
                    System.out.println("cart 1 retail"+order.getCartRetail());
                    System.out.println("cart 1 qty"+order.getCartQty());
                    
                   
                    cartCount = cartCount+order.getCartQty();
            
                }
            }else{
                System.out.println("value not available in session"); 
            }
            
        }
        
       } 
    } 
    System.out.println("add cart result"+result); 
    if(result.equalsIgnoreCase("success")){
    result = "status="+qty+" item added to cart !!"+"&count="+cartCount;
    
    }
    out.println(result); 						         
        }
    }   




