
/* Name :Kavitha Venkatesan
   Class Account :jadrn054
   Semester: Spring 2017
   Project#3 */

$(document).ready(function() {
	$.get("AjaxGetCategory", handleCategory);	
    $.get("AjaxGetFilter", handleFilter);	
    var url = "GetCartCount";
    $.get(url,handleCartCount);
	}
);
function handleCategory(response) {
	$('#category').html(response);
	}	
function handleFilter(response) {
	$('.products').html(response);
	}	
function handleCartCount(response) {

	$('#count').html(response);
   
	}	

