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

@WebServlet("/GetCartCount")
public class GetCartCount extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	PrintWriter out = response.getWriter();
    HttpSession session = request.getSession(true);
    ShoppingCart cart;
    List itemsOrdered;
    String result="";
    int cartCount=0;
    ItemOrder order;
        cart = (ShoppingCart) session.getAttribute("shoppingcart");
         System.out.println("From GetCartCount :: Count ");
        if(cart == null){
            result = "Your Cart: 0";
        }else{
            int count = 0;
            itemsOrdered = cart.getItemsOrdered();
            count = itemsOrdered.size();
            for(int i=0;i<count;i++){
                    order = (ItemOrder)itemsOrdered.get(i);
                    System.out.println("cart 1 sku"+order.getCartSku());
                    System.out.println("cart 1 retail"+order.getCartRetail());
                    System.out.println("cart 1 qty"+order.getCartQty());
                cartCount = cartCount+order.getCartQty();
            }
            result = "Your Cart:"+cartCount;
            System.out.println("cartCount"+cartCount);
        }
    
        out.println(result); 						         
       }   
}



