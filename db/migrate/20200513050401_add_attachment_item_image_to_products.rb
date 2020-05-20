class AddAttachmentItemImageToProducts < ActiveRecord::Migration[6.0]
  def self.up
    change_table :products do |t|
      t.attachment :item_image
    end
  end

  def self.down
    remove_attachment :products, :item_image
  end
end
