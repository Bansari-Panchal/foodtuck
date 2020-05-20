class RemoveItemImageFromProducts < ActiveRecord::Migration[6.0]
  def change

    remove_column :products, :item_image_file_name, :string

    remove_column :products, :item_image_content_type, :string

    remove_column :products, :item_image_file_size, :integer

    remove_column :products, :item_image_updated_at, :datetime
  end
end
