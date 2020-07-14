<h3>Taxes and Fees</h3>

    <div class="field"><%= f.label :description %><br />
    <%= f.text_field :desc %>
    </div>
      </br>
    <div class="field"><%= f.label :Amount %><br />
    <%= f.text_field :amount %>
    </div>
      </br>
    
    <div class="field">
    <%= f.radio_button :tax_type, 'Percentage' %> Percentage
    <%= f.radio_button :tax_type, 'Flat Amount' %> Flat Amount
    </div>

    <div class="field">
        <%= f.label "I agree to the Vendor Terms of Service" %> <br />
        <%= f.check_box :terms, {}, true, false %> <br />
    </div>
----------------------------------------------------------------------------
<!DOCTYPE html>
<html>
  <head>
    <title>DevisePro</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>
    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'product' %>
    <%= javascript_pack_tag 'autocomplete-rails.js' %>

  </head>

  <body>
<b class="notice"><%= notice %></b>
<b class="alert"><%= alert %></b>
<% if user_signed_in? %>
           <li>
            Logged in as <strong><%= current_user.name %></strong>
          </li>   
      <ul class="nav nav-tabs">
          <li class="nav-item" >
            <%= link_to 'Edit profile', edit_user_path(current_user), :class => 'nav-link' %>
          </li>
          <li class="nav-item">
            <%= link_to "Logout", destroy_user_session_path, method: :delete, :class => 'nav-link'  %>
          </li>
          <li class="nav-item">
          <%= link_to "Become Vendor?", new_vendor_path(current_user), :class => 'nav-link'  %>
          </li>
          
      <% else %>
          <li class="nav-item">
          <%= link_to "Sign up", new_user_registration_path, :class => 'nav-link'  %>
          </li>
          <li class="nav-item">
          <%= link_to "Login", new_user_session_path, :class => 'nav-link'  %>
          </li>
      <% end %>
</ul>

    <%= yield %>
  </body>
</html>
-----------------------------------------------------------------------------
<% @vendors.each do |vendor| %>
  <% if vendor.user_id == current_user.id %>
    <div align="right">
    <%= link_to 'Vendor Dashboard',vendor_path(vendor) , class:"btn btn-primary"%><br>
    </div>
  <% end %>
<% end %>
-----------------------------------------------------------------------------------
<div class="col-md-6">
          <% if user_signed_in? %>
              <%= link_to 'Home',vendors_path(current_user), class: 'btn btn-default'%>
              &nbsp &nbsp
              <%= link_to 'User Dashboard',edit_user_path(current_user), class: 'btn btn-default'%>
              &nbsp &nbsp
              <% if current_user.vendor %>
              <%= link_to 'Vendor Dashboard' , vendor_path(current_user.vendor),class: 'btn btn-default' %>
          <% else %>
             <%= link_to 'Become vendor ?' , new_vendor_path ,class: 'btn btn-default' %>
            <% end %>
          <% end %>
        </div>
  ------------------------
  require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("jquery-ui")
require("imports-loader")
require('bootstrap/js/dist/modal')
-------------------------------------------------------
<%if false %>
<div class="col-md-3">
<% Product.all.where(:vendor_id => @vendor.id).each do |p| %>
  <h3><%= p.menu_category %></h3>
    <div class="item-box">
      <% if Like.where(likeable_type: 'Product' , likeable_id: p.id , user_id: current_user.id).exists? %>
        <%= link_to like_path(p, vendor_id: @vendor.id, likeable_type: 'Product' , likeable_id: p.id), method: :delete , id: 'dislike' do %>
        <i class="fa fa-heart active" ></i>
        <% end %>
      <% else %>  
        <%= link_to likes_path(vendor_id: @vendor.id, likeable_type: 'Product' , likeable_id: p.id), method: :post , id: 'like' do %>
          <i class="fa fa-heart"></i>
        <% end %> 
      <% end %> 
      <div class="badge bg-info">$<%= p.cost_in_dollars %></div>
      <%= image_tag(p.item_image , size: 200) if p.item_image.attached? %>
      <div class="itemTags">
        <h6><%= p.name %></h6>  
        <h5 align="right"><%= link_to 'Add' , vendor_products_path(@vendor)%></h5>
      </div>
    </div>
    </br> 
<%end%>  
</div>
<% end %>
---------------------------------------------------
<div class="row">
  <div class="col-md-3">
    <div class="vertical-nav" id="sidebar">
      <ul class="nav flex-column mb-0">
        <% @categories.each do |p| %>
        <li class="nav-item "> 
          <a class="nav-link" href="#" align="right"><%= p.menu_category %></a> 
        <% end %>
        </li>
      </ul>
    </div>
  </div>
  <div class="vl"></div>
<div class="col-md-4">
  <div class="row">
    <div class="col-md-3">
      <% @categories.each do |c| %>
      <h3><%= c.menu_category %></h3>
      <br>
        <% Product.all.where(:vendor_id => @vendor.id).each  do |p| %>
          <% if c.menu_category == p.menu_category %>
            <div class="item-box">
            <% if Like.where(likeable_type: 'Product' , likeable_id: p.id , user_id: current_user.id).exists? %>
              <%= link_to like_path(p, vendor_id: @vendor.id, likeable_type: 'Product' , likeable_id: p.id), method: :delete , id: 'dislike' do %>
              <i class="fa fa-heart active" ></i>
              <% end %>
            <% else %>  
              <%= link_to likes_path(vendor_id: @vendor.id, likeable_type: 'Product' , likeable_id: p.id), method: :post , id: 'like' do %>
                <i class="fa fa-heart"></i>
              <% end %> 
            <% end %> 
            <div class="badge bg-info">$<%= p.cost_in_dollars %></div>
            <%= image_tag(p.item_image , size: 200) if p.item_image.attached? %>
            <div class="itemTags">
              <h6><%= p.name %></h6>  
              <h5 align="right"><%= link_to 'Add' , vendor_products_path(@vendor)%></h5>
            </div>
          </div>
          <% end %>
        <% end %>
        <br>
      <% end %>
    </div>
  </div>
</div>
</div>

 
 