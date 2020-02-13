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

import com.beans.ProductBean;


/**
 * The simplest possible servlet.
 *
 * @author James Duncan Davidson
 */
@WebServlet("/GetBookDetail")
public class GetBookDetail extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	PrintWriter out = response.getWriter();
    String sku = request.getParameter("sku");
   System.out.println("From BookDetail"+sku);
    
   
    String bookDetailQuery = "select b.sku,b.manufacture_identifier,b.vendor_id,b.category_id,b.description,b.features,b.cost,b.retail_cost,b.file_name,o.on_hand_quantity from  book b, on_hand_quantity o where b.sku = o.sku and b.sku='" +sku+ "';";
     System.out.println("bookDetailQuery"+bookDetailQuery);
    
	Vector<String[]> v = DBHelper.runQuery(bookDetailQuery);
     System.out.println("result size"+v.size());
    if(v.size() == 0){
         String noStockQuery = "select b.sku,b.manufacture_identifier,b.vendor_id,b.category_id,b.description,b.features,b.cost,b.retail_cost,b.file_name from  book b where b.sku='" +sku+ "';";
     System.out.println("NoStockQuery"+noStockQuery);
    
     Vector<String[]> vector = DBHelper.runQuery(noStockQuery);
     ProductBean [] beans = new ProductBean[vector.size()];
     System.out.println("vector.size()"+vector.size());
	for(int i=0; i < vector.size(); i++)  {
		String [] tmp =vector.elementAt(i);
		beans[i] = new ProductBean(tmp[0],tmp[1],tmp[2],tmp[3],tmp[4],
			tmp[5],Float.parseFloat(tmp[6]),Float.parseFloat(tmp[7]),tmp[8],-1);
		}	
         request.setAttribute("p_beans",beans);
    }else{
        ProductBean [] beans = new ProductBean[v.size()];
	for(int i=0; i < v.size(); i++)  {
		String [] tmp = v.elementAt(i);
		beans[i] = new ProductBean(tmp[0],tmp[1],tmp[2],tmp[3],tmp[4],
			tmp[5],Float.parseFloat(tmp[6]),Float.parseFloat(tmp[7]),tmp[8],Integer.parseInt(tmp[9]));
		}	
     request.setAttribute("p_beans",beans);
    }
    
	String toDo = "/BookDetail.jsp";
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(toDo); 
        dispatcher.forward(request, response);  						    
    
            
	
    }
    
   
}



