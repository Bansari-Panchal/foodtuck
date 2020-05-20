class CreateTaxes < ActiveRecord::Migration[6.0]
  def change
    create_table :taxes do |t|
      t.string :desc
      t.decimal :amount
      t.boolean :is_percentage
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
