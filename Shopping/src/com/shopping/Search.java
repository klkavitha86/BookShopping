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
@WebServlet("/Search")
public class Search extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	PrintWriter out = response.getWriter();
     
     String searchString = request.getParameter("search");
     System.out.println("Search String"+searchString);
            
     if( searchString !=null){
      //String searchBookListQuery = "select b.sku,b.manufacture_identifier,b.retail_cost,b.file_name,o.on_hand_quantity from  book b join category c on b.category_id = c.category_id left join on_hand_quantity o on b.sku = o.sku where b.description like '%" +searchString + "%' or b.manufacture_identifier like '%"+ searchString+ "%' or b.features like '%"+ searchString+"%' ;";
    	 String searchBookListQuery = "select b.sku,b.manufacture_identifier,b.retail_cost,b.file_name,o.on_hand_quantity from  book b join category c on b.category_id = c.category_id left join on_hand_quantity o on b.sku = o.sku where b.description like '%" +searchString + "%' or b.manufacture_identifier like '%"+ searchString+ "%' or b.features like '%"+ searchString+"%' or c.category_name like '%"+ searchString+ "%';";
    	    
    	 System.out.println("bookListQuery category"+searchBookListQuery);
	Vector<String[]> v = DBHelper.runQuery(searchBookListQuery);
     System.out.println("bookListQuery size"+v.size());
    if(v.size() > 0){
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
    }else{
    request.setAttribute("no_records","No books found!!");
    }
     }
	String toDo = "/BookList.jsp";
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(toDo); 
        dispatcher.forward(request, response);  						    

    }
   
}



