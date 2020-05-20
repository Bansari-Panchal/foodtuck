class AddAttachmentFeaturedImageToVendors < ActiveRecord::Migration[6.0]
  def self.up
    change_table :vendors do |t|
      t.attachment :featured_image
    end
  end

  def self.down
    remove_attachment :vendors, :featured_image
  end
end
