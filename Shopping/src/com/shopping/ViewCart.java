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

import com.beans.ViewCartBean;

/**
 * The simplest possible servlet.
 *
 * @author James Duncan Davidson
 */
@WebServlet("/ViewCart")
public class ViewCart extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	PrintWriter out = response.getWriter();

    String result="";
    System.out.println("From ViewCart");
    
    HttpSession session = request.getSession(true);
    List itemsOrdered;
    ItemOrder order;
    String empty = "Your Shopping Cart is Empty!!";      
    ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingcart");
    if(cart !=null){
        itemsOrdered = cart.getItemsOrdered();
        int count = itemsOrdered.size();
                
        ViewCartBean [] beans = new ViewCartBean[count];
	    for(int i=0;i<count;i++){
            
		order = (ItemOrder)itemsOrdered.get(i);
         System.out.println("View Cart sku"+order.getCartSku());
         System.out.println("View Cart retail"+order.getCartRetail());
        System.out.println("View Cart qty"+order.getCartQty());
		beans[i] = new ViewCartBean(order.getCartSku(),order.getCartRetail(),order.getCartQty(),order.getCartOnhand(),order.getCartIdentifier(),order.getCartImage());
		}
        request.setAttribute("view_cart_beans",beans);    	
    } else{
         
        request.setAttribute("cart_empty",empty);
    } 
        String toDo = "/ViewCart.jsp";
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(toDo); 
        dispatcher.forward(request, response);  		
}
}



