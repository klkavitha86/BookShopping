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

import com.beans.CategoryBean;


/**
 * The simplest possible servlet.
 *
 * @author James Duncan Davidson
 */
@WebServlet("/AjaxGetCategory")
public class AjaxGetCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	Vector<String[]> v = DBHelper.runQuery(" select distinct c.category_id, c.category_name from book b, category c where b.category_id = c.category_id;");
	CategoryBean [] beans = new CategoryBean[v.size()];
	for(int i=0; i < v.size(); i++)  {
		String [] tmp = v.elementAt(i);
		beans[i] = new CategoryBean(Integer.parseInt(tmp[0]),tmp[1]);
		}
	request.setAttribute("category_beans",beans);
	String toDo = "/AjaxProducts.jsp";
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(toDo); 
        dispatcher.forward(request, response);  						    

    }
   
}



