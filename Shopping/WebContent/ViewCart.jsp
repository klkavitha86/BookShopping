<%@ page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
    <script type="text/javascript" src="js/validation.js"></script> 
    
    
             
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
<% if(request.getAttribute("cart_empty")== null){ %>

<div class = "sidebar">
<div class="sidecost">
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
<td > 5.00</td>
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
</div>
<div class="reviewempty">
<a class = "continue" href= "products.html"><img  src="Images/continue_shopping.jpg" width = "200px" /></a>
<button class = "checkout" id="opener"><img  src="Images/checkout.jpg" width = "200px" /></button>
</div>
</div>
<div id="dialog" title="SHIPPING DETAILS">
     <fieldset>
        <legend>Personal Information</legend>
        <form id = "my_form" name="personal_info" 
              action="ReviewOrder"
              method="post">
             <table>
            <tr>
                <td><label for = "fname">First Name<span class="required">*</span></label></td>
                <td><input type="text" id = "fname" name="fname" size="25" maxlength = "35"  autofocus/></td>
                  
                
            </tr> 
            <tr>
                 <td><label for= "lname">Last Name<span class="required">*</span></label></td>
                <td><input type="text" id = "lname" name="lname" size="25" maxlength = "35" /></td> 
                
            </tr>

            <tr>
                <td><label for = "address">Address<span class="required">*</span></label></td>
                <td><input type="text" name="address" id = "address" size="35" maxlength = "95" /></td>
                
            </tr> 
            <tr><td><label for ="address2">Address</label></td>
                <td><input type="text" name="address2" id = "address2" size="35" maxlength = "95"/></td>
            </tr> 
            <tr>
                <td><label for="city">City<span class="required">*</span></label></td>
                <td><input type="text" name="city"  id="city" size="25" maxlength = "35" /></td>
                
            </tr>
            <tr> 
                <td><label for="state">State<span class="required">*</span></label></td>
                    <td><select name="state" id="state">
                    	<option value="">Select State</option>
                    	<option value="AL">Alabama</option>
	<option value="AK">Alaska</option>
	<option value="AZ">Arizona</option>
	<option value="AR">Arkansas</option>
	<option value="CA">California</option>
	<option value="CO">Colorado</option>
	<option value="CT">Connecticut</option>
	<option value="DE">Delaware</option>
	<option value="DC">District Of Columbia</option>
	<option value="FL">Florida</option>
	<option value="GA">Georgia</option>
	<option value="HI">Hawaii</option>
	<option value="ID">Idaho</option>
	<option value="IL">Illinois</option>
	<option value="IN">Indiana</option>
	<option value="IA">Iowa</option>
	<option value="KS">Kansas</option>
	<option value="KY">Kentucky</option>
	<option value="LA">Louisiana</option>
	<option value="ME">Maine</option>
	<option value="MD">Maryland</option>
	<option value="MA">Massachusetts</option>
	<option value="MI">Michigan</option>
	<option value="MN">Minnesota</option>
	<option value="MS">Mississippi</option>
	<option value="MO">Missouri</option>
	<option value="MT">Montana</option>
	<option value="NE">Nebraska</option>
	<option value="NV">Nevada</option>
	<option value="NH">New Hampshire</option>
	<option value="NJ">New Jersey</option>
	<option value="NM">New Mexico</option>
	<option value="NY">New York</option>
	<option value="NC">North Carolina</option>
	<option value="ND">North Dakota</option>
	<option value="OH">Ohio</option>
	<option value="OK">Oklahoma</option>
	<option value="OR">Oregon</option>
	<option value="PA">Pennsylvania</option>
	<option value="RI">Rhode Island</option>
	<option value="SC">South Carolina</option>
	<option value="SD">South Dakota</option>
	<option value="TN">Tennessee</option>
	<option value="TX">Texas</option>
	<option value="UT">Utah</option>
	<option value="VT">Vermont</option>
	<option value="VA">Virginia</option>
	<option value="WA">Washington</option>
	<option value="WV">West Virginia</option>
	<option value="WI">Wisconsin</option>
	<option value="WY">Wyoming</option>  
                        
                </select></td>
                 
            </tr>  
            <tr>
                <td><label for="zip">Zip<span class="required" >*</span></label></td>
                <td><input type="text" name="zip" id="zip" size="5" maxlength="5" /></td>
                
            </tr>     
            <tr>
                <td><label for = "phone">Primary Phone<span class="required">*</span></label></td>
                <td>(<input type="text" id = "area" name="area" size="3" maxlength="3" />)  
                 <input type="text" id = "prefix" name="prefix" size="3" maxlength="3" />
                <input type="text" id = "phone" name="phone" size="4" maxlength="4" /></td>
                
                
            </tr> 
            <tr>
                <td><label for = "payment">Payment Type<span class="required">*</span></label></td>
              <td><label><input type="radio" name="payment" value="Visa"> Visa</label>
              <label><input type="radio" name="payment" value="Mastercard"> Mastercard </label>
              <label><input type="radio" name="payment" value="Discover"> Discover </label>
              <label><input type="radio" name="payment" value="American Express"> American Express </label></td>
                
            </tr>
            <tr>
              <td><label for="card">Card Number<span class="required" >*</span></label></td>
                <td><input type="text" name="card" id="card" size="16" maxlength="16" /></td>
            </tr>
             <tr>
                <td><label for = "expiration">Expiration Date<span class="required">*</span></label></td>
                <td><input type="text" id = "month" name="month" size="2" maxlength="2" placeholder = "MM"/>  
                    <select name="year" id="year">
                    	<option value="">Select Year</option>
                    	<option value="2017">2017</option>
                        <option value="2018">2018</option>
                        <option value="2019">2019</option>
                        <option value="2020">2020</option>
                        <option value="2021">2021</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
	
                </select></td>
            </tr>
            <tr>
                <td><label for = "billing">Use this Address for Billing</label></td>
                <td><label><input type="checkbox" name="billing" id = "billing" value="Yes"> </label>
              </td>  
            </tr>
                </table>
              <hr />
                  <table class = "billinginfo">
            <caption>BILLING INFORMATION</caption>
            <tr>
                <td><label for = "bfname">First Name<span class="required">*</span></label></td>
                <td><input type="text" id = "bfname" name="bfname" size="25" maxlength = "35"  autofocus/></td>
                  
                
            </tr> 
            <tr>
                 <td><label for= "blname">Last Name<span class="required">*</span></label></td>
                <td><input type="text" id = "blname" name="blname" size="25" maxlength = "35" /></td> 
                
            </tr>

            <tr>
                <td><label for = "baddress">Address<span class="required">*</span></label></td>
                <td><input type="text" name="baddress" id = "baddress" size="35" maxlength = "95" /></td>
                
            </tr> 
            <tr><td><label for ="baddress2">Address</label></td>
                <td><input type="text" name="baddress2" id = "baddress2" size="35" maxlength = "95"/></td>
            </tr> 
            <tr>
                <td><label for="bcity">City<span class="required">*</span></label></td>
                <td><input type="text" name="bcity"  id="bcity" size="25" maxlength = "35" /></td>
                
            </tr>
            <tr> 
                <td><label for="bstate">State<span class="required">*</span></label></td>
                    <td><select name="bstate" id="bstate">
                    	<option value="">Select State</option>
                    	<option value="AL">Alabama</option>
	<option value="AK">Alaska</option>
	<option value="AZ">Arizona</option>
	<option value="AR">Arkansas</option>
	<option value="CA">California</option>
	<option value="CO">Colorado</option>
	<option value="CT">Connecticut</option>
	<option value="DE">Delaware</option>
	<option value="DC">District Of Columbia</option>
	<option value="FL">Florida</option>
	<option value="GA">Georgia</option>
	<option value="HI">Hawaii</option>
	<option value="ID">Idaho</option>
	<option value="IL">Illinois</option>
	<option value="IN">Indiana</option>
	<option value="IA">Iowa</option>
	<option value="KS">Kansas</option>
	<option value="KY">Kentucky</option>
	<option value="LA">Louisiana</option>
	<option value="ME">Maine</option>
	<option value="MD">Maryland</option>
	<option value="MA">Massachusetts</option>
	<option value="MI">Michigan</option>
	<option value="MN">Minnesota</option>
	<option value="MS">Mississippi</option>
	<option value="MO">Missouri</option>
	<option value="MT">Montana</option>
	<option value="NE">Nebraska</option>
	<option value="NV">Nevada</option>
	<option value="NH">New Hampshire</option>
	<option value="NJ">New Jersey</option>
	<option value="NM">New Mexico</option>
	<option value="NY">New York</option>
	<option value="NC">North Carolina</option>
	<option value="ND">North Dakota</option>
	<option value="OH">Ohio</option>
	<option value="OK">Oklahoma</option>
	<option value="OR">Oregon</option>
	<option value="PA">Pennsylvania</option>
	<option value="RI">Rhode Island</option>
	<option value="SC">South Carolina</option>
	<option value="SD">South Dakota</option>
	<option value="TN">Tennessee</option>
	<option value="TX">Texas</option>
	<option value="UT">Utah</option>
	<option value="VT">Vermont</option>
	<option value="VA">Virginia</option>
	<option value="WA">Washington</option>
	<option value="WV">West Virginia</option>
	<option value="WI">Wisconsin</option>
	<option value="WY">Wyoming</option>  
                        
                </select></td>
                 
            </tr>  
            <tr>
                <td><label for="bzip">Zip<span class="required" >*</span></label></td>
                <td><input type="text" name="bzip" id="bzip" size="5" maxlength="5" /></td>
                
            </tr>     
            <tr>
                <td><label for = "bphone">Primary Phone<span class="required">*</span></label></td>
                <td>(<input type="text" id = "barea" name="barea" size="3" maxlength="3" />)  
                 <input type="text" id = "bprefix" name="bprefix" size="3" maxlength="3" />
                <input type="text" id = "bphone" name="bphone" size="4" maxlength="4" /></td>
                
                
            </tr> 
            
                </table>
                <div id="error_message" class = "error"></div>
      <div id="button_panel">  
            <input type="reset" class = "button" value="Reset"  id = "resetButton"/>
            <input type="submit" class = "button" value="Submit" id = "submitButton" /> 
      </div>
         <p class="help-block">* Required</p>                   
        </form>
        </fieldset> 
        </div>


    
    <div class= "wrapper catalog">
    
	<c:forEach items="${view_cart_beans}" var="item">
      
    <div id="row">
    <div id="cartfirst"><p>${item.cartIdentifier}</p>
        <p>Sub Total:$ <span class="subtotal">${item.cartRetail*item.cartQty}</span> </p>
        </div>
    <div id="second">
      
     <img src="Images/${item.cartImage}" width="50%"/>
   
        </div><div id="third">    
       
 <c:choose>
    <c:when test="${item.cartOnhand > 0}">
      <p class="available"> ${item.cartOnhand} in stock</p>
    </c:when>
    <c:when test="${item.cartOnhand == 0}">
      <p class="available">More on the way !!!</p>
    </c:when>
    <c:otherwise>
      <p class="nostock">Coming Soon !!!</p>
    </c:otherwise>
</c:choose>
        
       
    <p>
        <span>Quantity: </span>
        
        <input class = "boxColor" id="editQty" type="text" name="Quantity" maxlength = "4" value="${item.cartQty}" vertical-align="middle"/>
        
        <br />
    </p>
         <p>$ ${item.cartRetail}</p>
        <input type="hidden" id="viewsku" value="${item.cartSku}" />
        <input type="hidden" id="viewretail" value="${item.cartRetail}" />
        <input type="hidden" id="viewIdentifier" value="${item.cartIdentifier}" />
        <input type="hidden" id="viewImage" value="${item.cartImage}" />
        <input type="hidden" id="viewonhand" value="${item.cartOnhand}" />
        <input type="hidden" id="viewqty" value="${item.cartQty}" />
    <p>
        
        <a class = "remove_cart" href = "RemoveCart/${item.cartSku}"><img  src = "Images/Delete.jpg" width = "50%" /></a>
        <br />
   
        <span class = "indtotal" ></span><br />
    </p>
    </div>     
    </div>
	</c:forEach>
       
   </div> 
    
<div id="content">
     
 </div>

<% } else { 
   String empty = (String)request.getAttribute("cart_empty"); 
   %>
    <div class="catalog"><h1><%= empty%></h1></div>
<% } %>
<img src="Images/happyreading.jpg"  width = "100%" />

                          
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


       
