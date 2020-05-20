class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :vendor, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :cost_in_dollars
      t.integer :position
      t.boolean :availability

      t.timestamps
    end
  end
end
