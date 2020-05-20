class RemoveFeaturedFromVendors < ActiveRecord::Migration[6.0]
  def change

    remove_column :vendors, :featured_image, :string
  end
end
