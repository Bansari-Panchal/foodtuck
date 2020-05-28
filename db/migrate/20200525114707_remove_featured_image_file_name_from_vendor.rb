class RemoveFeaturedImageFileNameFromVendor < ActiveRecord::Migration[6.0]
  def change

    remove_column :vendors, :featured_image_file_name, :string
  end
end
