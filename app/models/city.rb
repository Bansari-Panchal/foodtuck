class City < ApplicationRecord
    belongs_to :vendor
    scope :name_like, -> (name) { where("name ilike ?", name)}
	def to_s
		name
    end

end
