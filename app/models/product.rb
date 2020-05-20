class Product < ApplicationRecord
  belongs_to :vendor
  has_many  :choices , dependent: :destroy ,inverse_of: :product
  accepts_nested_attributes_for :choices , allow_destroy: true , reject_if: proc { |att| att['name'].blank? }
  
  attr_accessor :item_image
has_attached_file :item_image, :styles => { :medium => "300x300>", :thumb => "100x100#" }
validates_attachment_content_type :item_image, :content_type => /\Aimage\/.*\Z/
end
