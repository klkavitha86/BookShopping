<%@ page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
    <div class= "link">
	<c:forEach items="${category_beans}" var="item">
   
   <div class = "marathon"><img src="Images/category.jpg" width = "60%"/>
     <a href = "GetBookList?category=${item.categoryName}&id=${item.categoryId}"> ${item.categoryName}</a>
    </div>
        
	</c:forEach>
   </div>
  
       
