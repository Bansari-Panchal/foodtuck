// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("imports-loader")


import 'imports-loader?define=>false,module.exports=>false!jquery-validation';
//= require cocoon
//= require jquery3
//= require jquery_ujs
//= require_tree
//= require jquery.validate
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
$(document).ready(function() {
  $("#new_user , #edit_user").validate({
   debug: false,
   errorClass: 'error',
    rules: {
     "user[name]": { required: true ,minlength: 5, maxlength: 20 } ,
     "user[email]": {  required: true,  email: true } , 
     "user[phone]" : { required: true , number: true , minlength:10 , maxlength: 10 },
     "user[password]" : {required: true , minlength: 6 , maxlength: 20 },
     "user[password_confirmation]" : { required: true, equalTo: '#user_password' }
          },
     messages:{
       "user[name]" : {
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
  });


