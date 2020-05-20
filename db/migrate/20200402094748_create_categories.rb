class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :position
      t.boolean :is_active

      t.timestamps
    end
  end
end
