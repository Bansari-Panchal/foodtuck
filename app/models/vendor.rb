class Vendor < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories,
  join_table: 'vendors_categories'
  has_many :cities ,dependent: :destroy
  has_many :products ,dependent: :destroy
  has_one  :tax , dependent: :destroy
  accepts_nested_attributes_for :tax
  accepts_nested_attributes_for :products

  attr_accessor :featured_image
  has_attached_file :featured_image
  validates_attachment_content_type :featured_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("name LIKE ?", "%#{search}%")
    #Vendor.includes(:product).where('vendors.name LIKE ? OR products.name LIKE ?', "%#{search}%")
    
  end

end
# where("name LIKE ?", "%#{search}%")