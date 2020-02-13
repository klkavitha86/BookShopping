package com.shopping;

/* Name :Kavitha Venkatesan
   Class Account :jadrn054
   Semester: Spring 2017
   Project#3 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.beans.ViewCartBean;


/**
 * The simplest possible servlet.
 *
 * @author James Duncan Davidson
 */
@WebServlet("/ConfirmOrder")
public class ConfirmOrder extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	PrintWriter out = response.getWriter();
	
    int cartCount = 0,count = 0;
    String toDo = "";
    boolean isSuccess = false;
    System.out.println("From ConfirmOrder");
   
    HttpSession session = request.getSession(true);
    List itemsOrdered;
    ItemOrder order; 
    ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingcart");
            
     
            if(cart !=null){
                itemsOrdered = cart.getItemsOrdered();
                count = itemsOrdered.size();
                System.out.println("inside Confirm Order::No of items "+count);
                for(int i=0;i<count;i++){
                    order = (ItemOrder)itemsOrdered.get(i);
                    cartCount = cartCount+order.getCartQty();
            
                }
                System.out.println("inside Confirm Order::cartCount"+cartCount);
            }
    if(cart !=null){
        itemsOrdered = cart.getItemsOrdered();
         count = itemsOrdered.size();
                
       
         DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
        
        ViewCartBean [] beans = new ViewCartBean[count];
	    for(int i=0;i<count;i++){
            
		order = (ItemOrder)itemsOrdered.get(i);
         System.out.println("ConfirmOrder sku"+order.getCartSku());
         System.out.println("ConfirmOrder retail"+order.getCartRetail());
         System.out.println("ConfirmOrder qty"+order.getCartQty());
		

               if(order.getCartQty() <= order.getCartOnhand()){
               String updateOnHand = "update on_hand_quantity set on_hand_quantity = on_hand_quantity - '"+order.getCartQty()+"',last_date_modified = '"+dateFormat.format(date)+"' where sku ='"+order.getCartSku()+"'"; 
                System.out.println(" onhand update query"+updateOnHand);
                
                 String updateMerchandiseOut = "insert into merchandise_out (sku,quantity,sent_out_date) VALUES ('"+order.getCartSku()+"','"+order.getCartQty()+"','"+dateFormat.format(date)+"')";
			     System.out.println(" updateMerchandiseOut query"+updateMerchandiseOut);
                
                try{
                 isSuccess = DBHelper.merchandiseTransaction(updateOnHand,updateMerchandiseOut);
                  } catch (Exception e) {
                e.printStackTrace();
                }
		      } 
              beans[i] = new ViewCartBean(order.getCartSku(),order.getCartRetail(),order.getCartQty(),order.getCartOnhand(),order.getCartIdentifier(),order.getCartImage());
              
              cartCount = cartCount - order.getCartQty();
            System.out.println("inside Confirm Order::count"+cartCount+"sku"+order.getCartSku());
            //cart.deleteItem(order.getCartSku());
          } 
         request.setAttribute("cart_beans",beans);    	
         if(isSuccess){
               
                 toDo = "/ConfirmOrder.jsp";
                  request.setAttribute("sent_confirm","The merchandise is sent out successfully!!"); 
                   request.setAttribute("cart_count",cartCount); 
                  RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(toDo); 
                dispatcher.forward(request, response); 
                return;
            }else{
                 toDo = "/ReviewOrder.jsp";
                 request.setAttribute("sent_error","Error while sending out merchandise.Please try again.");
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(toDo); 
                dispatcher.forward(request, response);  
                return;
            }   	
        }
    }
}



