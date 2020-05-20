class AddItemtypeToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :is_catering, :boolean
  end
end
