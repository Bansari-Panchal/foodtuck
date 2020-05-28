class RemoveFeaturedImageFileSizeFromVendor < ActiveRecord::Migration[6.0]
  def change

    remove_column :vendors, :featured_image_file_size, :bigint
  end
end
