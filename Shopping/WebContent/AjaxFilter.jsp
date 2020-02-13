<%@ page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <ul>
    <li><a href="#"  class="divider">Category</a></li>
    <c:forEach items="${category_beans}" var="item">
        <li><a href = "GetBookList?category=${item.categoryName}&id=${item.categoryId}"> ${item.categoryName}</a></li>
        
    </c:forEach>
    <li><a href="#"  class="divider">Vendor</a></li>
    <c:forEach items="${vendor_beans}" var="item">
        <li><a href = "GetBookList?vendor=${item.vendorName}&vid=${item.vendorId}"> ${item.vendorName}</a></li>
         
    </c:forEach>
    </ul>
   
  