class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :name
      t.decimal :cost_in_dollars
      t.integer :position
      t.references :choice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
