class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :status, :default => 0,:null => false
      t.decimal :tip_in_dollar
      t.string :description
      t.datetime :completed_at
      t.datetime :pickup_at
      t.string :order_number
      t.boolean :sent_review_email,:default => false,:null => false
      t.string :order_note
      t.string :selected_tip
      t.integer :print_count,:default => 0,:null => false
      t.datetime :scedual_datetime
      t.references :user, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
