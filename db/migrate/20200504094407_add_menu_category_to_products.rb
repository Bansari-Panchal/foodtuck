class AddMenuCategoryToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :menu_category, :string
    add_column :products, :item_tags, :string
    add_column :products, :popular, :boolean
  end
end
