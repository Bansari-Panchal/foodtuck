class Category < ApplicationRecord
  has_and_belongs_to_many :vendors
 # join_table: 'categories_vendors'
end
