class CreateLineItemOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :line_item_options do |t|
      t.string :description
      t.decimal :cost_in_dollars
      t.references :option, null: false, foreign_key: true
      t.references :line_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
