class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state_name
      t.string :state_code
      t.string :country_name

      t.timestamps
    end
  end
end
