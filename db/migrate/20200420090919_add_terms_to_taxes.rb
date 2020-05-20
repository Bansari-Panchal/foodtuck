class AddTermsToTaxes < ActiveRecord::Migration[6.0]
  def change
    add_column :taxes, :terms, :boolean
  end
end
