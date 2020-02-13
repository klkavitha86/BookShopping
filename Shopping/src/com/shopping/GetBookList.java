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

import com.beans.ThumbnailBean;

/**
 * The simplest possible servlet.
 *
 * @author James Duncan Davidson
 */
@WebServlet("/GetBookList")
public class GetBookList extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	PrintWriter out = response.getWriter();
     
     
     int categoryId = -1,vendorId = -1;
     String categoryName = request.getParameter("category");
     String catId = request.getParameter("id");
     if(catId!=null){
      categoryId = Integer.parseInt(request.getParameter("id"));
     }
      String vendorName = request.getParameter("vendor");
       String venId = request.getParameter("vid");
     if(venId!=null){
    
      vendorId = Integer.parseInt(request.getParameter("vid"));
     }
     
     
     if( categoryName !=null){
      String catBookListQuery = "select b.sku,b.manufacture_identifier,b.retail_cost,b.file_name,o.on_hand_quantity from  book b join category c on b.category_id = c.category_id left join on_hand_quantity o on b.sku = o.sku where c.category_name ='" +categoryName+ "' and b.category_id =" +categoryId+";";
    System.out.println("bookListQuery category"+catBookListQuery);
	Vector<String[]> v = DBHelper.runQuery(catBookListQuery);
	ThumbnailBean [] beans = new ThumbnailBean[v.size()];
	for(int i=0; i < v.size(); i++)  {
		String [] tmp = v.elementAt(i);
        if(tmp[4]== null){
          beans[i] = new ThumbnailBean(tmp[0],tmp[1],Float.parseFloat(tmp[2]),tmp[3],-1);
        }else{
          beans[i] = new ThumbnailBean(tmp[0],tmp[1],Float.parseFloat(tmp[2]),tmp[3],Integer.parseInt(tmp[4]));  
        }
    }
    request.setAttribute("thumbnail_beans",beans);
     }
    System.out.println("Category from url"+categoryName);
    System.out.println("id from url"+categoryId);

    if(vendorName !=null){
    String venBookListQuery = "select b.sku,b.manufacture_identifier,b.retail_cost,b.file_name,o.on_hand_quantity from  book b join vendor v on b.vendor_id = v.vendor_id left join on_hand_quantity o on b.sku = o.sku where v.vendor_name ='" +vendorName+ "' and b.vendor_id =" +vendorId+";";
    System.out.println("bookListQuery vendor"+venBookListQuery);
	Vector<String[]> v = DBHelper.runQuery(venBookListQuery);
	ThumbnailBean [] beans = new ThumbnailBean[v.size()];
	for(int i=0; i < v.size(); i++)  {
		String [] tmp = v.elementAt(i);
        if(tmp[4]== null){
          beans[i] = new ThumbnailBean(tmp[0],tmp[1],Float.parseFloat(tmp[2]),tmp[3],-1);
        }else{
          beans[i] = new ThumbnailBean(tmp[0],tmp[1],Float.parseFloat(tmp[2]),tmp[3],Integer.parseInt(tmp[4]));  
        }
		}
    request.setAttribute("thumbnail_beans",beans);
    }
	
	String toDo = "/BookList.jsp";
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(toDo); 
        dispatcher.forward(request, response);  						    

    }
   
}



