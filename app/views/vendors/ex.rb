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

    
 
 