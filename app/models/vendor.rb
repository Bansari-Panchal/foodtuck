class Vendor < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  #join_table: 'categories_vendors'
  #join_table: 'vendors_categories'
  has_many :cities ,dependent: :destroy
  has_many :products ,dependent: :destroy
  has_one  :tax , dependent: :destroy
  accepts_nested_attributes_for :tax
  accepts_nested_attributes_for :products
  has_one_attached :featured_image
  has_many :likes, as: :likeable

  
end
# where("name LIKE ?", "%#{search}%")