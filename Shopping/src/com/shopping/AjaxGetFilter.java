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
import com.beans.VendorBean;


/**
 * The simplest possible servlet.
 *
 * @author James Duncan Davidson
 */
@WebServlet("/AjaxGetFilter")
public class AjaxGetFilter extends HttpServlet {

   /* public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	PrintWriter out = response.getWriter();
	Vector<String[]> v = DBHelper.runQuery("SELECT * FROM book;");
	ProductBean [] beans = new ProductBean[v.size()];
	for(int i=0; i < v.size(); i++)  {
		String [] tmp = v.elementAt(i);
		beans[i] = new ProductBean(tmp[0],tmp[1],tmp[2],tmp[3],tmp[4],
			tmp[5],Float.parseFloat(tmp[6]),Float.parseFloat(tmp[7]),tmp[8]);
		}
	request.setAttribute("p_beans",beans);
	String toDo = "/WEB-INF/jsp/AjaxProducts.jsp";
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(toDo); 
        dispatcher.forward(request, response);  						    

    }*/
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException  {
	PrintWriter out = response.getWriter();
	Vector<String[]> v = DBHelper.runQuery(" select distinct c.category_id, c.category_name from book b, category c where b.category_id = c.category_id;");
	CategoryBean [] beans = new CategoryBean[v.size()];
	for(int i=0; i < v.size(); i++)  {
		String [] tmp = v.elementAt(i);
		beans[i] = new CategoryBean(Integer.parseInt(tmp[0]),tmp[1]);
		}
     Vector<String[]> vendor = DBHelper.runQuery(" select distinct v.vendor_id, v.vendor_name from book b, vendor v where b.vendor_id = v.vendor_id;");
	VendorBean [] vbeans = new VendorBean[vendor.size()];
	for(int i=0; i < vendor.size(); i++)  {
		String [] tmp = vendor.elementAt(i);
		vbeans[i] = new VendorBean(Integer.parseInt(tmp[0]),tmp[1]);
        System.out.println("Vendor:Ajaxgetfilter"+tmp[0]+" "+tmp[1]);
		}
    request.setAttribute("vendor_beans",vbeans);
	request.setAttribute("category_beans",beans);
	String toDo = "/AjaxFilter.jsp";
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(toDo); 
        dispatcher.forward(request, response);  						    

    }
   
}



