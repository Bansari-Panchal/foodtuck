class RemoveFeaturedImageContentTypeFromVendor < ActiveRecord::Migration[6.0]
  def change

    remove_column :vendors, :featured_image_content_type, :string
  end
end
