<%= %>
<%= link_to 'Add menu item', new_vendor_product_path(@vendor), class:"btn btn-primary"%><br>
<br>
<br>
<ul class="nav nav-tabs nav-line nav-color-primary bb-0",role="tablist" >
<li class="nav-item" >
 Regular
</li>
&nbsp&nbsp&nbsp&nbsp
<li class="nav-item">
Catering
</li>
</ul>
<br>
<br>
<table>
<div class="menu-whitebox">
<div class="card"> 
  <% @products.each do |p| %>
    
    <div class="productbox">
    <div class="row">
      <div class="col-md-3">
      <%=image_tag(p.item_image.url) %>
      </div>
      <div class="col-md-6">
      <h3><%= p.name %></h3>
      <strong>$ <%= p.cost_in_dollars %></strong>
      <div class="badge bg-info">
        <span class="badge-text">
          <%= p.menu_category %>
        </span>
      </div>
      <br /><br />
      <%= p.description %><br>
      <div class="itemTags">
                  <div class="badge bg-info">
                    <span class="badge-text">
                      <%= p.item_tags %>
                    </span>
                  </div>
                </div>
              </div>
      <br />
      <div class="col-md-3">
                Available
                <label class="switch checkbox-inline">
                  <% if p.availability == true %>
                    <%= check_box_tag :availability , true , checked: true %>
                  <% else %>
                    <%= check_box_tag :availability , false %>
                  <% end %>
                  <span class="slider round"></span>
                </label> 
                <br />
        <div class="col-sm-12" align="right"><%= link_to 'Edit ',edit_vendor_product_path(@vendor,p) , class:"btn btn-info" %>
        <% if p.choices.present? %>
        <%= link_to 'Choices' ,"href" => '#myModal' ,"data-target" => '#myModal' , class: 'btn btn-link', "data-toggle" => "modal"  do %>
        Choices &nbsp;<i class="fas fa-arrow-right ml-1"></i>
      <% end %>
      
    <div class="modal fade" id="myModal" value="<%= p.id %>"  role="dialog" >
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">All Choices</h4>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-6">
              <div class="item-choices">
                
                    <% p.choices.each do |c| %>
                        <h3><%= c.name %></h3>
                        <br />
                        <% c.options.each do |o| %>
                                <%= o.name %> - &nbsp;
                                $ &nbsp;<%= o.cost_in_dollars %>
                              <br />
                        <% end  %>
                    <% end %>
                  
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
    </div>
    </div>  
  <% end %>
        </div>
      </div>
      </div>
      </br>
  <% end %>
  </table>
  </div>
  ----------------------------------------
  <ul class="nav nav-tabs nav-line nav-color-primary bb-0",role="tablist" >
<li class="nav-item" >
 Regular
</li>
&nbsp&nbsp&nbsp&nbsp
<li class="nav-item">
Catering
</li>
</ul>