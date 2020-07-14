// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery-ui")
import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;

require("imports-loader")
import 'imports-loader?define=>false,module.exports=>false!jquery-validation';

import 'bootstrap'
import '../stylesheets/application'
import "cocoon"; 

//require('imports-loader?define=>false!jquery.validate')(window, $)
//= require bootstrap
//= require rails-ujs
//= require jquery
//= require jquery-ui/widgets
//= require jquery-ui/sortable
//= require jquery_ujs
//= require popper.js
//= require html.sortable
//= require tether
//= require_tree .

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
document.addEventListener("turbolinks:load", function() {

  $("#products").sortable({
    update: function(e, ui) {
      $.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable('serialize'),
      });
    }
  });

  $("#choices1").sortable({
    update: function(e, ui) {
      $.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable('serialize'),
      });
    }
  });



$("a#like").on('click',function() { 
  $('.toast').toast('show'); 
  $(this).find('i').addClass('active');
}); 

$('a#dislike').on('click', function() {
  $('.t-header').empty().html("Removed from favorites")
  $('.toast-body').empty().html("Menu item removed from favorites")
  $('.toast').toast('show');
  $(this).find('i').removeClass('active');
});

$("a#vlike").on('click',function() { 
  $('.toast').toast('show'); 
  $(this).find('i').addClass('active'); 
  $(this).attr('id' , 'vdislike');
  //alert("LIKED : " + $(this).find("input#vendor_id").val());
  //$(this).replaceWith('<a id="vdislike" rel="nofollow" data-method="delete" href="/likes/1?likeable_id=1&amp;likeable_type=Vendor&amp;vendor_id=1"><i class="fa fa-heart active"></i></a>');
});

$('a#vdislike').on('click', function() {
  $('.t-header').empty().html("Removed from favorites")
  $('.vtoast-body').empty().html("Foodtruck removed from favorites")
  $('.toast').toast('show');
  $(this).find('i').removeClass('active');
  $(this).attr('id' , 'vlike')
  $(this).attr('href','/likes/' + $(this).find("input#vendor_id").val()+ '?likeable_id=' + $(this).find("input#vendor_id").val() +'&likeable_type=Vendor&vendor_id=' + $(this).find("input#vendor_id").val());
   //alert("DISLIKE : " + $(this).find("input#vendor_id").val());
  //$(this).attr('data-method','post');
});
});
$(document).ready(function() {
  $("#new_user , #edit_user").validate({
   debug: false,  
   errorClass: 'error',
    rules: {
     "user[usename]": { required: true ,minlength: 5, maxlength: 20 } ,
     "user[email]": {  required: true,  email: true } , 
     "user[phone]" : { required: true , number: true , minlength:10 , maxlength: 10 },
     "user[password]" : {required: true , minlength: 6 , maxlength: 20 },
     "user[password_confirmation]" : { required: true, equalTo: '#user_password' }
          },
     messages:{
       "user[usename]" : {
         required: 'Please Enter Username',
         minlength: 'Username must be atleast 5 charachters long',
         maxlength: 'Username should not be longer than 20 characters'
       },
       "user[email]" : {
         required: 'Please Enter Email' , 
         email: 'Please Enter Valid Email'
       },
       "user[phone]" : {
         required: 'Please Enter Mobile Number',
         minlength:  'Mobile number must be 10 characters long ' ,
         maxlength: 'Mobile number must be 10 characters long ',
         number: 'Only numbers are allowed'
       },
       "user[password]" : {
         required: 'Please Enter Password' , 
         minlength: 'Password must be atleast 6 characters long ',
         mixlength: 'Password should not be longer than 20 charachters'
       },
       "user[password_confirmation]" : {
         required: 'Please Enter confirm password' , 
         equalTo: 'Confirm password must be same as password'
       }
     }
  });  

  $("#new_product,#edit_product").validate({
    debug: false,
    errorClass: 'error',
     rules: {
      "product[name]": { required: true ,minlength: 5, maxlength: 20 } ,
      "product[cost_in_dollars]": {  required: true, number: true } , 
      "product[description]" : { required: true  },
      "product[menu_category]" : {required: true},
      "product[item_tags]" : { required: true ,minlength: 5, maxlength: 20 } 
           },
      messages:{
        "product[name]" : {
          required: 'Please Enter productname',
          minlength: 'productname must be atleast 5 charachters long',
          maxlength: 'productname should not be longer than 20 characters'
        },
        "product[cost_in_dollars]" : {
          required: 'Please Enter Product cost',
          number: 'Only numbers are allowed'
        },
        "product[description]" : {
          required: 'Please Enter Description' , 
        },
        "product[menu_category]" : {
          required: 'Please Select  Categories' 
        },
        "product[item_tags]" : {
         required: 'Please Enter Item tag',
         minlength: 'productname must be atleast 5 charachters long',
         maxlength: 'productname should not be longer than 20 characters'
       }
      }
    });
    
    $("#new_vendor,#edit_vendor").validate({
      debug: false,
      errorClass: 'error',
       rules: {
        "vendor[name]": { required: true ,minlength: 5, maxlength: 20 } ,
        "vendor[tagline]": { required: true } ,
        "vendor[description]" : { required: true  },
        "vendor[order_fulfillment_time_in_minutes]" : {required: true},
        "vendor[category_ids[]]" : { required: true ,minlength: 2, maxlength: 2 },
        "vendor[price_point]" : {required: true} 
             },
        messages:{
          "vendor[name]" : {
            required: 'Please Enter Foodtruckname',
            minlength: 'vendorname must be atleast 5 charachters long',
            maxlength: 'vendorname should not be longer than 20 characters'
          },
          "vendor[tagline]" : {
            required: 'Please Enter Foodtruck tagline',
          },
          "vendor[description]" : {
            required: 'Please Enter Description' , 
          },
          "vendor[order_fulfillment_time_in_minutes]" : {
            required: 'Please Select Time' 
          },
          "vendor[category[]]" : {
            required: 'Please select at least two types of categories.',
          },
          "vendor[price_point]" : {
            required: 'Please Enter Description' , 
          }
          
        }
      });  
      $("#new_tax,#edit_tax").validate({
        debug: false,
        errorClass: 'error',
         rules: {
          "vendor[tax[desc]]": { required: true ,minlength: 5, maxlength: 20 } ,
          "vendor[tax[amount]]": { required: true ,number: true } ,
          "vendor[tax[terms]] " : { required: true  }
          },
          messages:{
            "vendor[tax[desc]]" : {
              required: 'Please Enter Description',
              minlength: 'Description must be atleast 5 charachters long',
              maxlength: 'Description should not be longer than 20 characters'
            },
            "vendor[tax[amount]]" : {
              required: 'Please Enter Foodtruck tagline',
              number: 'Only numbers are allowed'
            },
            "vendor[tax[terms]]" : {
              required: 'Please agree terms and condition' , 
            }
          }
        });  
});
