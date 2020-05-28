class RemoveFeaturedImageUpdatedAtFromVendor < ActiveRecord::Migration[6.0]
  def change

    remove_column :vendors, :featured_image_updated_at, :datetime
  end
end
