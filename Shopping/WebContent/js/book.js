
/* Name :Kavitha Venkatesan
   Class Account :jadrn054
   Semester: Spring 2017
   Project#3 */

$(document).ready(function() {
$( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "blind",
        duration: 1000
      }
    });
 $( "#dialog" ).dialog( "option", "height", 800 );
 $( "#dialog" ).dialog( "option", "width", 600 );
  $( "#opener" ).on( "click", function() {

      $( "#dialog" ).dialog( "open" );
      
    }); 

$("#menu").on('click', function() {
         var x = $("#myTopnav");
    if($(".topnav")){
        x.addClass("responsive");
    }     
  });
    
$("#billing").on("click",function(e){
    if($('#billing').is(':checked')){
      
    var bfname = $("#fname").val();
    if(bfname != ""){$("#bfname").val(bfname);}
    var blname = $("#lname").val();
    if(blname != ""){$("#blname").val(blname);}
    var baddress = $("#address").val();
    if(baddress != ""){$("#baddress").val(baddress);}
    var baddress2 = $("#address2").val();
    if(baddress2 != ""){$("#baddress2").val(baddress2);}
    var bcity = $("#city").val();
    if(bcity != ""){$("#bcity").val(bcity);}
    var bstate = $("#state").val();
    if(bstate != ""){$("#bstate").val(bstate);}
    var bzip = $("#zip").val();
    if(bzip != ""){$("#bzip").val(bzip);}
    var bprefix = $("#prefix").val();
    if(bprefix != ""){$("#bprefix").val(bprefix);}
    var barea = $("#area").val();
    if(barea != ""){$("#barea").val(barea);}
    var bphone = $("#phone").val();
    if(bphone != ""){$("#bphone").val(bphone);}
    }
});
    
$('#senddata').click(function() {
    window.location.href = 'products.html';
    return false;
});

     
});




