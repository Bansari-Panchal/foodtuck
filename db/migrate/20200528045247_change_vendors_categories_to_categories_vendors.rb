class ChangeVendorsCategoriesToCategoriesVendors < ActiveRecord::Migration[6.0]
  def change
    rename_table :vendors_categories, :categories_vendors
  end
end
