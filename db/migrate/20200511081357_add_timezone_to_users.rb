class AddTimezoneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :timezone, :timestamp
    add_column :users, :birthdate, :date
  end
end
