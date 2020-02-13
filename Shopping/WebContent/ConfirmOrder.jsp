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
                 <li><div id="count">
                     <% if(session.getAttribute("cart_count") != null){ %>
                    Your Cart:<%= session.getAttribute("cart_count") %>
                    <% } %></div></li>
                 <li class="icon">
                <a id = "menu" href="#"  aria-haspopup ="true">Menu</a>
                </li> 
                 <li><form id = "search_form" name="search_form" 
              action="Search"
              method="get"><input class = "textsize" type="text" id = "search" name="search" size="30" maxlength = "50"  autofocus placeholder="Search for Specific books !!"/></form>  </li>
    </ul>
  </nav>
<div class="catalog"><h1>Thank you ${shipping_bean.firstName} ${shipping_bean.lastName}, for shopping with us.You order will be delivered in 4-5 days with standard shipping.</h1></div>
<div class = "sidebar">
<div class="sidecost">
 <c:set var="subTotal" value="${0.00}" />
<table class="cost">
<caption>Order Summary</caption>
<tr>
<td>SubTotal</td>
<td>
    <c:forEach items="${cart_beans}" var="item">
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

    <h2>Shipping Address</h2>
<table class="shipping">
<tr><td>Name: </td><td><c:out value="${shipping_bean.firstName}"/> <c:out value="${shipping_bean.lastName}"/></td><tr>
<tr><td>Address:</td><td><c:out value="${shipping_bean.address}"/>
 <c:out value="${shipping_bean.address2}"/> 
<c:out value="${shipping_bean.city}"/>
 <c:out value="${shipping_bean.state}"/>
  <c:out value="${shipping_bean.zip}"/>
</td><tr>
<tr><td>Phone:</td><td><c:out value="${shipping_bean.area}"/>-<c:out value="${shipping_bean.prefix}"/>-<c:out value="${shipping_bean.phone}"/></td><tr>
<tr><td>Payment:</td><td><c:out value="${shipping_bean.payment}"/></td><tr>
<tr><td>Card:</td><td><c:out value="${shipping_bean.finalcard}"/></td><tr>
</table><h2>Billing Address</h2>
<table class="billing">
<tr><td>Name: </td><td><c:out value="${billing_bean.firstName}"/> <c:out value="${billing_bean.lastName}"/></td></tr>
<tr><td>Address: </td><td><c:out value="${billing_bean.address}"/>   
 <c:out value="${billing_bean.address2}"/>     
<c:out value="${billing_bean.city}"/>  
 <c:out value="${billing_bean.state}"/>    
 <c:out value="${billing_bean.zip}"/>   
    </td></tr>
    <tr><td>Phone: </td><td><c:out value="${billing_bean.area}"/>-<c:out value="${billing_bean.prefix}"/>-<c:out value="${billing_bean.phone}"/></td></tr>
</table>
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
                <td><input type="text" id = "fname" name="fname" size="25" maxlength = "35"  value="${shipping_bean.firstName}" autofocus/></td>
                  
                
            </tr> 
            <tr>
                 <td><label for= "lname">Last Name<span class="required">*</span></label></td>
                <td><input type="text" id = "lname" name="lname" size="25" maxlength = "35" value="${shipping_bean.lastName}" /></td> 
                
            </tr>

            <tr>
                <td><label for = "address">Address<span class="required">*</span></label></td>
                <td><input type="text" name="address" id = "address" size="35" maxlength = "95" value="${shipping_bean.address}"/></td>
                
            </tr> 
            <tr><td><label for ="address2">Address</label></td>
                <td><input type="text" name="address2" id = "address2" size="35" maxlength = "95" value="${shipping_bean.address2}"/></td>
            </tr> 
            <tr>
                <td><label for="city">City<span class="required">*</span></label></td>
                <td><input type="text" name="city"  id="city" size="25" maxlength = "35" value="${shipping_bean.city}"/></td>
                
            </tr>
            <tr> 
                <td><label for="state">State<span class="required">*</span></label></td>
                    <td><select name="state" id="state">
                    	<option value="">Select State</option>
                    	<option value="AL" ${shipping_bean.state == 'AL' ? 'selected' : ''}>Alabama</option>
                        <option value="AK" ${shipping_bean.state == 'AK' ? 'selected' : ''}>Alaska</option>
                        <option value="AZ" ${shipping_bean.state == 'AZ' ? 'selected' : ''}>Arizona</option>
                        <option value="AR" ${shipping_bean.state == 'AR' ? 'selected' : ''}>Arkansas</option>
                        <option value="CA" ${shipping_bean.state == 'CA' ? 'selected' : ''}>California</option>
                        <option value="CO" ${shipping_bean.state == 'CO' ? 'selected' : ''}>Colorado</option>
                        <option value="CT" ${shipping_bean.state == 'CT' ? 'selected' : ''}>Connecticut</option>
                        <option value="DE" ${shipping_bean.state == 'DE' ? 'selected' : ''}>Delaware</option>
                        <option value="DC" ${shipping_bean.state == 'DC' ? 'selected' : ''}>District Of Columbia</option>
                        <option value="FL" ${shipping_bean.state == 'FL' ? 'selected' : ''}>Florida</option>
                        <option value="GA" ${shipping_bean.state == 'GA' ? 'selected' : ''}>Georgia</option>
                        <option value="HI" ${shipping_bean.state == 'HI' ? 'selected' : ''}>Hawaii</option>
                        <option value="ID" ${shipping_bean.state == 'ID' ? 'selected' : ''}>Idaho</option>
                        <option value="IL" ${shipping_bean.state == 'IL' ? 'selected' : ''}>Illinois</option>
                        <option value="IN" ${shipping_bean.state == 'IN' ? 'selected' : ''}>Indiana</option>
                        <option value="IA" ${shipping_bean.state == 'IA' ? 'selected' : ''}>Iowa</option>
                        <option value="KS" ${shipping_bean.state == 'KS' ? 'selected' : ''}>Kansas</option>
                        <option value="KY" ${shipping_bean.state == 'KY' ? 'selected' : ''}>Kentucky</option>
                        <option value="LA" ${shipping_bean.state == 'LA' ? 'selected' : ''}>Louisiana</option>
                        <option value="ME" ${shipping_bean.state == 'ME' ? 'selected' : ''}>Maine</option>
                        <option value="MD" ${shipping_bean.state == 'MD' ? 'selected' : ''}>Maryland</option>
                        <option value="MA" ${shipping_bean.state == 'MA' ? 'selected' : ''}>Massachusetts</option>
                        <option value="MI" ${shipping_bean.state == 'MI' ? 'selected' : ''}>Michigan</option>
                        <option value="MN" ${shipping_bean.state == 'MN' ? 'selected' : ''}>Minnesota</option>
                        <option value="MS" ${shipping_bean.state == 'MS' ? 'selected' : ''}>Mississippi</option>
                        <option value="MO" ${shipping_bean.state == 'MO' ? 'selected' : ''}>Missouri</option>
                        <option value="MT" ${shipping_bean.state == 'MT' ? 'selected' : ''}>Montana</option>
                        <option value="NE" ${shipping_bean.state == 'NE' ? 'selected' : ''}>Nebraska</option>
                        <option value="NV" ${shipping_bean.state == 'NV' ? 'selected' : ''}>Nevada</option>
                        <option value="NH" ${shipping_bean.state == 'NH' ? 'selected' : ''}>New Hampshire</option>
                        <option value="NJ" ${shipping_bean.state == 'NJ' ? 'selected' : ''}>New Jersey</option>
                        <option value="NM" ${shipping_bean.state == 'NM' ? 'selected' : ''}>New Mexico</option>
                        <option value="NY" ${shipping_bean.state == 'NY' ? 'selected' : ''}>New York</option>
                        <option value="NC" ${shipping_bean.state == 'NC' ? 'selected' : ''}>North Carolina</option>
                        <option value="ND" ${shipping_bean.state == 'ND' ? 'selected' : ''}>North Dakota</option>
                        <option value="OH" ${shipping_bean.state == 'OH' ? 'selected' : ''}>Ohio</option>
                        <option value="OK" ${shipping_bean.state == 'OK' ? 'selected' : ''}>Oklahoma</option>
                        <option value="OR" ${shipping_bean.state == 'OR' ? 'selected' : ''}>Oregon</option>
                        <option value="PA" ${shipping_bean.state == 'PA' ? 'selected' : ''}>Pennsylvania</option>
                        <option value="RI" ${shipping_bean.state == 'RI' ? 'selected' : ''}>Rhode Island</option>
                        <option value="SC" ${shipping_bean.state == 'SC' ? 'selected' : ''}>South Carolina</option>
                        <option value="SD" ${shipping_bean.state == 'SD' ? 'selected' : ''}>South Dakota</option>
                        <option value="TN" ${shipping_bean.state == 'TN' ? 'selected' : ''}>Tennessee</option>
                        <option value="TX" ${shipping_bean.state == 'TX' ? 'selected' : ''}>Texas</option>
                        <option value="UT" ${shipping_bean.state == 'UT' ? 'selected' : ''}>Utah</option>
                        <option value="VT" ${shipping_bean.state == 'VT' ? 'selected' : ''}>Vermont</option>
                        <option value="VA" ${shipping_bean.state == 'VA' ? 'selected' : ''}>Virginia</option>
                        <option value="WA" ${shipping_bean.state == 'WA' ? 'selected' : ''}>Washington</option>
                        <option value="WV" ${shipping_bean.state == 'WV' ? 'selected' : ''}>West Virginia</option>
                        <option value="WI" ${shipping_bean.state == 'WI' ? 'selected' : ''}>Wisconsin</option>
                        <option value="WY" ${shipping_bean.state == 'WY' ? 'selected' : ''}>Wyoming</option>  
                        
                </select></td>
                 
            </tr>  
            <tr>
                <td><label for="zip">Zip<span class="required" >*</span></label></td>
                <td><input type="text" name="zip" id="zip" size="5" maxlength="5" value="${shipping_bean.zip}" /></td>
                
            </tr>     
            <tr>
                <td><label for = "phone">Primary Phone<span class="required">*</span></label></td>
                <td>(<input type="text" id = "area" name="area" size="3" maxlength="3" value="${shipping_bean.area}"/>)  
                 <input type="text" id = "prefix" name="prefix" size="3" maxlength="3" value="${shipping_bean.prefix}"/>
                <input type="text" id = "phone" name="phone" size="4" maxlength="4" value="${shipping_bean.phone}"/></td>
                
                
            </tr> 
            <tr>
                <td><label for = "payment">Payment Type<span class="required">*</span></label></td>
              <td><label><input type="radio" name="payment" value="Visa" ${shipping_bean.payment == 'Visa' ? 'checked' : ''}> Visa</label>
              <label><input type="radio" name="payment" value="Mastercard" ${shipping_bean.payment == 'Mastercard' ? 'checked' : ''}> Mastercard </label>
              <label><input type="radio" name="payment" value="Discover" ${shipping_bean.payment == 'Discover' ? 'checked' : ''}> Discover </label>
              <label><input type="radio" name="payment" value="American Express"  ${shipping_bean.payment == 'American' ? 'checked' : ''}> American Express </label></td>
                
            </tr>
            <tr>
              <td><label for="card">Card Number<span class="required" >*</span></label></td>
                <td><input type="text" name="card" id="card" size="16" maxlength="16" value="${shipping_bean.card}"/></td>
            </tr>
             <tr>
                <td><label for = "expiration">Expiration Date<span class="required">*</span></label></td>
                <td><input type="text" id = "month" name="month" size="2" maxlength="2" placeholder = "MM" value="${shipping_bean.month}"/>  
                    <select name="year" id="year">
                    	<option value="">Select Year</option>
                    	<option value="2017" ${shipping_bean.year == '2017' ? 'selected' : ''}>2017</option>
                        <option value="2018" ${shipping_bean.year == '2018' ? 'selected' : ''}>2018</option>
                        <option value="2019" ${shipping_bean.year == '2019' ? 'selected' : ''}>2019</option>
                        <option value="2020" ${shipping_bean.year == '2020' ? 'selected' : ''}>2020</option>
                        <option value="2021" ${shipping_bean.year == '2021' ? 'selected' : ''}>2021</option>
                        <option value="2022" ${shipping_bean.year == '2022' ? 'selected' : ''}>2022</option>
                        <option value="2023" ${shipping_bean.year == '2023' ? 'selected' : ''}>2023</option>
                        <option value="2024" ${shipping_bean.year == '2024' ? 'selected' : ''}>2024</option>
	
                </select></td>
            </tr>
            <tr>
                <td><label for = "billing">Use this Address for Billing</label></td>
                <td><label><input type="checkbox" name="billing" id = "billing" ${shipping_bean.billing == 'Yes' ? 'checked' : ''}> </label>
              </td>  
            </tr>
                </table>
              <hr />
                  <table class = "billinginfo">
            <caption>BILLING INFORMATION</caption>
            <tr>
                <td><label for = "bfname">First Name<span class="required">*</span></label></td>
                <td><input type="text" id = "bfname" name="bfname" size="25" maxlength = "35"  autofocus value="${billing_bean.firstName}"/></td>
                  
                
            </tr> 
            <tr>
                 <td><label for= "blname">Last Name<span class="required">*</span></label></td>
                <td><input type="text" id = "blname" name="blname" size="25" maxlength = "35" value="${billing_bean.lastName}" /></td> 
                
            </tr>

            <tr>
                <td><label for = "baddress">Address<span class="required">*</span></label></td>
                <td><input type="text" name="baddress" id = "baddress" size="35" maxlength = "95" value="${billing_bean.address}"/></td>
                
            </tr> 
            <tr><td><label for ="baddress2">Address</label></td>
                <td><input type="text" name="baddress2" id = "baddress2" size="35" maxlength = "95" value="${billing_bean.address2}"/></td>
            </tr> 
            <tr>
                <td><label for="bcity">City<span class="required">*</span></label></td>
                <td><input type="text" name="bcity"  id="bcity" size="25" maxlength = "35" value="${billing_bean.city}"/></td>
                
            </tr>
            <tr> 
                <td><label for="bstate">State<span class="required">*</span></label></td>
                    <td><select name="bstate" id="bstate">
                    	<option value="">Select State</option>
                    	<option value="AL" ${shipping_bean.state == 'AL' ? 'selected' : ''}>Alabama</option>
                        <option value="AK" ${shipping_bean.state == 'AK' ? 'selected' : ''}>Alaska</option>
                        <option value="AZ" ${shipping_bean.state == 'AZ' ? 'selected' : ''}>Arizona</option>
                        <option value="AR" ${shipping_bean.state == 'AR' ? 'selected' : ''}>Arkansas</option>
                        <option value="CA" ${shipping_bean.state == 'CA' ? 'selected' : ''}>California</option>
                        <option value="CO" ${shipping_bean.state == 'CO' ? 'selected' : ''}>Colorado</option>
                        <option value="CT" ${shipping_bean.state == 'CT' ? 'selected' : ''}>Connecticut</option>
                        <option value="DE" ${shipping_bean.state == 'DE' ? 'selected' : ''}>Delaware</option>
                        <option value="DC" ${shipping_bean.state == 'DC' ? 'selected' : ''}>District Of Columbia</option>
                        <option value="FL" ${shipping_bean.state == 'FL' ? 'selected' : ''}>Florida</option>
                        <option value="GA" ${shipping_bean.state == 'GA' ? 'selected' : ''}>Georgia</option>
                        <option value="HI" ${shipping_bean.state == 'HI' ? 'selected' : ''}>Hawaii</option>
                        <option value="ID" ${shipping_bean.state == 'ID' ? 'selected' : ''}>Idaho</option>
                        <option value="IL" ${shipping_bean.state == 'IL' ? 'selected' : ''}>Illinois</option>
                        <option value="IN" ${shipping_bean.state == 'IN' ? 'selected' : ''}>Indiana</option>
                        <option value="IA" ${shipping_bean.state == 'IA' ? 'selected' : ''}>Iowa</option>
                        <option value="KS" ${shipping_bean.state == 'KS' ? 'selected' : ''}>Kansas</option>
                        <option value="KY" ${shipping_bean.state == 'KY' ? 'selected' : ''}>Kentucky</option>
                        <option value="LA" ${shipping_bean.state == 'LA' ? 'selected' : ''}>Louisiana</option>
                        <option value="ME" ${shipping_bean.state == 'ME' ? 'selected' : ''}>Maine</option>
                        <option value="MD" ${shipping_bean.state == 'MD' ? 'selected' : ''}>Maryland</option>
                        <option value="MA" ${shipping_bean.state == 'MA' ? 'selected' : ''}>Massachusetts</option>
                        <option value="MI" ${shipping_bean.state == 'MI' ? 'selected' : ''}>Michigan</option>
                        <option value="MN" ${shipping_bean.state == 'MN' ? 'selected' : ''}>Minnesota</option>
                        <option value="MS" ${shipping_bean.state == 'MS' ? 'selected' : ''}>Mississippi</option>
                        <option value="MO" ${shipping_bean.state == 'MO' ? 'selected' : ''}>Missouri</option>
                        <option value="MT" ${shipping_bean.state == 'MT' ? 'selected' : ''}>Montana</option>
                        <option value="NE" ${shipping_bean.state == 'NE' ? 'selected' : ''}>Nebraska</option>
                        <option value="NV" ${shipping_bean.state == 'NV' ? 'selected' : ''}>Nevada</option>
                        <option value="NH" ${shipping_bean.state == 'NH' ? 'selected' : ''}>New Hampshire</option>
                        <option value="NJ" ${shipping_bean.state == 'NJ' ? 'selected' : ''}>New Jersey</option>
                        <option value="NM" ${shipping_bean.state == 'NM' ? 'selected' : ''}>New Mexico</option>
                        <option value="NY" ${shipping_bean.state == 'NY' ? 'selected' : ''}>New York</option>
                        <option value="NC" ${shipping_bean.state == 'NC' ? 'selected' : ''}>North Carolina</option>
                        <option value="ND" ${shipping_bean.state == 'ND' ? 'selected' : ''}>North Dakota</option>
                        <option value="OH" ${shipping_bean.state == 'OH' ? 'selected' : ''}>Ohio</option>
                        <option value="OK" ${shipping_bean.state == 'OK' ? 'selected' : ''}>Oklahoma</option>
                        <option value="OR" ${shipping_bean.state == 'OR' ? 'selected' : ''}>Oregon</option>
                        <option value="PA" ${shipping_bean.state == 'PA' ? 'selected' : ''}>Pennsylvania</option>
                        <option value="RI" ${shipping_bean.state == 'RI' ? 'selected' : ''}>Rhode Island</option>
                        <option value="SC" ${shipping_bean.state == 'SC' ? 'selected' : ''}>South Carolina</option>
                        <option value="SD" ${shipping_bean.state == 'SD' ? 'selected' : ''}>South Dakota</option>
                        <option value="TN" ${shipping_bean.state == 'TN' ? 'selected' : ''}>Tennessee</option>
                        <option value="TX" ${shipping_bean.state == 'TX' ? 'selected' : ''}>Texas</option>
                        <option value="UT" ${shipping_bean.state == 'UT' ? 'selected' : ''}>Utah</option>
                        <option value="VT" ${shipping_bean.state == 'VT' ? 'selected' : ''}>Vermont</option>
                        <option value="VA" ${shipping_bean.state == 'VA' ? 'selected' : ''}>Virginia</option>
                        <option value="WA" ${shipping_bean.state == 'WA' ? 'selected' : ''}>Washington</option>
                        <option value="WV" ${shipping_bean.state == 'WV' ? 'selected' : ''}>West Virginia</option>
                        <option value="WI" ${shipping_bean.state == 'WI' ? 'selected' : ''}>Wisconsin</option>
                        <option value="WY" ${shipping_bean.state == 'WY' ? 'selected' : ''}>Wyoming</option>  
                        
                </select></td>
                 
            </tr>  
            <tr>
                <td><label for="bzip">Zip<span class="required" >*</span></label></td>
                <td><input type="text" name="bzip" id="bzip" size="5" maxlength="5" value="${billing_bean.zip}"/></td>
                
            </tr>     
            <tr>
                <td><label for = "bphone">Primary Phone<span class="required">*</span></label></td>
                <td>(<input type="text" id = "barea" name="barea" size="3" maxlength="3" value="${billing_bean.area}"/>)  
                 <input type="text" id = "bprefix" name="bprefix" size="3" maxlength="3" value="${billing_bean.prefix}"/>
                <input type="text" id = "bphone" name="bphone" size="4" maxlength="4" value="${billing_bean.phone}"/></td>
                
                
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
    
	<c:forEach items="${cart_beans}" var="item">
      
    <div id="row">
    <div id="cartfirst"><p>${item.cartIdentifier}</p>
        <p>Sub Total:$ <span class="subtotal">${item.cartRetail*item.cartQty}</span> </p>
        </div>
    <div id="second">
      
     <img src="Images/${item.cartImage}" width="50%"/>
   
        </div><div id="third">    

        
       
    <p>
        <span>Quantity: </span>
        
        <input class = "boxColor" id="editQty" type="text" name="Quantity" maxlength = "4" value="${item.cartQty}" vertical-align="middle" disabled/>
        
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
    
        <span class = "indtotal" ></span><br />
    </p>
    </div>     
    </div>
	</c:forEach>
       
   </div> 

 <div id="content">
                    <% if(session.getAttribute("sent_confirm") != null){ %>
                    <%= session.getAttribute("sent_confirm") %>
                    <% } %>
 </div>   

<img src="Images/happyreading.jpg"  width = "100%" />
<% session.invalidate();%>
                          
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


       
