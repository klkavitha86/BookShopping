<%@ page import = "java.util.* " %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<! DOCTYPE html>
<html>
<!--    Name :Kavitha Venkatesan
   Class Account :jadrn054
   Semester: Spring 2017
   Project#3 
-->

<head>
	<title>Nerdy Book Club</title>

	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link type = "text/css" rel ="stylesheet" href="css/book.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>  
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="js/category.js"></script> 
    <script type="text/javascript" src="js/book.js"></script> 
    <script type="text/javascript" src="js/book_populate_page.js"></script>
         
</head>

<body>
<div class = "page-wrap">
    <nav class = "menu">
    
    <ul class ="topnav" id="myTopnav">
                  
                
                
                 <li><img src="Images/Nerdy_Book_Store_Logo.jpg"  class = "logo" width = "80%" /></li>
                  <li>
					<a href="proj3.html" aria-haspopup ="true">Home</a>	
				</li>
                <li>
                <a href="products.html" aria-haspopup ="true">Products</a>
                </li>
                <li>
                <a href="aboutus.html" aria-haspopup ="true">About Us</a>
                </li>
        	    <li>
					<a href="contactus.html" aria-haspopup ="true">Contact Us</a>
				</li>
                 <li>
                 <a href= "ViewCart"><img  src="Images/View_cart.jpg" width = "200px" /></a></li>
                 <li><div id="count"></div></li>
                 <li class="icon">
                <a id = "menu" href="#"  aria-haspopup ="true">Menu</a>
                </li> 
                 <li><form id = "search_form" name="search_form" 
              action="Search"
              method="get"><input class = "textsize" type="text" id = "search" name="search" size="30" maxlength = "50"  autofocus placeholder="Search for Specific books !!"/></form>  </li>
    </ul>
  </nav>


<div class ="products">

</div>

    <div class= "catalog Row">
	<c:forEach items="${thumbnail_beans}" var="item">
   <div class = "thumbpolaroid Column">
     <a href="GetBookDetail?sku=${item.thumbSku}">
     <img src="Images/${item.thumbImage}" width = "80%"/>
     </a>
     <div class="polaroid-container">
     <p>${item.thumbIdentifier}</p>
     <p>\$ ${item.thumbRetail}</p>
                
 <c:choose>
    <c:when test="${item.thumbOnhand > 0}">
      <p  class="available">${item.thumbOnhand} in stock</p>
    </c:when>
    <c:when test="${item.thumbOnhand == 0}">
      <p  class="available">More on the way !!!</p>
    </c:when>
    <c:otherwise>
            <p  class="nostock">Coming Soon !!!</p>
    </c:otherwise>
</c:choose>
     <input class="book_sku" type="hidden" name="thumb_sku" value="${item.thumbSku}"/>
     </div>
    </div>   
	</c:forEach>
   </div> 


<div id="content">
     
 </div>
<% if(request.getAttribute("no_records")!= null){ 
   String empty = (String)request.getAttribute("no_records"); 
   %>
    <div class="catalog"><h1><%= empty%></h1></div>
<% } %>

<img src="Images/global_banner.jpg"  width = "100%" />
                          
</div> 
<footer class="site-footer">
         <p> copyright &copy; <a href="http://www.sdsu.edu/" title="SDSU">SDSU</a> All Rights Reserved | follow me on Facebook! <a href="https://www.facebook.com/kavitha.lakshman?fref=ts" title="Follow me on Facebook">@Kavitha</a> | Email: <a href="mailto:klkavitha86@gmail.com" title="gmail">Kavitha</a></p>
         <div>
        <ul>
                  
                
                
                
                  <li>
					<a href="proj3.html" aria-haspopup ="true">Home</a>	
				</li>
                <li>
                <a href="products.html" aria-haspopup ="true">Products</a>
                </li>
                <li>
                <a href="aboutus.html" aria-haspopup ="true">About Us</a>
                </li>
        	    <li>
					<a href="contactus.html" aria-haspopup ="true">Contact Us</a>
				</li>
               
    </ul></div>

</footer>
</body>
</html>    


       
