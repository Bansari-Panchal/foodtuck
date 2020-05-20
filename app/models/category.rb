class Category < ApplicationRecord
  has_and_belongs_to_many :vendors,
  join_table: 'vendors_categories'
end
