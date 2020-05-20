class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.string :name
      t.boolean :allow_multiple
      t.integer :position
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
