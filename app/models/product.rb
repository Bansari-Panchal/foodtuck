class Product < ApplicationRecord
  belongs_to :vendor
  has_many  :choices , dependent: :destroy ,inverse_of: :product
  accepts_nested_attributes_for :choices , allow_destroy: true , reject_if: proc { |att| att['name'].blank? }
  has_one_attached :item_image
  has_many :likes, as: :likeable
end
