/* Name :Kavitha Venkatesan
   Class Account :jadrn045
   Semester: Fall 2016
   Project#4 */


$(document).ready(function() {
   
   // Set initial focus
   $('#fname').focus();
 
   // Bind "submit" event handler to form

   $(':submit').on('click',function(e){
      var $form = $('#my_form');
      var isValidForm = validData($form);
       if(isValidForm){
        $('#my_form').submit();
       }
       else{
           return false;
       }
     }); 

   // Bind "click" event handler to "reset" button
   $('#resetButton').on('click', function() {
      $('.errorBox').removeClass('errorBox');  // remove the error styling
      $('div[id$="message"]').html('');
      $('#fname').focus();  // Set focus element
   });
    
    $('#consubmit').on('click',function(e){
      var $form = $('#contact_form');
        var isValidForm = false;
        if($form.find('#fname').val() && $form.find('#email').val() && $form.find('#comments').val()){
           isValidForm = true; 
        }
       if(isValidForm){
         $('#error_message').text("");
        $('#contactmessage').text("Thank you for contacting us.We will keep in touch with you soon.Have a great day.");
        $form.find('#fname').val("");
        $form.find('#email').val("");
        $form.find('#comments').val("");
       }
       else{
           $('#error_message').text("Please fill all the required fields");
       }
     }); 
    $('#conreset').on('click',function(e){
      var $form = $('#contact_form');
       
        $('#error_message').text("");
        $form.find('#fname').val("");
        $form.find('#email').val("");
        $form.find('#comments').val("");
      
     }); 

});

function postValidate(isValid, errMsg, errElm, inputElm) {
   if (!isValid) {
      // Show errMsg on errElm, if provided.
      if (errElm !== undefined && errElm !== null
            && errMsg !== undefined && errMsg !== null) {
         errElm.html(errMsg);
      }
      // Set focus on Input Element for correcting error, if provided.
      if (inputElm !== undefined && inputElm !== null) {
         inputElm.addClass("errorBox");  // Add class for styling
         inputElm.focus();
      }
   } else {
      // Clear previous error message on errElm, if provided.
      if (errElm !== undefined && errElm !== null) {
         errElm.html('');
      }
      if (inputElm !== undefined && inputElm !== null) {
         inputElm.removeClass("errorBox");
      }
   }
}

function isNotEmpty(inputElm, errMsg, errElm) {
   var isValid = (inputElm.val().trim() !== "");
   postValidate(isValid, errMsg, errElm, inputElm);
   return isValid;
}

/* Validate that input value contains one or more digits */
function isNumeric(inputElm, errMsg, errElm) {
   var isValid = (inputElm.val().trim().match(/^\d+$/) !== null);
   postValidate(isValid, errMsg, errElm, inputElm);
   return isValid;
}
 
/* Validate that input value contains only one or more letters */
function isAlphabetic(inputElm, errMsg, errElm) {
    var isValid = (inputElm.val().trim().match(/^[a-zA-Z]+[\-'.\s]?[a-zA-Z ]*$/) !== null) ;
   postValidate(isValid, errMsg, errElm, inputElm);
   return isValid;
}
 
/* Validate that input value length is between minLength and maxLength */
function isLengthMinMax(inputElm, minLength, maxLength, errMsg, errElm) {
   var inputValue = inputElm.val().trim();
   var isValid = (inputValue.length >= minLength) && (inputValue.length <= maxLength);
   postValidate(isValid, errMsg, errElm, inputElm);
   return isValid;
}
  
/*
 * Validate that a selection is made (not default of "") in <select> input
 */
function isSelected(selectElm, errMsg, errElm) {
   var isValid = (selectElm.val() !== "");   // value in selected <option>
   postValidate(isValid, errMsg, errElm, selectElm);
   return isValid;
}
 
/*
 * Validate that one of the radio buttons is checked.
 */
function isChecked(inputElms, errMsg, errElm) {
   var isChecked = inputElms.length > 0;
   postValidate(isChecked, errMsg, errElm, null);  // no focus element
   return isChecked;
}
 
function isValidYear(inputElm, errMsg, errElm){
    var isValid = checkYear(inputElm.val().trim());
    postValidate(isValid, errMsg, errElm, inputElm);
   return isValid;
    
}

function checkYear(dob){

       var dateformat = /^(20)[0-9][0-9]$/;
          
               if(dob.match(dateformat)){
               return true;
          }
          else
          {
              return false;
          }   
}
function isValidMonth(inputElm, errMsg, errElm){
    var isValid = checkMonth(inputElm.val().trim());
    postValidate(isValid, errMsg, errElm, inputElm);
   return isValid;
    
}
// Validate that input value is a valid email address
function isValidEmail(inputElm, errMsg, errElm) {
   var emailFormat = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
   var isValid = (inputElm.val().trim().match(emailFormat));
   postValidate(isValid, errMsg, errElm, inputElm);
   return isValid;
}
function checkMonth(dob){

       var dateformat = /^(0?[1-9]|1[012])$/;
        
               if(dob.match(dateformat)){
               return true;
          }
          else
          {
              return false;
          }   
}

function validData($form){
    
    var isValidFormData = false;
     isValidFormData = isNotEmpty($form.find('#fname'), "Please enter your first name!",
               $form.find('#error_message'))
            && isAlphabetic($form.find('#fname'), "First name may have only alpahabets and spaces!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#lname'), "Please enter your last name!",
               $form.find('#error_message'))
            && isAlphabetic($form.find('#lname'), "Last name may have only alpahabets and spaces!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#address'), "Please enter your address!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#city'), "Please enter your city!",
               $form.find('#error_message'))
            && isAlphabetic($form.find('#city'), "City may have only alpahabets and spaces!",
               $form.find('#error_message'))
            && isSelected($form.find('#state'), "Please select your state!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#zip'), "Please enter your zip code!",
               $form.find('#error_message'))
            && isNumeric($form.find('#zip'), "Please enter a valid zip code!",
               $form.find('#error_message'))
            && isLengthMinMax($form.find('#zip'), 5, 5, "Please enter a 5-digit zip code!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#area'), "Please enter your area number!",
               $form.find('#error_message'))
            && isNumeric($form.find('#area'), "Please enter a valid area number!",
               $form.find('#error_message'))
            && isLengthMinMax($form.find('#area'), 3, 3, "Please enter a 3-digit area code!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#prefix'), "Please enter your prefix number!",
               $form.find('#error_message'))
            && isNumeric($form.find('#prefix'), "Please enter a valid prefix number!",
               $form.find('#error_message'))
            && isLengthMinMax($form.find('#prefix'), 3, 3, "Please enter a 3-digit prefix code!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#phone'), "Please enter your phone number!",
               $form.find('#error_message'))
            && isNumeric($form.find('#phone'), "Please enter a valid phone number!",
               $form.find('#error_message'))
            && isLengthMinMax($form.find('#phone'), 4, 4, "Please enter a 4-digit phone number!",
               $form.find('#error_message'))
            && isChecked($form.find('[name="payment"]:checked'), "Please check a payment type!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#card'), "Please enter your credit card number!",
               $form.find('#error_message'))
            && isNumeric($form.find('#card'), "Please enter a valid credit card number!",
               $form.find('#error_message'))
            && isLengthMinMax($form.find('#card'), 16, 16, "Please enter a 16-digit card number!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#month'), "Please enter your expiration month!",
               $form.find('#error_message'))
            && isNumeric($form.find('#month'), "Please enter a valid expiration month!",
               $form.find('#error_message'))
            && isLengthMinMax($form.find('#month'), 2, 2, "Please enter a 2-digit expiration month!",
               $form.find('#error_message'))
            && isValidMonth($form.find('#month'), "Please enter a valid expiration month!",
               $form.find('#error_message'))
            && isSelected($form.find('#expiration'), "Please select your expiration year!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#bfname'), "Please enter your first name!",
               $form.find('#error_message'))
            && isAlphabetic($form.find('#bfname'), "First name may have only alpahabets and spaces!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#blname'), "Please enter your last name!",
               $form.find('#error_message'))
            && isAlphabetic($form.find('#blname'), "Last name may have only alpahabets and spaces!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#baddress'), "Please enter your address!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#bcity'), "Please enter your city!",
               $form.find('#error_message'))
            && isAlphabetic($form.find('#city,#bcity'), "City may have only alpahabets and spaces!",
               $form.find('#error_message'))
            && isSelected($form.find('#bstate'), "Please select your state!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#bzip'), "Please enter your zip code!",
               $form.find('#error_message'))
            && isNumeric($form.find('#zip,#bzip'), "Please enter a valid zip code!",
               $form.find('#error_message'))
            && isLengthMinMax($form.find('#bzip'), 5, 5, "Please enter a 5-digit zip code!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#barea'), "Please enter your area number!",
               $form.find('#error_message'))
            && isNumeric($form.find('#barea'), "Please enter a valid area number!",
               $form.find('#error_message'))
            && isLengthMinMax($form.find('#barea'), 3, 3, "Please enter a 3-digit area code!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#bprefix'), "Please enter your prefix number!",
               $form.find('#error_message'))
            && isNumeric($form.find('#bprefix'), "Please enter a valid prefix number!",
               $form.find('#error_message'))
            && isLengthMinMax($form.find('#bprefix'), 3, 3, "Please enter a 3-digit prefix code!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#bphone'), "Please enter your phone number!",
               $form.find('#error_message'))
            && isNumeric($form.find('#bphone'), "Please enter a valid phone number!",
               $form.find('#error_message'))
            && isNotEmpty($form.find('#email'), "Please enter your email!",
               $form.find('#error_message'))
            && isValidEmail($form.find('#email'), "Please enter a valid email!",
               $form.find('#error_message'));
    return isValidFormData;
    
}