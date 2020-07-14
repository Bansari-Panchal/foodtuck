class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.search(search)
    #self.includes(:product).where("vendors.name LIKE ? OR products.name LIKE ?",  "%#{search}%",  "%#{search}%")
    #where("name LIKE ?", "%#{search}%")
    where(id:Product.select(:vendor_id).where("name LIKE ?", "%#{search}%"))
  end
end
