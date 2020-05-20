class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :tagline
      t.text :description
      t.integer :order_fulfillment_time_in_minutes
      t.integer :price_point
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
