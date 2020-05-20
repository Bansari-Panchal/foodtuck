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


    
 
 