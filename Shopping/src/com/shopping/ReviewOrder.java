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

import com.beans.BillingBean;
import com.beans.ShippingBean;
import com.beans.ViewCartBean;


/**
 * The simplest possible servlet.
 *
 * @author James Duncan Davidson
 */
@WebServlet("/ReviewOrder")
public class ReviewOrder extends HttpServlet {

    public void doPost(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	PrintWriter out = response.getWriter();

    String result="";
    System.out.println("From ReviewOrder");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String address = request.getParameter("address");
    String address2 = request.getParameter("address2");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zip = request.getParameter("zip");
    String area = request.getParameter("area");
    String prefix = request.getParameter("prefix");
    String phone = request.getParameter("phone");
    String payment = request.getParameter("payment");
    String card = request.getParameter("card");
    String month = request.getParameter("month");
    String year = request.getParameter("year"); 
    String billing = request.getParameter("billing");
    String bfname = request.getParameter("bfname");
    String blname = request.getParameter("blname");
    String baddress = request.getParameter("baddress");
    String baddress2 = request.getParameter("baddress2");
    String bcity = request.getParameter("bcity");
    String bstate = request.getParameter("bstate");
    String bzip = request.getParameter("bzip");
    String barea = request.getParameter("barea");
    String bprefix = request.getParameter("bprefix");
    String bphone = request.getParameter("bphone");
    String encrypted = card.substring(12);
    String finalcard = "XXXX-XXXX-XXXX-"+encrypted;
    System.out.println("fname"+fname);
    System.out.println("lname"+lname);
    System.out.println("address"+address);
    System.out.println("address2"+address2);
    System.out.println("city"+city);
    System.out.println("state"+state);
    System.out.println("zip"+zip);
    System.out.println("area"+area);
    System.out.println("prefix"+prefix);
    System.out.println("phone"+phone);
    System.out.println("payment"+payment);
    System.out.println("card"+card);
    System.out.println("month"+month);
    System.out.println("year"+year);
    System.out.println("billing"+billing);
    System.out.println("bfname"+bfname);
    System.out.println("blname"+blname);
    System.out.println("baddress"+baddress);
    System.out.println("baddress2"+baddress2);
    System.out.println("bcity"+bcity);
    System.out.println("bstate"+bstate);
    System.out.println("bzip"+bzip);
    System.out.println("barea"+barea);
    System.out.println("bprefix"+bprefix);
    System.out.println("bphone"+bphone);
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
         System.out.println("ReviewOrder sku"+order.getCartSku());
         System.out.println("ReviewOrder retail"+order.getCartRetail());
        System.out.println("ReviewOrder qty"+order.getCartQty());
		beans[i] = new ViewCartBean(order.getCartSku(),order.getCartRetail(),order.getCartQty(),order.getCartOnhand(),order.getCartIdentifier(),order.getCartImage());
		}
        
        BillingBean billbean  = new BillingBean(bfname,blname,baddress,baddress2,bcity,bstate,bzip,barea,bprefix,bphone);
        ShippingBean shipbean  = new ShippingBean(fname,lname,address,address2,city,state,zip,area,prefix,phone,payment,card,finalcard,month,year,billing);
        session.setAttribute("shipping_bean",shipbean); 
        session.setAttribute("billing_bean",billbean); 
        request.setAttribute("view_cart_beans",beans);    	
    } else{
        request.setAttribute("cart_empty",empty);
    }  
        String toDo = "/ReviewOrder.jsp";
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(toDo); 
        dispatcher.forward(request, response);  		
}
}



