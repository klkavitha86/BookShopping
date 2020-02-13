<%@ page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% if(request.getAttribute("cart_empty")== null){ %>
<c:set var="subTotal" value="${0.00}" />
<table class="cost">
<caption>Order Summary</caption>
<tr>
<td>SubTotal</td>
<td>
    <c:forEach items="${view_cart_beans}" var="item">
         <c:set var="subTotal" value="${subTotal + item.cartRetail*item.cartQty}" />   
    </c:forEach>
    <fmt:formatNumber type="number" 
            maxFractionDigits="2" value="${subTotal}" />
</td>
</tr>
<tr>
<td>Shipping</td>
<td >5.00</td>
</tr>
<tr>
<td>Tax(8%)</td>
<td ><fmt:formatNumber type="number" 
            maxFractionDigits="2" value="${(subTotal+5) * 0.08 }" /></td>
</tr>
<tr>
<td>Grand Total</td>
<td >
    <fmt:formatNumber type="number" 
            maxFractionDigits="2" value="${(subTotal + 5) * 1.08 }" /></td>
</tr>
</table>

<% } else { 
   String empty = (String)request.getAttribute("cart_empty"); 
   %>
   
<table class="cost">
<caption>Order Summary</caption>
<tr>
<td>SubTotal</td>
<td>0.00</td>
</tr>
<tr>
<td>Shipping</td>
<td > 5.00</td>
</tr>
<tr>
<td>Tax(8%)</td>
<td >0.00</td>
</tr>
<tr>
<td>Grand Total</td>
<td >0.00</td>
</tr>
</table>

<% } %>