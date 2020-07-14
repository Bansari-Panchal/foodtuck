class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.decimal :cost_in_dollars,:precision => 6,:scale => 2
      t.string :description
      t.string :special_instruction
      t.integer :quantity
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
