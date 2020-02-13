/*  We load the global array proj4_data once, then use it as needed
    to retrieve product information.

     Venkatesan, Kavitha    Account:  jadrn054
        CS545, Fall 2016
        Project #4
*/    




$(document).ready(function() {
    
   
   $('body').on('click', 'a.qty', function(e) {
   e.preventDefault();
   var $t = $(e.currentTarget),
        valMin = 0;
        
     if($t.data('func') == 'plus') {
     var  val = parseInt($t.next("input").val());
         }else{
     var  val = parseInt($t.prev("input").val());       
         }
 
    if(isNaN(val) || val < valMin) {
       if($t.data('func') == 'plus') {
        $t.next("input").val(valMin);
        return false;
       }
        else{
          $t.prev("input").val(valMin);
        return false;  
        }
        
    } 
    
    // Perform increment or decrement logic
    if($t.data('func') == 'plus') {
         $t.next("input").val(val+1);
    } else {
        if(val > valMin) 
            $t.prev("input").val(val - 1);
    }
}); 
    
   $('body').on('keypress','.boxColor',function(e){
       
            
            var verified = (e.which == 8 || e.which == undefined || e.which == 0) ? null : String.fromCharCode(e.which).match(/[^0-9]/);
            if (verified) {e.preventDefault();}
    
       
   });
    
    $('body').on('keypress','#editQty',function(e){
       
       
            var verified = (e.which == 8 || e.which == undefined || e.which == 0) ? null : String.fromCharCode(e.which).match(/[^0-9]/);
            if (verified) {e.preventDefault();}
    
       
   });
    
   $('body').on('click', 'a.add_cart', function(event) {
   
    event.preventDefault();
    var sku = $('#addsku').val();
    var qty = parseInt($('#addqty').val());
    var retail = $('#addretail').val();
    var identifier = $('#addIdentifier').val();
    var image = $('#addImage').val();
    var onhand = parseInt($('#addonhand').val());
    if(onhand <= 0){
          $('.indtotal').addClass('nostock');
        $('.indtotal').text('Stock not available now.Please check later!!!');
        return;
    }
    else if(qty > onhand){
        $('.indtotal').addClass('nostock');
        $('.indtotal').text('Please order less than '+onhand+'!!!');
        return;
    }
    else{
    $('.indtotal').removeClass('nostock');
     
    var url = "OrderDetails?action=add&sku="+sku+"&qty="+qty+"&retail="+retail+"&identifier="+identifier+"&image="+image+"&onhand="+onhand;
	
    $.get(url, handleCount);	
    }
    
});
    
   $('body').on('click', 'a.remove_cart', function(event) {

    event.preventDefault();
    var $t = $(event.currentTarget);
    var qty = parseInt($t.val());
    var sku = $t.parent("p").prevAll("input#viewsku").val();
    var url = "RemoveCart?sku="+sku;
    $.get(url, handleRemoveCart);	
    $t.parent("p").parent("#third").parent("#row").fadeOut(3000);
    });
    
     $('body').on('click', 'a.edit_cart', function(event) {
    event.preventDefault();
    var sku = $('#viewsku').val();
    var url = "EditCart?action=update&sku="+sku;
    $.get(url, handleEditCart);	
    
    });


   $('body').on('change', '#editQty',function(e) {
        
     event.preventDefault();
    var sku = $('#viewsku').val();
    var url = "EditCart?action=update&sku="+sku;
    $.get(url, handleEditCart);
       
   });  
   $('body').on('blur', '#editQty',function(e) {
      
        var $t = $(e.currentTarget);
       var qty = parseInt($t.val());
       var sku = $t.parent("p").nextAll("input#viewsku").val();
       var retail = $t.parent("p").nextAll("input#viewretail").val();
       var onhand = $t.parent("p").nextAll("input#viewonhand").val();
       if( isNaN(qty)) {
         
          $t.get(0).focus();
           $t.parent("p").nextAll("p").children('span.indtotal').addClass('nostock');
           $t.parent("p").nextAll("p").children('span.indtotal').text("Please enter Quantity!!");
           return;
       }else  if(qty > onhand){
        $t.get(0).focus(); 
        $t.parent("p").nextAll("p").children('span.indtotal').addClass('nostock');
        $t.parent("p").nextAll("p").children('span.indtotal').text('Please order less than '+onhand+'!!!');
        return;
       }else  if(qty == 0){
        $t.get(0).focus();
        $t.parent("p").nextAll("p").children('span.indtotal').addClass('nostock');
        $t.parent("p").nextAll("p").children('span.indtotal').text('Please enter valid quantity !!!');
        return;
       }else{
           $t.parent("p").nextAll("p").children('span.indtotal').removeClass('nostock');
           $t.parent("p").nextAll("p").children('span.indtotal').text("");
            var url = "EditCart?action=update&sku="+sku+"&qty="+qty;

           $.get(url, handleEditCart);	
           $t.parent("p").parent("#third").prevAll("#cartfirst").children("p").children('span.subtotal').text(qty*retail);
           $t.parent("p").nextAll("p").children('.indtotal').text("Item Edited Sucessfully !!");
       }
       
   });
    
     $('body').on('blur', '#addqty',function(e) {
      
        var $t = $(e.currentTarget);
       var qty = parseInt($t.val());
       var sku = $t.parent("p").nextAll("input#addsku").val();
       var retail = $t.parent("p").nextAll("input#addretail").val();
       var onhand = $t.parent("p").nextAll("input#addonhand").val();
       if( isNaN(qty)) {
         
          $t.get(0).focus();
           $t.parent("p").nextAll("p").children('span.indtotal').addClass('nostock');
           $t.parent("p").nextAll("p").children('span.indtotal').text("Please enter Quantity!!");
           return;
       }else  if(qty > onhand){
        $t.get(0).focus(); 
        $t.parent("p").nextAll("p").children('span.indtotal').addClass('nostock');
        $t.parent("p").nextAll("p").children('span.indtotal').text('Please order less than '+onhand+'!!!');
        return;
       }else  if(qty == 0){
        $t.get(0).focus();
        $t.parent("p").nextAll("p").children('span.indtotal').addClass('nostock');
        $t.parent("p").nextAll("p").children('span.indtotal').text('Please enter valid quantity !!!');
        return;
       }else{
             $t.parent("p").nextAll("p").children('span.indtotal').removeClass('nostock');
              $t.parent("p").nextAll("p").children('span.indtotal').text('');
        return;
       }

   });
});

function handleAddCart(response){
    $('.indtotal').text(response);
}
function handleEditCart(response){
   
    var tmpArray = explodeArray(response,'&');
    var proj4_data = new Array();
    var proj_data = new Array();
    for(var i=0; i < tmpArray.length; i++) {
        innerArray = explodeArray(tmpArray[i],'=');
        proj4_data[i] = innerArray;
        }
   
	$('#count').html("Your Cart:"+proj4_data[1][1]);
    var url = "GetTotalCost";
    $.get(url,handleTotalCost);
   
}
function handleRemoveCart(response){
    
   var tmpArray = explodeArray(response,'&');
    var proj4_data = new Array();
    var proj_data = new Array();
    for(var i=0; i < tmpArray.length; i++) {
        innerArray = explodeArray(tmpArray[i],'=');
        proj4_data[i] = innerArray;
        }

	$('#count').html("Your Cart:"+proj4_data[1][1]);
    if(proj4_data[1][1] == 0){
        $('.catalog').html("<h1>Your Shopping cart is empty!! </h1>");
        $('.reviewempty').hide();
    
    }
    var url = "GetTotalCost";
    $.get(url,handleTotalCost);
}
function handleTotalCost(response){

    $('.sidecost').html(response);

}
function handleCount(response) {

    var tmpArray = explodeArray(response,'&');
    var proj4_data = new Array();
    var proj_data = new Array();
    for(var i=0; i < tmpArray.length; i++) {
        innerArray = explodeArray(tmpArray[i],'=');
        proj4_data[i] = innerArray;
        }
    $('.indtotal').text(proj4_data[0][1]);
	$('#count').html("Your Cart:"+proj4_data[1][1]);
	}	

function explodeArray(item,delimiter) {
tempArray=new Array(1);
var Count=0;
var tempString=new String(item);

while (tempString.indexOf(delimiter)>0) {
tempArray[Count]=tempString.substr(0,tempString.indexOf(delimiter));
tempString=tempString.substr(tempString.indexOf(delimiter)+1,tempString.length-tempString.indexOf(delimiter)+1);
Count=Count+1
}

tempArray[Count]=tempString;
return tempArray;
}     
  