class Choice < ApplicationRecord
  belongs_to :product ,optional: true
  has_many  :options , dependent: :destroy ,inverse_of: :choice
  accepts_nested_attributes_for :options , allow_destroy: true , reject_if: proc { |att| att['name'].blank? }
end
